package ru.job4j.io.searchfiles;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

class ArgsName {

    private final Map<String, String> values = new HashMap<>();

    public String get(String key) throws IllegalArgumentException {
        if (!values.containsKey(key)) {
            throw new IllegalArgumentException("This key: '%s' is missing".formatted(key));
        }
        return values.get(key);
    }

    public int size() {
        return values.size();
    }

    private void parse(String[] args) {
        String[] splitted;
        for (String arg : args) {
            splitted = arg.trim().split("=", 2);
            values.put(splitted[0].substring(1), splitted[1]);
        }
    }

    private static void validate(String value) throws IllegalArgumentException {
        String toValidate = value.trim();
        if (toValidate.isBlank()) {
            throw new IllegalArgumentException(
                "Error: This argument '%s' is blank".formatted(value));
        }
        if (!toValidate.startsWith("-")) {
            throw new IllegalArgumentException(
                    "Error: This argument '%s' does not start with a '-' character".formatted(value));
        }
        if (!toValidate.contains("=")) {
            throw new IllegalArgumentException(
                    "Error: This argument '%s' does not contain an equal sign".formatted(value));
        }
        if (toValidate.startsWith("-=")) {
            throw new IllegalArgumentException(
                    "Error: This argument '%s' does not contain a key".formatted(value));
        }
        if (toValidate.indexOf("=") == toValidate.length() - 1) {
            throw new IllegalArgumentException(
                    "Error: This argument '%s' does not contain a value".formatted(value));
        }
    }

    public static ArgsName of(String[] args) throws IllegalArgumentException {
        if (args.length == 0) {
                throw new IllegalArgumentException("Arguments not passed to program");
        }
        ArgsName names = new ArgsName();
        Arrays.stream(args).forEach(ArgsName::validate);
        names.parse(args);
        return names;
    }

    public void printArgs() {
        System.out.println("\nArgs:");
        values.forEach((key, value) -> System.out.printf("    '%s' : '%s'%n", key, value));
    }

    public static void main(String[] args) {
        ArgsName jvm = ArgsName.of(new String[] {"-Xmx=512", "-encoding=UTF-8"});
        System.out.println(jvm.get("Xmx"));

        ArgsName zip = ArgsName.of(new String[] {"-out=project.zip", "-encoding=UTF-8"});
        System.out.println(zip.get("out"));
    }
}