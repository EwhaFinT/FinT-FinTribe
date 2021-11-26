pragma solidity >=0.4.24 <=0.8.10;
import "./NFTSimple.sol";

//컨트랙트 연동
contract NFTMarket {
    mapping(uint256 => address) public seller;

    function buyNFT(uint256 tokenId, address NFTAddress, address to) public payable returns (bool) {
        address payable receiver = payable(address(seller[tokenId]));
        //address payable receiver = address(uint256(seller[tokenId]));

        payable(receiver).transfer(1**16);

        NFTSimple(NFTAddress).safeTransferFrom(address(this), msg.sender, tokenId, '0x00');
        return true;
    }
    function onKIPReceived(address operator, address from, uint256 tokenId, bytes memory data) public returns (bytes4){
        seller[tokenId] = from;
        return bytes4(keccak256("onKIPReceived(address, address, uint256, bytes)"));
    }
}