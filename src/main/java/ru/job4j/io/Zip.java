package ru.job4j.io;

import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class Zip {

    public void packFiles(List<Path> sources, File target) {
        try (ZipOutputStream zip = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(target)))) {
            for (Path source : sources) {
                zip.putNextEntry(new ZipEntry(source.toString()));
                try (BufferedInputStream output = new BufferedInputStream(new FileInputStream(source.toFile()))) {
                    zip.write(output.readAllBytes());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void validate(ArgsName argsName) throws IllegalArgumentException {
        if (argsName.size() != 3) {
            throw new IllegalArgumentException("Arguments not passed to program");
        }
        if (!new File(argsName.get("d")).isDirectory()) {
            throw new IllegalArgumentException("Root folder is null. Usage ROOT_FOLDER.");
        }
        if (!argsName.get("e").startsWith(".")) {
            throw new IllegalArgumentException("Exclude extension missing '.'");
        }
        if (!argsName.get("o").endsWith(".zip")) {
            throw new IllegalArgumentException("Archive don't have extension ('.zip')");
        }
    }

    public void packSingleFile(File source, File target) {
        try (ZipOutputStream zip = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(target)))) {
            zip.putNextEntry(new ZipEntry(source.getPath()));
            try (BufferedInputStream output = new BufferedInputStream(new FileInputStream(source))) {
                zip.write(output.readAllBytes());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws IOException {
        ArgsName jvm = ArgsName.of(args);
        Zip zipper = new Zip();
        zipper.validate(jvm);
        List<Path> files = Search.search(Paths.get(jvm.get("d")), path -> !path.toFile().getName().endsWith(jvm.get("e")));
        File out = new File(jvm.get("o"));
        if (out.createNewFile()) {
            zipper.packFiles(files, out);
        }

        Zip zip = new Zip();
        zip.packSingleFile(
                new File("./pom.xml"),
                new File("./pom.zip")
        );
    }
}