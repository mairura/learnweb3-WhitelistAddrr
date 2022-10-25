const { ethers } = require("hardhat");

async function main() {
  /*
    A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,

  */
    const whitelistContract = await ethers.getContractFactory("Whitelist");

    //Deploy the contract
    const deployedWhitelistContract = await whitelistContract.deploy(10);
    //10 is the max number of whitelisted addresses allowed

    //Wait for it to be deployed
    await deployedWhitelistContract.deployed();

    //Print the address of the deployed contract
    console.log("Whitelist Contract Address: ", deployedWhitelistContract.address);
}

main().then(() => process.exit(0)).catch((error) => {
  console.error(error);
  process.exit(1);
})