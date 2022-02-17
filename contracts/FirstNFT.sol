// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract FirstNFT is ERC721URIStorage, Ownable {

    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    // Create Constructor to initiate Token Name and Symbol
    constructor() ERC721 ("Ayan Art", "AYT") {}

    function mintNFT(address recipient, string memory tokenURI) public onlyOwner returns(uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }


}