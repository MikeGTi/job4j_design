package ru.job4j.io.duplicates;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;

public class DuplicatesFinder {
    public static void main(String[] args) throws IOException {
        searchDuplicates(Path.of("D:\\WAS")).forEach(System.out::println);
    }

    public static HashSet<FileProperty> searchDuplicates(Path root) throws IOException {
        DuplicatesVisitor duplicatesVisitor = new DuplicatesVisitor();
        Files.walkFileTree(root, duplicatesVisitor);
        return duplicatesVisitor.getDuplicates();
    }
}