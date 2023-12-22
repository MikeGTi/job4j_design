package ru.job4j.io;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

public class LogFilter {
    private final String fileText;

    public LogFilter(String path) {
        this.fileText = getFileText(path);
    }

    public List<String> filter() {
        String[] rows = fileText.split(System.lineSeparator());
        String[] words;
        List<String> rsl = new ArrayList<>(14);
        for (String row : rows) {
            words = row.split(" ");
            if (words.length > 1 && words[words.length - 2].equals("404")) {
                rsl.add(row);
            }
        }
        return rsl;
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

    public static void main(String[] args) {
        LogFilter logFilter = new LogFilter("data/log.txt");
        logFilter.filter().forEach(System.out::println);
    }
}