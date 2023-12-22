package ru.job4j.io;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

public class LogFilter {
    private static final String LINE_BREAK = "\r\n";
    private final String fileText;

    public LogFilter(String path) {
        this.fileText = getFileText(path);
    }

    public List<String> filter() {
        String[] rows = fileText.split(LINE_BREAK);
        String[] words;
        List<String> rsl = new ArrayList<>(14);
        for (String row : rows) {
            words = row.split(" ");
            if (words.length > 1 && "404".equals(words[words.length - 2])) {
                rsl.add(row);
            }
        }
        return rsl;
    }

    private static String getFileText(String path) {
        String text = null;
        try (BufferedReader in = new BufferedReader(new FileReader(path))) {
            StringJoiner sj = new StringJoiner(LINE_BREAK);
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

    public void saveTo(String outputFilePath) {
        var data = filter();
        try (PrintWriter out = new PrintWriter(
                new BufferedOutputStream(
                        new FileOutputStream(outputFilePath)
                ))) {
            out.println(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        LogFilter logFilter = new LogFilter("data/log.txt");
        //logFilter.filter().forEach(System.out::println);
        logFilter.saveTo("data/404.txt");
    }
}