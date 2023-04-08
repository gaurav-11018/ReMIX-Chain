// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, Ownable {
    uint256 private _currentTokenId = 0;

    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("RemixChain NFT", "RCNFT") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://example.com/token/";
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );

        string memory base = _baseURI();
        string memory tokenIdURI = _tokenURIs[tokenId];

        return string(abi.encodePacked(base, tokenIdURI));
    }

    function mintRemixNFT(
        address to,
        string memory tokenURI
    ) external onlyOwner returns (uint256) {
        uint256 newTokenId = _currentTokenId++;
        _safeMint(to, newTokenId);
        _tokenURIs[newTokenId] = tokenURI;
        return newTokenId;
    }

    function mintCollectibleNFT(
        address to,
        string memory tokenURI
    ) external onlyOwner returns (uint256) {
        uint256 newTokenId = _currentTokenId++;
        _safeMint(to, newTokenId);
        _tokenURIs[newTokenId] = tokenURI;
        return newTokenId;
    }
}
