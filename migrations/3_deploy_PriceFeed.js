var pf = artifacts.require("./Pricefeed.sol");

module.exports = function (deployer) {
  deployer.deploy(pf);
};
