// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AlphaCoin {
    string public name = "AlphaCoin";
    string public symbol = "ALPHA";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    address public owner;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(uint256 initialSupply) {
        owner = msg.sender;
        _mint(owner, initialSupply);
    }

    function transfer(address to, uint256 value) external returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        uint256 allowed = allowance[from][msg.sender];
        require(allowed >= value, "Allowance exceeded");
        allowance[from][msg.sender] = allowed - value;
        _transfer(from, to, value);
        return true;
    }

    function mint(address to, uint256 value) external onlyOwner {
        _mint(to, value);
    }

    function burn(uint256 value) external {
        _burn(msg.sender, value);
    }

    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0), "Invalid recipient");
        uint256 fromBalance = balanceOf[from];
        require(fromBalance >= value, "Insufficient balance");
        balanceOf[from] = fromBalance - value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);
    }

    function _mint(address to, uint256 value) internal {
        require(to != address(0), "Invalid recipient");
        totalSupply += value;
        balanceOf[to] += value;
        emit Mint(to, value);
        emit Transfer(address(0), to, value);
    }

    function _burn(address from, uint256 value) internal {
        uint256 fromBalance = balanceOf[from];
        require(fromBalance >= value, "Insufficient balance");
        balanceOf[from] = fromBalance - value;
        totalSupply -= value;
        emit Burn(from, value);
        emit Transfer(from, address(0), value);
    }
}
