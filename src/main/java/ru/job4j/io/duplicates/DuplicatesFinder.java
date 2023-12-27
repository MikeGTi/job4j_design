package ru.job4j.io.duplicates;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class DuplicatesFinder {
    public static void main(String[] args) throws IOException {
        printDuplicates(Path.of("D:\\WAS"));
    }

    public static void printDuplicates(Path root) throws IOException {
        DuplicatesVisitor duplicatesVisitor = new DuplicatesVisitor();
        Files.walkFileTree(root, duplicatesVisitor);
        duplicatesVisitor.getDuplicates();
    }
}