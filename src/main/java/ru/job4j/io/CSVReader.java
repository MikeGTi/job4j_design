package ru.job4j.io;

import java.io.*;
import java.util.*;
import java.util.stream.IntStream;

public class CSVReader {
    public static void handle(ArgsName argsName) throws Exception {
        try (PrintWriter out = ("stdout".equalsIgnoreCase(argsName.get("out"))) ? new PrintWriter(System.out) : new PrintWriter(argsName.get("out"));
             Scanner scanner = new Scanner(new File(argsName.get("path")))) {

            scanner.useDelimiter(argsName.get("delimiter"));
            String[] firstLine = scanner.nextLine().split(argsName.get("delimiter"));

            String[] filteredFields = argsName.get("filter").split(",");
            LinkedHashMap<String, Integer> filteredFieldsMap = new LinkedHashMap<>();
            Arrays.stream(filteredFields).forEach(filteredField -> filteredFieldsMap.putIfAbsent(filteredField, 0));
            IntStream.range(0, firstLine.length).forEach(i -> filteredFieldsMap.computeIfPresent(firstLine[i], (key, val) -> val = i));

            int count = 0;
            String delim = argsName.get("delimiter");
            for (String key : filteredFieldsMap.keySet()) {
                if (count == filteredFieldsMap.size() - 1) {
                    delim = System.lineSeparator();
                }
                out.printf("%s%s", key, delim);
                count++;
            }

            count = 0;
            delim = argsName.get("delimiter");
            while (scanner.hasNextLine()) {
                String[] split = scanner.nextLine().split(argsName.get("delimiter"));
                for (Integer val : filteredFieldsMap.values()) {
                    if (count == filteredFieldsMap.values().size() - 1) {
                        delim = System.lineSeparator();
                    }
                    out.printf("%s%s", split[val], delim);
                    count++;
                }
                delim = argsName.get("delimiter");
                count = 0;
            }
        }
    }

    private static void validateInputArgs(ArgsName argsName) throws IllegalArgumentException {
        if (argsName.size() == 0) {
            throw new IllegalArgumentException("Program arguments absent (Example: '-path=file.csv -delimiter=;  -out=stdout/output file path -filter=field1,field2...')");
        }
        if (argsName.size() != 4) {
            throw new IllegalArgumentException("Program arguments needs four values (Example: '-path=file.csv -delimiter=;  -out=stdout/output file path -filter=field1,field2...')");
        }
        if (!new File(argsName.get("path")).isFile()) {
            throw new IllegalArgumentException("CSV file is null.");
        }
    }

    public static void main(String[] args) {
        ArgsName argsName = ArgsName.of(args);
        validateInputArgs(argsName);
        try {
            handle(argsName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}