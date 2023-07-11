package exercise.coding101;

import java.util.Locale;
import java.util.Scanner;
import java.util.concurrent.Callable;

import org.apache.commons.lang3.StringUtils;

import exercise.coding101.game.Game;
import exercise.coding101.game.Get30.GetThirty;
import exercise.coding101.game.GuessNumber.GuessNumber;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

@Command(name = "project-selector", mixinStandardHelpOptions = true, version = "project-selector 0.0.1", description = "Select games to play.")
class ProjectSelector implements Callable<Integer> {

    private static final String GET30 = "GET30";
    private static final String GUESSNUMBER = "GUESSNUMBER";

    @Option(names = { "-n", "--name" }, description = { "" }, defaultValue = GET30, fallbackValue = GET30, help = true)
    private String name;

    public Integer call() throws Exception {

        if (!StringUtils.equalsAnyIgnoreCase(name, GET30, GUESSNUMBER)) {
            System.err.printf("Invalid selection: %s", name);
            return 1;
        }

        System.out.printf("You have chosen the %s game.  Let's Play.\n\n", name);

        try (Scanner scan = new Scanner(System.in);) {

            Game game = null;
            switch (StringUtils.upperCase(name, Locale.getDefault())) {
            case GET30:
                game = new GetThirty(scan);
                break;
            case GUESSNUMBER:
                game = new GuessNumber(scan);
                break;
            default:
                break;
            }

            game.Start();
        }
        return 0;
    }

    public static void main(String[] args) {
        int exitCode = new CommandLine(new ProjectSelector()).execute(args);
        System.exit(exitCode);
    }

}
