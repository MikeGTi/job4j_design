package ru.job4j.io;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

public class ResultFile {
    public static void main(String[] args) {
        try (PrintWriter out = new PrintWriter(
                new BufferedOutputStream(
                        new FileOutputStream("./src/data/result.txt")
                ))) {
            out.println("Hello, world!");
            out.printf("%.2f%n", 1.5f);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}