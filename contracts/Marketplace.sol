// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Marketplace is Ownable {
    uint256 public serviceCounter = 0;

    struct Service {
        uint256 id;
        address owner;
        string title;
        string description;
        uint256 price;
        bool isActive;
    }

    mapping(uint256 => Service) public services;

    event ServiceCreated(
        uint256 id,
        address owner,
        string title,
        string description,
        uint256 price
    );

    function createService(
        string memory title,
        string memory description,
        uint256 price
    ) external {
        serviceCounter++;
        services[serviceCounter] = Service(
            serviceCounter,
            msg.sender,
            title,
            description,
            price,
            true
        );
        emit ServiceCreated(
            serviceCounter,
            msg.sender,
            title,
            description,
            price
        );
    }

    // Implement additional functions for managing offers, negotiations, transactions, disputes, and cancellations.
}
