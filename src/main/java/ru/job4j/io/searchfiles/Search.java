package ru.job4j.io.searchfiles;

import ru.job4j.io.ArgsName;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.regex.Pattern;

class Search {

    private static void validateInputArgs(ArgsName argsName) throws IllegalArgumentException {
        if (argsName.size() == 0) {
            throw new IllegalArgumentException("Program arguments absent (Example: '-d=c: -n=*.?xt -t=mask -o=log.txt')");
        }
        if (argsName.size() != 4) {
            throw new IllegalArgumentException("Program arguments needs four values (Example: '-d=c: -n=*.?xt -t=mask -o=log.txt')");
        }
        if (!new File(argsName.get("d")).isDirectory()) {
            throw new IllegalArgumentException("Folder " + argsName.get("d") + " is null.");
        }
        if (!"mask".equals(argsName.get("t"))
            && !"name".equals(argsName.get("t"))
            && !"regex".equals(argsName.get("t"))) {
            throw new IllegalArgumentException("Search type argument " + argsName.get("t") + " non correct (Variants: mask, name, regex)");
        }
    }

    private static String convertMaskToRegExp(String s) {
        return s.replace(".", "\\.")
                .replace("*", ".*")
                .replace("?", ".");
    }

    public static void main(String[] args) throws IOException, IllegalArgumentException {
        /* test cases
        -d=./src/data/ -n=*.?xt -t=mask -o=./src/data/log.txt
        -d=./src/data/ -n=dog.*\.t.* -t=regex -o=./src/data/log.txt
        -d=./src/data/ -n=[Pp].*\.t.* -t=regex -o=./src/data/log.txt
        -d=./src/data/ -n=output.txt -t=name -o=./src/data/log.txt

        -d - директория, в которой начинать поиск.
        -n - маска, имя файла, либо регулярное выражение.
        -t - тип поиска: mask искать по маске, name по полному совпадению имени, regex по регулярному выражению.
        -o - результат записать в файл.
         */

        ArgsName argsName = ArgsName.of(args);
        validateInputArgs(argsName);

        String pattern = argsName.get("n");
        if ("mask".equalsIgnoreCase(argsName.get("t"))) {
            pattern = convertMaskToRegExp(pattern);
        }

        try {
            Path file = Path.of(argsName.get("o"));
            if (!Files.exists(file)) {
                file = Files.createFile(Path.of(argsName.get("o")));
            }
            try {
                Pattern regexp = Pattern.compile(pattern);
                List<String> files = search(Path.of(argsName.get("d")), path -> Pattern.matches(String.valueOf(regexp), path.toFile().getName()));
                Files.write(file, files, StandardCharsets.UTF_8);
            } catch (IllegalArgumentException iae) {
                iae.printStackTrace();
            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
    }

    public static List<String> search(Path root, Predicate<Path> condition) throws IOException {
        SearchFiles searcher = new SearchFiles(condition);
        Files.walkFileTree(root, searcher);
        List<String> paths = new ArrayList<>();
        searcher.getPaths().forEach(path -> paths.add(path.toString()));
        return paths;
    }
}