package ru.job4j.io;

import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class PathExample {
    public static void main(String[] args) throws IOException {
        Path directory = Paths.get("./src/data/path/paths");
        Files.createDirectories(directory);
        Path target = Paths.get("./src/data/path");
        Path pathOne = Path.of("./src/data/path/paths/path1.txt");
        Files.createFile(pathOne);
        Path pathTwo = Path.of("./src/data/path/path2.txt");
        Files.createFile(pathTwo);
        DirectoryStream<Path> paths = Files.newDirectoryStream(target);
        paths.forEach(System.out::println);
    }
}