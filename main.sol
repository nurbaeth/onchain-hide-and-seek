// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HideAndSeek {
    address public hider;
    address public seeker;

    uint8 private hiddenSpot; // Секретное место (от 1 до maxSpots)
    uint8 public maxSpots = 5;

    enum GameState { WaitingForHider, WaitingForSeeker, Finished }
    GameState public gameState;

    string public result;

    constructor() {
        gameState = GameState.WaitingForHider;
    }

    function hide(uint8 spot) external {
        require(gameState == GameState.WaitingForHider, "Not time to hide");
        require(spot > 0 && spot <= maxSpots, "Invalid spot");

        hider = msg.sender;
        hiddenSpot = spot;
        gameState = GameState.WaitingForSeeker;
    }

    function seek(uint8 guess) external {
        require(gameState == GameState.WaitingForSeeker, "Not time to seek");
        require(msg.sender != hider, "Hider can't seek");
        require(guess > 0 && guess <= maxSpots, "Invalid guess");

        seeker = msg.sender;
        gameState = GameState.Finished;

        if (guess == hiddenSpot) {
            result = "Seeker found the hider!";
        } else {
            result = "Hider escaped!";
        }
    }

    function resetGame() external {
        require(gameState == GameState.Finished, "Game not finished yet");

        // Reset all variables for a new game
        hider = address(0);
        seeker = address(0);
        hiddenSpot = 0;
        result = "";
        gameState = GameState.WaitingForHider;
    }

    function getGameState() external view returns (string memory) {
        if (gameState == GameState.WaitingForHider) return "Waiting for hider";
        if (gameState == GameState.WaitingForSeeker) return "Waiting for seeker";
        return "Game finished";
    }
}
