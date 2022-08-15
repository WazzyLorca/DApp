pragma solidity ^0.8.0;

contract RPS {

    uint256 previousMove;
    uint256 previousStake;
    address previousPlayer;

    function play(uint256 move) payable {

        // TODO: make sure stakes are the same

        if (previousMove == 0) {
            // If there is no move before this, make this the first move and Ethers stay in the contract
            previousMove = move;
            previousStake = msg.value;
            previousPlayer = msg.sender;
            return;
        }

        if (previousMove == 1) {
            if (move == 2) {
                // ...

                // if wins:
                msg.sender.transfer(address(this).balance);

                // if loses:
                previousPlayer.transfer(address(this).balance);
            }
        }
    }
}