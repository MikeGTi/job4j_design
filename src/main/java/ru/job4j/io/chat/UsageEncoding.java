package ru.job4j.io.chat;

import java.io.*;
import java.util.List;
import static java.nio.charset.StandardCharsets.*;

public class UsageEncoding {

    public static void main(String[] args) {
        String path = "./src/data/result.txt";
        UsageEncoding encoding = new UsageEncoding();
        List<String> strings = List.of(
                "Новая строка 1",
                "Новая строка 2",
                "Новая строка 3",
                "Новая строка 4",
                "Новая строка 5"
        );
        for (String string : strings) {
            encoding.writeDataInFile(path, string);
        }
        String string = encoding.readFile(path);
        System.out.println("Данные из файла: ");
        System.out.println(string);
    }

    public String readFile(String path) {
        StringBuilder builder = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new FileReader(path))) {
            reader.lines()
                    .map(string -> string + System.lineSeparator())
                    .forEach(builder::append);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return builder.toString();
    }

    public void writeDataInFile(String path, String data) {
        try (PrintWriter writer = new PrintWriter(
                new FileWriter(path, UTF_8, true))) {
            writer.println(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
