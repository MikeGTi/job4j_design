package ru.job4j.io;

import java.io.*;

public class Analysis {

    public void unavailable(String source, String target) {
        try (BufferedReader in = new BufferedReader(new FileReader(source));
             PrintWriter out = new PrintWriter(new BufferedOutputStream(new FileOutputStream(target)))) {
            String line;
            String[] splitted;
            String add;
            boolean downStarts = false;
            while ((line = in.readLine()) != null) {
                line = line.trim();
                if (!line.isBlank() && line.contains(" ")) {
                    splitted = line.split(" ", 2);
                    add = (!("400".equals(splitted[0])) && !("500".equals(splitted[0])) && downStarts) ? System.lineSeparator() : "";
                    if ((("400".equals(splitted[0]) || "500".equals(splitted[0])) && !downStarts)
                        || (!("400".equals(splitted[0])) && !("500".equals(splitted[0])) && downStarts)) {
                        out.print(splitted[1] + ";" + add);
                        downStarts = !downStarts;
                    }
                }
            }
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