// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleWallet {
    address public owner;
    mapping(address => uint) public balances;

    event Deposit(address indexed _from, uint _amount);
    event Withdrawal(address indexed _to, uint _amount);

    // sets the owner to the address that deployed the contract
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint _amount) public {
        require(_amount > 0, "Withdrawal amount must be greater than 0");
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        emit Withdrawal(msg.sender, _amount);
    }

    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // owner can check the contract's balance
    function contractBalance() public view onlyOwner returns (uint) {
        return address(this).balance;
    }
}

