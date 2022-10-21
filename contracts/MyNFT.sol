// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    string internal baseURI;
    uint256 public constant MAX_NFT_SUPPLY = 10;

    constructor(string memory _baseURI_) ERC721("MyNFT", "AOM") {
        baseURI = _baseURI_;
    }

    //Mint
    function mint(address _to) public {
        _tokenIds.increment();
        uint256 token_id = _tokenIds.current();
        require(token_id <= MAX_NFT_SUPPLY, "Max supply reached");
        _mint(_to, token_id);
        _setTokenURI(token_id, uri(token_id));
    }

    //Burn
    function burn(uint256 _token_id) public {
        require(
            _isApprovedOrOwner(_msgSender(), _token_id),
            "Caller is not owner nor approved"
        );
        _burn(_token_id);
    }

    //Token URI
    function uri(uint256 _id) public view returns (string memory) {
        return
            string(abi.encodePacked(baseURI, Strings.toString(_id), ".json"));
    }
}
