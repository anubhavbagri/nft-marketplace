// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Balance {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function getBalance() public pure returns (int256) {
        return 1211;
    }
}
