package exercise.coding101.game;

import java.util.HashMap;
import java.util.Map;

public class Player {
    private String name;

    protected Map<String, String> properties;

    Player(String name) {
        this.name = name;
        properties = new HashMap<>();
    }

    public String getName() {
        return name;
    }

    public String SetProperty(String key, String value) {
        return properties.put(key, value);
    }

    public String getProperty(String key) {
        return properties.get(key);
    }
}
