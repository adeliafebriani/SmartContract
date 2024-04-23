// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Counter {
    uint count;
   
    constructor() public {
        count = 0;
    }
    function getCount() public view returns (uint) {
        return count;
    }
    function incrementCount() public {
        count = count + 1;
    }
}