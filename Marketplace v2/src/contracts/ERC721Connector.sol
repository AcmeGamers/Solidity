// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721Metadata.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';

contract ERC721Connector  is ERC721Metadata, ERC721Enumerable  {
  constructor(string memory name_, string memory symbol_) ERC721Metadata(name_, symbol_) {}
}
