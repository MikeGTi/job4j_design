package ru.job4j.io;

import java.io.*;

public class Analysis {

    public void unavailable(String source, String target) {
        try (BufferedReader in = new BufferedReader(new FileReader(source));
             PrintWriter out = new PrintWriter(new BufferedOutputStream(new FileOutputStream(target)))) {
            String line;
            String[] splitted;
            String add;
            boolean isStatusChange;
            boolean downStarted = false;
            while ((line = in.readLine()) != null) {
                line = line.trim();
                if (!line.isBlank() && line.contains(" ")) {
                    splitted = line.split(" ", 2);
                    isStatusChange = ("400".equals(splitted[0]) || "500".equals(splitted[0]));
                    add = (downStarted && !isStatusChange) ? System.lineSeparator() : "";
                    if (downStarted ^ isStatusChange) {
                        out.append(splitted[1]).append(";").append(add);
                        downStarted = !downStarted;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Analysis analysis = new Analysis();
        analysis.unavailable("./src/data/io/server_availability_analysis/test1_server.log", "./src/data/io/server_availability_analysis/test1_target.csv");
        analysis.unavailable("./src/data/io/server_availability_analysis/test2_server.log", "./src/data/io/server_availability_analysis/test2_target.csv");
        analysis.unavailable("./src/data/io/server_availability_analysis/test3_server.log", "./src/data/io/server_availability_analysis/test3_target.csv");
    }
}