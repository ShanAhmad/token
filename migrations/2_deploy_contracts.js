const LikonToken = artifacts.require("LikonToken");
const LikonTokenSale = artifacts.require("LikonTokenSale");

module.exports = function(deployer) {
    deployer.deploy(LikonToken, 1000000).then(function() {
        var tokenPrice = 1000000000000000;
        return deployer.deploy(LikonTokenSale, LikonToken.address, tokenPrice);
    });

};