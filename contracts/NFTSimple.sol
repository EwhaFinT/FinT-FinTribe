pragma solidity >=0.4.24 <=0.8.10;

contract NFTSimple {
    string public name = "Klaytn";
    string public symbol = "KLAY";

    mapping(uint256 => address) public tokenOwner;
    mapping(uint256 => string) public tokenURIs;

    mapping(address => uint256[]) private _ownedTokens;

    bytes4 private constant _KIP17_RECEIVED = 0x6745782b;

    //토큰 생성
    function mintWithTokenURI(address to, uint256 tokenId, string memory tokenURI) public returns(bool) {
        tokenOwner[tokenId] = to;
        tokenURIs[tokenId] = tokenURI;

        _ownedTokens[to].push(tokenId);

        return true;
    }
    //토큰 전송
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public {
        require(from == msg.sender, "from != msg.sender");
        require(from == tokenOwner[tokenId], "you are not the owner of the token");

        _removeTokenFromList(from, tokenId);
        _ownedTokens[to].push(tokenId);
        tokenOwner[tokenId] = to;

        require(
            _checkOnKIP17Received(from, to, tokenId, _data), "KIP17: transfer to non KIP!&Receiver implementer"
        );
    }
    function _checkOnKIP17Received(address from, address to, uint256 tokenId, bytes memory _data) internal returns (bool) {
        bool success;
        bytes memory returnData;

        if(!isContract(to)) {
            return true;
        }
        (success, returnData) = to.call(
            abi.encodeWithSelector(
                _KIP17_RECEIVED,
                msg.sender,
                from,
                tokenId,
                _data
            )
        );
        if (returnData.length != 0 && abi.decode(returnData, (bytes4)) == _KIP17_RECEIVED)
        {
            return true;
        }
        return false;
    }
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(account)}
        return size > 0;
    }
    function _removeTokenFromList(address from, uint256 tokenId) private {
        uint256 lastTokenIndex = _ownedTokens[from].length - 1;
        for(uint256 i= 0; i < _ownedTokens[from].length; i++) {
            if(tokenId == _ownedTokens[from][i]){
                _ownedTokens[from][i] = _ownedTokens[from][lastTokenIndex];
                _ownedTokens[from][lastTokenIndex] = tokenId;
                break;
            }
        }
        _ownedTokens[from].pop;
        //_ownedTokens[from].length--;
    }
    function ownedTokens(address owner) public view returns (uint256[] memory) {
        return _ownedTokens[owner];
    }
    function setTokenUri(uint256 id, string memory uri) public {
        tokenURIs[id]=uri;
    }
}


