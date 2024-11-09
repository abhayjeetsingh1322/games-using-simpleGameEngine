# Blackjack Game in MATLAB

## Overview

This project is a MATLAB implementation of the popular card game **Blackjack**, featuring an interactive graphical user interface (GUI) and AI-driven decision-making for the dealer. The game allows players to compete against a dealer, with core gameplay mechanics like hitting, standing, and determining the winner based on Blackjack rules. The GUI leverages a custom `simpleGameEngine` to display card sprites and dynamic updates.

---

## Features

- **Player Actions**: Hit, stand, and interact via keyboard input.
- **Dealer AI**: Logical decision-making based on card totals.
- **Dynamic Game Board**: Real-time card dealing and results display.
- **Win Conditions**: Automatically detects and displays game outcomes (e.g., win, loss, bust, or tie).
- **Customizable Environment**: Built using a modular structure for ease of extension.

---

## Files

1. **`blackjack.m`**: Main game file containing the gameplay loop and user interactions.
2. **`ai.m`**: Function implementing the AI dealer’s decision logic.
3. **`sumchecker.m`**: Helper function to calculate and verify the card total, accounting for special rules.
4. **`simpleGameEngine.m`**: Custom game engine for rendering card sprites and handling graphical updates.

---

## How to Run

1. **Requirements**:
   - MATLAB (tested on version R2023a or later).
   - The `retro_cards.png` sprite sheet for card visuals.

2. **Setup**:
   - Place all project files in the same directory.
   - Ensure `retro_cards.png` is in the directory to render card visuals.

3. **Run the Game**:
   - Open `blackjack.m` in MATLAB.
   - Press "Run" or type `blackjack` in the MATLAB command window.

4. **Gameplay**:
   - Press "Enter" to hit.
   - Press "D" to stand.

---

## Gameplay Rules

- The game uses standard Blackjack rules:
  - Aces count as 1 or 11, based on the best outcome.
  - Face cards (King, Queen, Jack) are worth 10 points.
  - The goal is to get as close to 21 as possible without exceeding it.
- The player starts with two cards and can choose to hit or stand.
- The dealer automatically plays based on AI logic, hitting until reaching 17 or more.
- Outcomes:
  - If the player's total exceeds 21, they "bust" and lose.
  - If the dealer's total exceeds 21, the dealer "busts," and the player wins.
  - The closest total to 21 wins; ties result in a "push."
