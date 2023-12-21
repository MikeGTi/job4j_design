package ru.job4j.io;

import java.io.FileInputStream;
import java.io.IOException;

public class EvenNumberFile {
    public static void main(String[] args) {
        String path = "data/even.txt";
        String text = getTextFromFile(path);
        parseIntAndPrint(text);
    }

    private static String getTextFromFile(String path) {
        try (FileInputStream in = new FileInputStream(path)) {
            StringBuilder text = new StringBuilder();
            int read;
            while ((read = in.read()) != -1) {
                text.append((char) read);
            }
            return text.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    private static void parseIntAndPrint(String text) {
        String[] rows = text.split(System.lineSeparator());
        int cur;
        for (String row : rows) {
            cur = Integer.parseInt(row);
            System.out.println(cur + " " + (cur % 2 == 0 ? "- четное" : "- нечетное"));
        }
    }
}
