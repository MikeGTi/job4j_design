package ru.job4j.cache.menu;

import ru.job4j.cache.DirFileCache;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
import java.nio.file.Path;
import java.util.List;
import java.util.Optional;
import java.util.Scanner;
import java.util.stream.Stream;

public class Emulator {
    private static final String DIR_TO = "d";
    private static final String DIR_INPUT = " Введите директорию (путь): ";
    private static final String DIR_FILES_ABSENT = " Файлы отсутствуют в директории ";
    private static final String FILE_TO = "f";
    private static final String FILE_GET = "g";
    private static final String FILE_ERROR = " Некорректное имя файла ";
    private static final String FILE_INPUT = " Введите имя файла: ";
    private static final String FILE_INPUT_ADDED = " Файл добавлен в кэш ";
    private static final String FILE_TEXT = " Текст файла: ";
    private static final String END = "e";
    private static final String END_TEXT = "Конец работы";

    private static final String MENU_START = """
                Введите директорию/путь:
            """;

    private static final String MENU_SELECT = """
                
                d, изменение директории/пути.
                f, добавление файла в кэш.
                g, получение содержимого файла.
                e, выход из программы.
            """;

    private DirFileCache cache;

    private Optional<List<String>> files;

    public Emulator() {    }

    public static void main(String[] args) {
        Emulator emulator = new Emulator();
        Scanner scanner = new Scanner(System.in);
        String filename;

        System.out.println(MENU_START);
        emulator.init(scanner.nextLine());

        boolean run = true;
        while (run) {
            System.out.println(MENU_SELECT);
            String userChoice = scanner.nextLine();
            System.out.println(userChoice);
            if (DIR_TO.equals(userChoice)) {
                System.out.println(DIR_INPUT);
                emulator.init(scanner.nextLine());
            } else if (FILE_TO.equals(userChoice)) {
                filename = emulator.requestFilename(scanner);
                if (emulator.validateFilename(filename)) {
                    emulator.cache.get(filename);
                    System.out.println(FILE_INPUT_ADDED);
                } else {
                    System.out.println(FILE_ERROR);
                }
            } else if (FILE_GET.equals(userChoice)) {
                filename =  emulator.requestFilename(scanner);
                if (emulator.validateFilename(filename)) {
                    System.out.println(FILE_TEXT);
                    System.out.println(emulator.cache.get(filename));
                    System.out.println(FILE_INPUT_ADDED);
                } else {
                    System.out.println(FILE_ERROR);
                }
            } else if (END.equals(userChoice)) {
                run = false;
                System.out.println(END_TEXT);
            }
        }
    }

    private boolean validateFilename(String file) {
        return files.isPresent() && files.get().contains(file);
    }

    private String requestFilename(Scanner scanner) {
        files.ifPresent(f -> f.forEach(f1 -> System.out.printf("    %s%n", f1)));
        if (files.isEmpty()) {
            System.out.println(DIR_FILES_ABSENT);
        }
        System.out.println(FILE_INPUT);
        return scanner.nextLine();
    }

    private void init(String directory) throws InvalidPathException {
        files = getFiles(directory);
        cache = new DirFileCache(directory);
    }

    private Optional<List<String>> getFiles(String directory) {
        List<String> rsl = null;
        try (Stream<Path> paths = Files.walk(Path.of(directory))) {
            rsl = paths
                        .filter(Files::isRegularFile)
                        .map(f -> f.getFileName().toString())
                        .filter(f -> f.endsWith("txt"))
                        .toList();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return rsl != null ?  Optional.of(rsl) : Optional.empty();
    }
}
