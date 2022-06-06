// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721Connector.sol';

// Import Auth from the access-control subdirectory
// import "./access-control/Auth.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

contract AnimeMerch is ERC721Connector {

    // Array to store our nfts
    string [] public merch;
    
    mapping(string => bool) _animeExists;
    
    // Authentication contract
    // uint256 private _value;
    // Auth private _auth;

    
    function mint(string memory anime) public {
        require(!_animeExists[anime], 'Error - Anime already exists');
        merch.push(anime);
        uint _id = merch.length - 1;
        _mint(msg.sender, _id);
        _animeExists[anime] = true;
    }

    event ValueChanged(uint256 value);
    
    constructor() ERC721Connector('Anime', 'AnimeSybmol') {
        // _auth = new Auth(msg.sender);
    }

    // The onlyOwner modifier restricts who can call the store function
    // function store(uint256 value) public {
    //     // Require that the caller is registered as an administrator in Auth
    //     require(_auth.isAdministrator(msg.sender), "Unauthorized");

    //     _value = value;
    //     emit ValueChanged(value);
    // }

    // function retrieve() public view returns (uint256) {
    //     return _value;
    // }
}


