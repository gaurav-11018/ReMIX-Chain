// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, Ownable {
    constructor() ERC20("RemixChain Token", "RCX") {}

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function distributeTokens(
        address[] calldata recipients,
        uint256[] calldata amounts
    ) external onlyOwner {
        require(
            recipients.length == amounts.length,
            "Mismatched recipients and amounts length"
        );
        for (uint256 i = 0; i < recipients.length; i++) {
            _mint(recipients[i], amounts[i]);
        }
    }

    function transferTokens(
        address from,
        address to,
        uint256 amount
    ) external onlyOwner {
        _transfer(from, to, amount);
    }

    function redeemTokens(address user, uint256 amount) external onlyOwner {
        _burn(user, amount);
    }
}
