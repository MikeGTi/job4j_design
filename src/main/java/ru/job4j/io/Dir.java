package ru.job4j.io;

import java.io.File;
import java.io.IOException;
import java.util.Objects;

public class Dir {
    public static void main(String[] args) throws IOException {
        printDirStats20("D:\\JavaProjects");
    }

    public static void printDirStats20(String path) throws IllegalArgumentException {
        File file = new File(path);
        if (!file.exists()) {
            throw new IllegalArgumentException(String.format("Not exist %s", file.getAbsoluteFile()));
        }
        if (!file.isDirectory()) {
            throw new IllegalArgumentException(String.format("Not directory %s", file.getAbsoluteFile()));
        }
        System.out.printf("Total disk size: %sGb%n", file.getTotalSpace() / 1073741824);
        for (File subfile : Objects.requireNonNull(file.listFiles())) {
            System.out.printf("%s: %sKb%n", subfile.getName(), subfile.length() / 1024);
        }
    }
}