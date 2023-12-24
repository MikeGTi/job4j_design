package ru.job4j.io;

import java.io.*;
import java.util.*;

public class Analysis {

    public void unavailable(String source, String target) {
        String text = getFileText(source);
        saveTo(target, getDowntime(text.split(System.lineSeparator())));
    }

    private static String getFileText(String path) {
        String text = "";
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

    public List<String> getDowntime(String[] lines) throws IllegalArgumentException {
        if (lines.length == 1 && "".equals(lines[0])) {
            throw new IllegalArgumentException("file is empty");
        }
        StringJoiner sj = new StringJoiner(";");
        String[] splitted;
        boolean downStarts = false;
        for (String line : lines) {
            if (validate(line)) {
                splitted = line.split(" ", 2);
                if (("400".equals(splitted[0]) || "500".equals(splitted[0])) && !downStarts) {
                    sj.add(splitted[1]);
                    downStarts = true;
                }
                if (!("400".equals(splitted[0])) && !("500".equals(splitted[0])) && downStarts) {
                    sj.add(splitted[1]);
                    downStarts = false;
                }
            }
        }
        return Collections.singletonList(sj + ";");
    }

    private boolean validate(String s) {
        return s.contains(" ") && !" ".equals(s) && !s.startsWith(" ") && (s.indexOf(" ") != s.length() - 1);
    }

    public void saveTo(String outputFilePath, List<String> data) {
        try (PrintWriter out = new PrintWriter(
                new BufferedOutputStream(
                        new FileOutputStream(outputFilePath)
                ))) {
            data.forEach(out::println);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Analysis analysis = new Analysis();
        analysis.unavailable("data/io/server_availability_analysis/test1_server.log", "data/io/server_availability_analysis/test1_target.csv");
        analysis.unavailable("data/io/server_availability_analysis/test2_server.log", "data/io/server_availability_analysis/test2_target.csv");
        analysis.unavailable("data/io/server_availability_analysis/test3_server.log", "data/io/server_availability_analysis/test3_target.csv");
    }
}