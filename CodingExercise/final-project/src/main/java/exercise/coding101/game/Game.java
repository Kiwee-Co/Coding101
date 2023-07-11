package exercise.coding101.game;

import java.util.Scanner;

public abstract class Game {
    protected Player[] players;

    protected Player currentPlayer;
    protected Player winner;
    protected Scanner scan;

    protected String name;

    protected Game(String name, Scanner scan) {
        this.name = name;
        this.scan = scan;

        players = new Player[2];

        for (int i = 0; i < 2; i++) {
            System.out.println("What's your name?");
            name = scan.next();

            System.out.printf("Hello %s , welcome to the game! \n", name);

            players[i] = new Player(name);
        }
    }

    public String getName() {
        return name;
    }

    public void Start() {
        System.out.println("\nNow let's get started!");
        currentPlayer = players[0];

        while (winner == null) {
            if (term(currentPlayer)) {
                winner = currentPlayer;
            }

            // if current player is players[0], switch to players[1], false otherwise.
            currentPlayer = currentPlayer == players[0] ? players[1] : players[0];
        }
    }

    /*
     * return true if the player wins the game
     */
    protected abstract boolean term(Player player);
}
