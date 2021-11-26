const NFTMarket = artifacts.require("NFTMarket") ;

contract("NFTMarket" , () => {
    it("Hello World Testing" , async () => {
        const nftMarket = await NFTMarket.deployed() ;
        //await nftMarket.buyNFT(0,,);
        //await nftSimple.buyNFT(0, 1, 2);

    });
});