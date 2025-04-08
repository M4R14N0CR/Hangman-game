<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body>
  <h1>Hangman Game in Assembly</h1>

  <h2>Overview</h2>
  <p>
    This project implements the classic Hangman game using assembly language (NASM). The game runs in a Linux terminal
    and uses system calls (via <code>int 80h</code>) for output and input. It leverages custom macros for printing and
    receiving data, alongside ANSI escape codes to add colorful text effects.
  </p>

  <h2>Game Flow</h2>
  <p>
    At startup, the game displays a welcome message with ASCII art and presents a simple menu offering two options:
    "Start" and "Exit". When the user selects "Start", the game then prompts them to choose a difficulty level—Low,
    Medium, or High—each adjusting parameters like the length of the secret word and the number of available turns.
  </p>
  <ul>
    <li>
      <strong>Word Selection:</strong> Based on the difficulty, a random secret word is chosen.
    </li>
    <li>
      <strong>Board Display:</strong> The game board (a 3×3 grid) and game messages are displayed with colors to enhance
      visual feedback.
    </li>
    <li>
      <strong>User Input:</strong> The program waits for the player to input a letter. Input is processed by comparing the
      character with the secret word letter by letter.
    </li>
    <li>
      <strong>Game Logic:</strong> Correctly guessed letters replace underscores on the board. If the player guesses the
      entire word before exhausting their turns, a win message is displayed; otherwise, a loss message appears.
    </li>
    <li>
      <strong>Restart Option:</strong> Pressing the ESC key at any time resets the board and returns the player to the
      main menu.
    </li>
  </ul>

  <h2>Implementation Details</h2>
  <ul>
    <li>
      <strong>Macros:</strong> Custom macros (<code>imprime</code> and <code>recibe</code>) simplify writing to and reading
      from the terminal.
    </li>
    <li>
      <strong>Colorful Output:</strong> ANSI escape codes are used to display text in various colors, enhancing the user
      experience.
    </li>
    <li>
      <strong>Game Data:</strong> All messages, ASCII art, and board layouts are defined in the <code>.data</code> section,
      while game state variables (such as the board cells and counters) reside in the <code>.bss</code> section.
    </li>
    <li>
      <strong>Conditional Logic and Loops:</strong> The code employs numerous conditional jumps and loops to handle user
      input, update the board, check win/lose conditions, and manage difficulty levels.
    </li>
    <li>
      <strong>Difficulty Settings:</strong> Separate routines for Low, Medium, and High difficulties adjust the game's challenge
      by varying word lengths and allowed attempts.
    </li>
  </ul>

  <h2>Conclusion</h2>
  <p>
    This Hangman game project is a comprehensive demonstration of low-level programming in assembly language.
    It integrates direct hardware interaction, text-based user interfaces, and game logic implementation—all within a
    terminal environment. The project is an excellent example of how to manage input/output, use conditional branching,
    and manipulate data structures at the assembly level.
  </p>
</body>
</html>
