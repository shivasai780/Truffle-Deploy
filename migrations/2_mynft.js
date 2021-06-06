const MyNft = artifacts.require("MyNFT");

module.exports = function (deployer) {
  deployer.deploy(MyNft);
};
