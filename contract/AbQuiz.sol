// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title AbQuiz
 * @dev A very simple, beginner-friendly quiz contract.
 * It allows an owner to set a question and a hashed answer.
 * Users can submit answers, and the first correct answer is recorded as the winner.
 * This is a basic building block for the platform described in your image.
 */
contract AbQuiz {

    // --- State Variables ---

    address public owner; // The address that deployed the contract
    string public question; // The quiz question
    bytes32 public correctAnswerHash; // The hash of the correct answer
    address public winner; // The address of the first correct responder
    bool public quizHasBeenSet; // Tracks if the quiz is active

    // --- Event ---

    /**
     * @dev Emitted when a user submits the correct answer.
     */
    event QuizWon(address indexed winner, string message);

    // --- Constructor ---

    /**
     * @dev Sets the contract deployer as the owner when the contract is created.
     */
    constructor() {
        owner = msg.sender; // 'msg.sender' is the wallet address deploying the contract
        quizHasBeenSet = false;
    }

    // --- Modifiers ---

    /**
     * @dev A modifier to restrict certain functions so only the owner can call them.
     */
    modifier onlyOwner() {
        // Checks if the person calling the function is the owner
        require(msg.sender == owner, "Only the owner can call this function.");
        _; // This allows the rest of the function to run if the check passes
    }

    // --- Functions ---

    /**
     * @dev Sets the quiz question and the correct answer.
     * @param _question The quiz question text.
     * @param _answer The plain-text correct answer. 
     * This will be hashed internally and not stored in plain text.
     * @notice Only the owner can set the quiz, and it can only be set once.
     */
    function setQuiz(string memory _question, string memory _answer) public onlyOwner {
        require(!quizHasBeenSet, "The quiz has already been set.");
        
        question = _question;
        // We store a hash of the answer, not the answer itself.
        // This prevents people from reading the answer directly from the blockchain.
        correctAnswerHash = keccak256(abi.encodePacked(_answer));
        quizHasBeenSet = true;
    }

    /**
     * @dev Allows any user to submit an answer to the quiz.
     * @param _answer The user's submitted answer as a string.
     * @notice The first person to submit the correct answer will be recorded as the winner.
     */
    function submitAnswer(string memory _answer) public {
        require(quizHasBeenSet, "The quiz has not been set yet.");
        require(winner == address(0), "The quiz has already been won."); // address(0) is an empty address

        // Hash the user's submitted answer and compare it to the stored correct hash
        if (keccak256(abi.encodePacked(_answer)) == correctAnswerHash) {
            winner = msg.sender; // Set the winner
            emit QuizWon(msg.sender, "Congratulations! You won the quiz!");
        }
    }

    /**
     * @dev A public 'getter' function to see the current question.
     * @return The current quiz question.
     */
    function getQuestion() public view returns (string memory) {
        return question;
    }

    /**
     * @dev A public 'getter' function to check the winner's address.
     * @return The address of the winning user (or the zero address if no one has won).
     */
    function getWinner() public view returns (address) {
        return winner;
    }
}

