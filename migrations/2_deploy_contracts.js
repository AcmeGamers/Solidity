const AnimeMerch = artifacts.require("AnimeMerch");

module.exports = function (deployer) {
  deployer
    .deploy(AnimeMerch) // Option 2) Console log the address:
    .then(() => console.log(AnimeMerch.address))

    // Option 3) Retrieve the contract instance and get the address from that:
    .then(() => AnimeMerch.deployed())
    .then((_instance) => console.log(_instance.address));
};
