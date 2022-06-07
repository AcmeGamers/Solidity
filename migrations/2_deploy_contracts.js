const MFTMarket = artifacts.require("NFTMarket");

// module.exports = function (deployer) {
//   deployer
//     .deploy(MFTMarket) // Option 2) Console log the address:
//     .then(() => console.log(MFTMarket.address))

//     // Option 3) Retrieve the contract instance and get the address from that:
//     .then(() => MFTMarket.deployed())
//     .then((_instance) => console.log(_instance.address));
// };

module.exports = function (deployer) {
  deployer.deploy(MFTMarket);
};
