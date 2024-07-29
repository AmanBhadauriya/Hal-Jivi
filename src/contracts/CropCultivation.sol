// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "./FarmerRegistry.sol";

contract CropCultivation {
    address owner;
    FarmerRegistry farmerRegistry;

    struct Transaction {
        uint amount;
        string description;
    }

    mapping(address => Transaction[]) transactions;

    uint public inflationRate;

    constructor(address _registryAddress) {
        owner = msg.sender;
        farmerRegistry = FarmerRegistry(_registryAddress);
        inflationRate = 5; // Default inflation rate (5%)
    }

    function setInflationRate(uint _rate) public {
        require(msg.sender == owner, "Only owner can set inflation rate");
        inflationRate = _rate;
    }

    function addTransaction(uint _amount, string memory _description) public {
        (uint farmerId, , ) = farmerRegistry.getFarmerDetails(msg.sender);
        require(farmerId != 0, "Farmer not registered");
        
        transactions[msg.sender].push(Transaction(_amount, _description));
    }

    function calculateMSP() public view returns (uint) {
        (uint farmerId, , ) = farmerRegistry.getFarmerDetails(msg.sender);
        require(farmerId != 0, "Farmer not registered");
        
        uint totalCost;
        Transaction[] memory farmerTransactions = transactions[msg.sender];
        for(uint i = 0; i < farmerTransactions.length; i++) {
            totalCost += farmerTransactions[i].amount;
        }
        return totalCost * (100 + inflationRate) / 100;
    }

    function deployMSP() public {
        (uint farmerId, , ) = farmerRegistry.getFarmerDetails(msg.sender);
        require(farmerId != 0, "Farmer not registered");

        uint msp = calculateMSP();
        // Deploy MSP to the blockchain 
    }
}
