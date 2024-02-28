package ru.job4j.io;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.StringJoiner;

public class Config {

    private static final String KEY_VALUE_DELIMITER = "=";
    private static final String COMMENTS_START = "#";
    private final String path;
    private final Map<String, String> values = new HashMap<>();

    public Config(final String path) {
        this.path = path;
    }

    public void load() throws IllegalArgumentException {
        String text = getFileText(this.path);
        parseLines(text.split(System.lineSeparator()));
    }

    private static String getFileText(String path) {
        String text = null;
        try (BufferedReader in = new BufferedReader(new FileReader(path))) {
            StringJoiner sj = new StringJoiner(System.lineSeparator());
            String line;
            while ((line = in.readLine()) != null) {
                sj.add(line);
            }
            text = sj.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return text;
    }

    private void parseLines(String[] lines) throws IllegalArgumentException {
        if (lines.length == 1 && "".equals(lines[0])) {
            throw new IllegalArgumentException("file is empty");
        }
        String[] splitted;
        for (String line : lines) {
            if (validate(line)) {
                if (!line.startsWith(COMMENTS_START)) {
                    splitted = line.split(KEY_VALUE_DELIMITER, 2);
                    values.put(splitted[0], splitted[1]);
                }
            }
        }
    }

    private boolean validate(String s) throws IllegalArgumentException {
        if (!s.startsWith("#")) {
            if (!s.contains("=")) {
                throw new IllegalArgumentException(
                        "this line: '%s' does not contain the symbol '='".formatted(s));
            }
            if ("=".equals(s)) {
                throw new IllegalArgumentException(
                        "this line: '%s' does not contain key, value".formatted(s));
            }
            if (s.startsWith("=")) {
                throw new IllegalArgumentException(
                        "this line: '%s' does not contain a key".formatted(s));
            }
            if (s.indexOf("=") == s.length() - 1) {
                throw new IllegalArgumentException(
                        "this line: '%s' does not contain a value".formatted(s));
            }
        }
        return true;
    }

    public String value(String key) {
        return values.getOrDefault(key, "");
    }

    @Override
    public String toString() {
        StringJoiner out = new StringJoiner(System.lineSeparator());
        try (BufferedReader read = new BufferedReader(new FileReader(this.path))) {
           read.lines().forEach(out::add);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return out.toString();
    }

 public static void main(String[] args) {
        System.out.println(new Config("data/test.properties"));
        String test1 = "ключ=значение=1";
        System.out.println(Arrays.stream(test1.split("=")).toList());
        System.out.println(Arrays.stream(test1.split("=", 2)).toList());
    }
}