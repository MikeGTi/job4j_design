package ru.job4j.io.duplicates;

import java.io.File;
import java.nio.file.FileVisitResult;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.HashMap;
import java.util.HashSet;

public class DuplicatesVisitor extends SimpleFileVisitor<Path> {

    private final HashMap<FileProperty, Integer> filesMap = new HashMap<>();

    private final HashSet<FileProperty> duplicates = new HashSet<>();

    @Override
    public FileVisitResult visitFile(Path path,
                                     BasicFileAttributes attributes) {
        File file = path.toFile();
        if (file.isFile()) {
            FileProperty fileProperty = new FileProperty(file.length(), file.getName());
            if (filesMap.containsKey(fileProperty)) {
                filesMap.replace(fileProperty, filesMap.get(fileProperty) + 1);
                duplicates.add(fileProperty);
            } else {
                filesMap.put(fileProperty, 1);
            }
        }
        return FileVisitResult.CONTINUE;
    }

    public HashSet<FileProperty> getDuplicates() {
        return duplicates;
    }
}