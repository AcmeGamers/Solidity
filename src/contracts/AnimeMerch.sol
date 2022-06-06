// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721Connector.sol';

abstract contract AnimeMerch is ERC721Connector {

    // Array to store our nfts
    string [] public merch;
    
    mapping(string => bool) _animeExists;
    
    function mint(string memory anime) public {
        require(!_animeExists[anime], 'Error - Anime already exists');
        merch.push(anime);
        uint _id = merch.length - 1;
        _mint(msg.sender, _id);
        _animeExists[anime] = true;
    }
    
    constructor() ERC721Connector('Anime', 'AnimeSybmol') {}
}


