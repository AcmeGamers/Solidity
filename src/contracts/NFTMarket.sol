// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// Easier to Implement Numbers
import "@openzeppelin/contracts/utils/Counters.sol";
// Security Mechanism
// Protects from multiple transactions
// Secures against malicious users
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract NFTMarket is ReentrancyGuard {

    using Counters for Counters.Counter;
    // Counters to keep the count
    Counters.Counter private _itemsIds;
    Counters.Counter private _itemsSold;

    address payable owner;
     uint256 listingPrice = 0.025 ether;

    constructor(){
        owner = payable(msg.sender);
    }
    
    // -----------
    // Marketplace
    // -----------
    // Struct are used to store the data of the item
    // getListingPrice() returns the price of the item
    // createMarketItem() creates a new item
    // createMarketSale() places a new sale on an item
     
    struct MarketItem {
        uint itemId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool isSold;
    }

    // Mapping will look for just the ids and 
    // will return all the data from the struct
    mapping(uint256 => MarketItem) private idToMarketItem;

    // Event for market item being created
    event MarketItemCreated (
        uint indexed itemId,
        address indexed nftContract,
        uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool isSold
    );

    // Function to return Listing Price
    function getListingPrice() public view returns (uint256) {
        return listingPrice;
    }

    // Function to create item
    function createMarketItem(address nftContract, uint256 tokenId, uint256 price) public payable nonReentrant {
        // Price must not be 0
        require(price > 0, "Price must be greater than 0");
        // Price must be eaul to listing price
        require(price == listingPrice, "Price must be equal to listing price");

        // Makes a new ID for the next iten that will be added using this function
        uint256 itemId = _itemsIds.current();
        _itemsIds.increment();

        // Creates a new item from scratch 
        // Since it is a new item, it has no previous owners
        // Means address(0) would be the previous owner that is 0x0 (no one to be exact)
        idToMarketItem[itemId] = MarketItem(
            itemId,
            nftContract,
            tokenId,
            payable(msg.sender),
            payable(address(0)),
            price,
            false
        );       
        
        // Emit the event
        IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);
        
        // Emit the event
        emit MarketItemCreated(
            itemId,
            nftContract,
            tokenId,
            msg.sender,
            address(0),
            price,
            false
        );
    }
    
    // Function to put item on sale
    function createMarketSale(address nftContract, uint256 itemId) public payable nonReentrant { 
        uint price = idToMarketItem[itemId].price;
        uint tokenId = idToMarketItem[itemId].tokenId;

        require(msg.value == price, "Price must be equal to listing price");
        
        idToMarketItem[itemId].seller.transfer(msg.value);
        IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);

        idToMarketItem[itemId].owner = payable(msg.sender);
        idToMarketItem[itemId].isSold = true;
        _itemsSold.increment();
        
        // Give the new owner the contract address
        payable(owner).transfer(listingPrice);
    }
     
    // -----------
    // Collections
    // -----------
    // FetchMarketItems() returns all the unsold items
    // Function that returns only the items the user have bought
    // Function that returns only the items the user have created

    function fetchMarketItems() public view returns (MarketItem[] memory) {
        uint itemCount = _itemsIds.current();
        uint unsoldItemCount = _itemsIds.current() - _itemsSold.current(); 
        uint currentIndex = 0;

        MarketItem[] memory items = new MarketItem[](unsoldItemCount);
        for (uint256 i = 0; i < itemCount; i++) {
            if (idToMarketItem[i].owner == address(0) && idToMarketItem[i].isSold == false) {
                uint currentItemId = idToMarketItem[i].itemId; 
                items[currentIndex] = idToMarketItem[currentItemId];
                currentIndex++;
            }
        }
        return items;
    }

    function fetchMarketItemsByOwner() public view returns (MarketItem[] memory) {
        uint itemCount = _itemsIds.current();
        uint unsoldItemCount = _itemsIds.current() - _itemsSold.current(); 
        uint currentIndex = 0;

        MarketItem[] memory items = new MarketItem[](unsoldItemCount);
        for (uint256 i = 0; i < itemCount; i++) {
            if (idToMarketItem[i].owner == owner && idToMarketItem[i].isSold == false) {
                uint currentItemId = idToMarketItem[i].itemId; 
                items[currentIndex] = idToMarketItem[currentItemId];
                currentIndex++;
            }
        }
        return items;
    }

    function fetchUserNFTs() public view returns (MarketItem[] memory) {
        uint totalItemCount = _itemsIds.current();
        uint itemCount = 0;      
        uint currentIndex = 0;
        
        MarketItem[] memory items = new MarketItem[](itemCount);
        for (uint256 i = 0; i < totalItemCount; i++) {
            if (idToMarketItem[i].owner == address(msg.sender)) {
                uint currentItemId = idToMarketItem[i].itemId; 
                MarketItem storage item = idToMarketItem[currentItemId];
                items[currentIndex] = item;
                currentIndex++;
            }
        }
        return items;
    }   

    function fetchItemsByUser() public view returns (MarketItem[] memory){
        uint totalItemCount = _itemsIds.current();
        uint itemCount = 0;      
        uint currentIndex = 0;
        
        MarketItem[] memory items = new MarketItem[](itemCount);
        for (uint256 i = 0; i < totalItemCount; i++) {
            if (idToMarketItem[i].seller == address(msg.sender)) {
                uint currentItemId = idToMarketItem[i].itemId; 
                MarketItem storage item = idToMarketItem[currentItemId];
                items[currentIndex] = item;
                currentIndex++;
            }
        }
        return items;
    }
}