// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract creatNFT {
    uint private _tokenId = 0;
    mapping(uint => string) private _tokenURIs;

    function createTokenURI(string memory _tokenURI)
        public
        returns (uint, string memory)
    {
        _tokenURIs[_tokenId] = _tokenURI;
        _tokenId++;
        return (_tokenId, _tokenURI);
    }

    function getTokenURI(uint _tId) public view returns (string memory) {
        string memory _currentURI = _tokenURIs[_tId];
        return _currentURI;
    }

    function getAllTokenURIs() public view returns (string[] memory) {
        string[] memory uris = new string[](_tokenId);
        for (uint i = 0; i < _tokenId; i++) {
            uris[i] = _tokenURIs[i];
        }
        return uris;
    }
}
