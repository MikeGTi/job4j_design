package ru.job4j.io;

import java.io.*;
import java.util.*;

public class Analysis {
    String unavailable = "";

    public void unavailable(String source, String target) {
        StringJoiner sj = new StringJoiner("");
        try (BufferedReader in = new BufferedReader(new FileReader(source))) {
            String line;
            String[] splitted;
            boolean downStarts = false;
            while ((line = in.readLine()) != null) {
                if (validate(line)) {
                    splitted = line.split(" ", 2);
                    if (("400".equals(splitted[0]) || "500".equals(splitted[0])) && !downStarts) {
                        sj.add(splitted[1] + ";");
                        downStarts = true;
                    }
                    if (!("400".equals(splitted[0])) && !("500".equals(splitted[0])) && downStarts) {
                        sj.add(splitted[1] + ";\n");
                        downStarts = false;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.unavailable = sj.toString();
        saveTo(target, sj.toString());
    }

    private boolean validate(String s) {
        return s.contains(" ") && !" ".equals(s) && !s.startsWith(" ") && (s.indexOf(" ") != s.length() - 1);
    }

    public void saveTo(String outputFilePath, String data) {
        try (PrintWriter out = new PrintWriter(
                new BufferedOutputStream(
                        new FileOutputStream(outputFilePath)
                ))) {
            out.println(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getUnavailable() {
        return unavailable;
    }

    public static void main(String[] args) {
        Analysis analysis = new Analysis();
        analysis.unavailable("data/io/server_availability_analysis/test1_server.log", "data/io/server_availability_analysis/test1_target.csv");
        analysis.unavailable("data/io/server_availability_analysis/test2_server.log", "data/io/server_availability_analysis/test2_target.csv");
        analysis.unavailable("data/io/server_availability_analysis/test3_server.log", "data/io/server_availability_analysis/test3_target.csv");
    }
}