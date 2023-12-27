package ru.job4j.io.duplicates;

import java.io.File;
import java.nio.file.FileVisitResult;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.*;

public class DuplicatesVisitor extends SimpleFileVisitor<Path> {

    private final HashMap<FileProperty, List<Path>> filesMap = new HashMap<>();

    @Override
    public FileVisitResult visitFile(Path path,
                                     BasicFileAttributes attributes) {
        File file = path.toFile();
        filesMap.computeIfAbsent(new FileProperty(file.length(), file.getName()), k -> new ArrayList<>()).add(path);
        return FileVisitResult.CONTINUE;
    }

    public void getDuplicates() {
        float size;
        for (Map.Entry<FileProperty, List<Path>> e : filesMap.entrySet()) {
            if (e.getValue().size() > 1) {
                System.out.println();
                size = (float) e.getKey().getSize() / 1024;
                System.out.printf("%s - %.1fKb (excess: %.1fKb)%n", e.getKey().getName(), size, e.getValue().size() * size);
                e.getValue().stream().map(path -> "    " + path.toAbsolutePath()).forEach(System.out::println);
            }
        }
    }
}