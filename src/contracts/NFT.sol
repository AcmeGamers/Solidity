// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// Set Token URI
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// Easier to Implement Numbers
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    // _tokenIds will keep track of ID of NFt
    Counters.Counter private _tokenIds;
    // NFT Market will keep track of all the NFT
    address contractAddress;

    // Constructor will initialize the contract
    constructor (address marketplaceAddress) ERC721('Metaverse Tokens', 'NFT') {
        contractAddress = marketplaceAddress;
    }

    // Miniting new tokens
    function createToken(string memory tokenURI) public returns (uint) {
        // Set the token ID to the next available ID
        uint256 tokenId = _tokenIds.current();
        _tokenIds.increment();
        
        // Set the token URI
        _setTokenURI(tokenId, tokenURI);
        _mint(msg.sender, tokenId);
        setApprovalForAll(contractAddress, true);

        return tokenId;
    }
}
