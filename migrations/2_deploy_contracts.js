// artifacts - represents contract abstraction specific to truffle 
// Represents our smart contract, truffle will expose this so we can work with the contract 
var Election = artifacts.require("./Election.sol");
// directive to deploy the smart contract 
module.exports = function(deployer) {
  deployer.deploy(Election);
};
