# 🧠 AbQuiz — A Simple Blockchain Quiz Smart Contract

A beginner-friendly Solidity project that demonstrates how to build a **decentralized quiz** on the **Celo blockchain**.  
The **AbQuiz** contract allows an owner to create a quiz question and a hashed answer. Participants can then submit their answers — and the first correct submission is permanently recorded as the **winner** on the blockchain.

---

## 🚀 Project Description

**AbQuiz** is a simple smart contract that introduces new developers to core blockchain concepts such as:
- Ownership control (`onlyOwner` modifier)
- Data immutability and transparency
- Hashing for secure answer storage (`keccak256`)
- Event emission (`QuizWon`) for on-chain notifications

Once deployed, the contract lets the quiz owner set a question and store a **hashed version** of the correct answer (so nobody can read it directly from the blockchain).  
Participants then submit answers — the first correct one is logged forever as the **winner**!

---

## 💡 What It Does

1. **Owner Sets the Quiz**  
   - The quiz owner creates a question and provides the correct answer (stored as a hash).  
   - The quiz can only be set **once** to prevent tampering.

2. **Participants Submit Answers**  
   - Anyone can attempt to answer the question.  
   - Answers are hashed and compared to the stored hash.

3. **Winner is Recorded**  
   - The first correct answer automatically sets the sender as the **winner**.  
   - A `QuizWon` event is emitted to announce the victory.

4. **View Functions**  
   - Users can easily view the quiz question and see if someone has already won.

---

## ✨ Features

✅ **Secure Answer Storage** – The correct answer is hashed, keeping it hidden on-chain.  
✅ **One-Time Quiz Setup** – Prevents the owner from changing the question after it’s set.  
✅ **Fair Competition** – The first correct answer wins; no manual interference.  
✅ **Transparent Results** – The winner’s address is public and verifiable on the blockchain.  
✅ **Event Notifications** – Emits `QuizWon` when someone wins.

---

## 🌐 Deployed Smart Contract

The **AbQuiz** smart contract is live on **Celo Sepolia Testnet**:

🔗 **Contract Address:** [`0xdC6565D37E1A1f57308123dCE77f657Ea8DBB447`](https://celo-sepolia.blockscout.com/address/0xdC6565D37E1A1f57308123dCE77f657Ea8DBB447)

<img width="1649" height="749" alt="image" src="https://github.com/user-attachments/assets/3ec57fec-223b-4d2c-b843-956461e07356" />



You can explore it on **Blockscout** to view transactions, events, and contract state.

---

## 🧩 Smart Contract Overview

| Function | Description |
|-----------|-------------|
| `setQuiz(string _question, string _answer)` | Owner sets a quiz question and hashed answer. |
| `submitAnswer(string _answer)` | Participants submit answers; the first correct one wins. |
| `getQuestion()` | Returns the quiz question. |
| `getWinner()` | Returns the address of the winner (or zero address if none). |

---

## 🛠️ Tech Stack

- **Solidity v0.8.0**
- **Celo Sepolia Testnet**
- **Remix IDE / Hardhat (optional for local testing)**
- **Blockscout** for contract verification and interaction

---

## 📖 How to Interact

1. **Visit** the deployed contract on [Blockscout](https://celo-sepolia.blockscout.com/address/0xdC6565D37E1A1f57308123dCE77f657Ea8DBB447).  
2. Open the **Read / Write Contract** tabs.  
3. Use `getQuestion()` to read the current quiz.  
4. Submit your answer using `submitAnswer()` (if no one has won yet).  
5. Check `getWinner()` to see if you’re the lucky winner!

---

## 👨‍💻 For Developers

You can also deploy and test **AbQuiz.sol** locally using [Remix](https://remix.ethereum.org/):

1. Copy the contract code into Remix.  
2. Compile with Solidity **0.8.0** or higher.  
3. Deploy to the **Celo testnet** (or a local Hardhat network).  
4. Interact using the functions in the deployed contract panel.

---

## 📜 License

This project is licensed under the [MIT License](./LICENSE).

---

## ❤️ Acknowledgments

- Built for educational purposes — perfect for **blockchain beginners**.  
- Inspired by simple, transparent DApp design principles.  
- Runs on the **Celo** ecosystem to support accessible and inclusive blockchain development.

---

🧩 *Learn, build, and experiment with Solidity — one quiz at a time!*
