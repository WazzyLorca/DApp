// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

// importing my LorcanCoin smart contract
import "./BCAPP IERC.sol";

contract CryptoMonsterGame {

    struct Monster {
        string name;
        uint256 level;
        uint256 attackStrength;
        uint256 defenseStrength;
        uint256 lorcanCoin;
    }
    // an array of monsters. Starts at 0.
    Monster[] public monsters;
    // owner of the nft monster
    address public owner;

    function CryptoMonsters() public {
        owner = msg.sender;

    }
    // map address that receives the payment to create a monster
    // address: 0xfa37404aAA75448f8102719a40DD1089707863CA
    mapping(address => uint256) public addressToPay;

    // create a new monster function
    function createMonster(string memory _name) public payable {
        addressToPay[msg.sender] += msg.value;
        require(owner == msg.sender);
        monsters.push(Monster(_name, 1, 10, 10, 5));
     }
    // battle two monsters. need two monster ids. one for attack and one for defense.
    function battle(uint _monsterId, uint _targetId) public {
        Monster storage monster1 = monsters[_monsterId];
        Monster storage monster2 = monsters[_targetId];

        if(monster1.attackStrength >= monster2.defenseStrength){
            monster1.level += 1;
            monster1.attackStrength += 10;
            monster1.lorcanCoin += 25;
        } else {
            monster2.level += 1;
            monster2.defenseStrength += 10;
            monster2.lorcanCoin += 25;
        }
    }
}