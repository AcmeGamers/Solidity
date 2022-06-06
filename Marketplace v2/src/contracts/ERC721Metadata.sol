// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol';

abstract contract ERC721Metadata is IERC721Metadata {

    string private _name;
    string private _symbol;
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor(string memory named, string memory symbolified) {
        // _registerInterface(bytes4(keccak256('supportsInterface(bytes4)')));
        _registerInterface(bytes4(keccak256('name(bytes4)')^keccak256('symbol(bytes4)')));

        _name = named;
        _symbol = symbolified;
    }

    function _registerInterface(bytes4 interfaceId) internal {
        require(interfaceId != 0xffffffff, 'Invalid interface request');
        _supportedInterfaces[interfaceId] = true;
    }
}