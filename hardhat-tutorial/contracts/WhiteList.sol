// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract Whitelist {
    //Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    //Mapping of the whiteAddresses, set to true if addresss is whitelisted or false if not
    mapping(address => bool) public whitelistedAddresses;

    //keeps track of the number of addresses that have been whitelisted
    uint8 public numAddressesWhitelisted;

    //Setting the max number of whitelisted addresses
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    //This function adds address of the sender to the whitelist
    function addAddressToWhitelist() public {
        //Check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        //Check if the numAddressesWhiteListed < maxWhitelistedAddresses, if not throw error
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");

        //Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;

        //Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}