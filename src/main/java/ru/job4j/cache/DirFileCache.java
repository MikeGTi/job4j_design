package ru.job4j.cache;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
import java.nio.file.Path;


public class DirFileCache extends AbstractCache<String, String> {
    private final String cachingDir;
    public DirFileCache(String cachingDir) {
        this.cachingDir = cachingDir;
    }

    @Override
    protected String load(String key) {
        String rsl = null;
        try {
            Path filepath = Path.of(cachingDir).resolve(Path.of(key));
            rsl = Files.readString(filepath);
            super.put(key, rsl);
        } catch (InvalidPathException ePath) {
            System.out.println("    Ошибка ввода");
        } catch (IOException eio) {
            eio.printStackTrace();
        }
        return rsl;
    }
}