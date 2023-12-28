package ru.job4j.io;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.function.Predicate;

public class Search {
    public static void main(String[] args) throws IOException, IllegalArgumentException {
        validateInputArgs(args);
        Path start = Paths.get(args[0]);
        search(start, path -> path.toFile().getName().endsWith(args[1])).forEach(System.out::println);
    }

    private static void validateInputArgs(String[] args) throws IllegalArgumentException {
        if (args.length == 0) {
            throw new IllegalArgumentException("Program arguments absent (Example: ' c:\\ txt')");
        }
        if ("".equals(args[0])) {
            throw new IllegalArgumentException("Root folder is null. Usage ROOT_FOLDER.");
        }
        if ("".equals(args[1])) {
            throw new IllegalArgumentException("File extension is null. Usage FILE_EXTENSION.");
        }
    }

    public static List<Path> search(Path root, Predicate<Path> condition) throws IOException {
        SearchFiles searcher = new SearchFiles(condition);
        Files.walkFileTree(root, searcher);
        return searcher.getPaths();
    }
}