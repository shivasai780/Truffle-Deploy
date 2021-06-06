pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721,Ownable{
    using Counters for Counters.Counter;
    using Strings for uint256;
    Counters.Counter private _tokenIds;
    mapping(uint256 => string)private _tokenURIs;
    constructor() ERC721("MYNFT","MNFT"){

    }
    function _setTokenURI(uint256 _tokenId,string memory _tokenURI)internal virtual {

        _tokenURIs[_tokenId]=_tokenURI;
    }
    function tokenURI(uint256 tokenId)public view virtual override returns(string memory){
        require(_exists(tokenId),"ERC721 URI query for nonexistent tokenid");
        string memory _tokenURI=_tokenURIs[tokenId];
        return _tokenURI;
    }
    function mint(address recipient,string memory uri)public returns(uint256){
        _tokenIds.increment();
        uint256 newItemId=_tokenIds.current();
        _mint(recipient,newItemId);
        _setTokenURI(newItemId,uri);
        return newItemId;
    }
}