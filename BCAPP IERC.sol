// SPDX-License-Identifier: MIT
// This is the licence identifier for Solidity & compiler
pragma solidity ^0.6.6;
  
 interface ERC20Interface { 
    // Six mandatory functions of the ERC-20 Smart Contract
   function totalSupply() external view returns (uint256); 
   function balanceOf(address account) external view returns (uint256); 
   function allowance(address owner, address spender) external view returns (uint256); 
   function transfer(address recipient, uint256 amount) external returns (bool); 
   function approve(address spender, uint256 amount) external returns (bool); 
   function transferFrom(address sender, address recipient, uint256 amount) external returns (bool); 
 
    // Events. Log entries to inform everybody on the blockchain of the
   event Transfer(address indexed from, address indexed to, uint256 value); 
   event Approval(address indexed owner, address indexed spender, uint256 value); 
} 
 
 // the Smart Contract 
contract lorcanCoin is ERC20Interface { 
	// key variables. publicly available.
	string public symbol; 
	string public name; 
	uint8 public decimals;  // int is an integer. Mitigation technique
	uint public _totalSupply; // uint means its a positive numebrs. Mitigation technique as a result of attacks.
	address public tokenOwner; 
 
    /* Mapping acts like a hash table. 
    Used to store data in the form of key-value pairs */
	mapping(address => uint) private _balances; 
	mapping(address => mapping(address => uint256)) private _allowances; 
 
    // An optional function used to initialize state variables of a contract
	constructor() public { 
	 tokenOwner = msg.sender; 
	 symbol="LOC"; 
	 name="LorcanCoin"; 
	 decimals=18; 
	 _totalSupply = 20000 * 10**uint(decimals); 
	 _balances[tokenOwner] = _totalSupply; 
	 emit Transfer(address(0), tokenOwner, _totalSupply); 
	} 
 
	// defines total token limit of Smart Contract
	function totalSupply() public view override returns (uint256) { 
	 return _totalSupply - _balances[address(0)]; 
	} 
	 // This fuction will return the balance of a given address
	function balanceOf(address account) public view override returns (uint256) { 
	 return _balances[account]; 
	} 
	// checks if account has enough balance to send tokens.
	function allowance(address owner, address spender) public view virtual override returns 
	(uint256) { 
	 return _allowances[owner][spender]; 
	} 
	// takes tokens from total supply and gives to an account
	function transfer(address recipient, uint256 amount) public virtual override returns (bool) 
	{ 
	 address sender = msg.sender; 
	 
	 _balances[sender] = _balances[sender] - amount; 
	 _balances[recipient] = _balances[recipient] + amount; 
	 emit Transfer(sender, recipient, amount); 
	 return true; 
	} 
	// verifies that the contract can give tokens while taking total supply into account
	function approve(address spender, uint256 amount) public virtual override returns (bool) { 

	address sender = msg.sender; 
	 
	 _allowances[sender][spender] = amount; 
	 emit Approval(sender, spender, amount); 
	 return true; 
	} 
	// transfer tokens from one account to another account.
	function transferFrom(address sender, address recipient, uint256 amount) public virtual 
override returns (bool) { 
 
	 _balances[sender] = _balances[sender] - amount; 
	 _balances[recipient] = _balances[recipient] + amount; 
	 emit Transfer(sender, recipient, amount); 
	 
	 _allowances[sender][recipient] = amount; 
	 emit Approval(sender, recipient, amount); 
	 return true; 
	} 
} 