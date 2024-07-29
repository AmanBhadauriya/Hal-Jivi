// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "./FarmerRegistry.sol";

contract CultivatedLandVideo {
    address owner;
    FarmerRegistry farmerRegistry;

    struct LandVideo {
        address farmer;
        string videoHash; // Hash of the MP4 video file stored off-chain
    }

    mapping(uint => LandVideo) landVideos;
    uint public videoCount;

    constructor(address _registryAddress) {
        owner = msg.sender;
        farmerRegistry = FarmerRegistry(_registryAddress);
    }

    function addLandVideo(string memory _videoHash) public {
        (uint farmerId, , ) = farmerRegistry.getFarmerDetails(msg.sender);
        require(farmerId != 0, "Farmer not registered");
        
        landVideos[videoCount] = LandVideo(msg.sender, _videoHash);
        videoCount++;
    }

    function getLandVideo(uint _index) public view returns (address, string memory) {
        require(_index < videoCount, "Invalid video index");
        return (landVideos[_index].farmer, landVideos[_index].videoHash);
    }
}
