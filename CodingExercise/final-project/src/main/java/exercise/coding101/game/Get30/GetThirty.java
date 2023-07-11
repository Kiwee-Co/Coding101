package exercise.coding101.game.Get30;

import java.util.Scanner;

import exercise.coding101.game.Game;
import exercise.coding101.game.Player;

public class GetThirty extends Game {

    private int currentNumber;

    public GetThirty(Scanner scan) {
        super("Get Thirty", scan);
    }

    @Override
    protected boolean term(Player player) {
        int next = currentNumber + 3;
        while (next > currentNumber && next - currentNumber > 2) {
            System.out.printf("%s's term, current number is %s, next number is: (add only 1 or 2)\n", player.getName(), currentNumber);

            next = scan.nextInt();

            currentNumber = next;
        }

        return currentNumber == 30;
    }
}
