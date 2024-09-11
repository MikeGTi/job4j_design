package ru.job4j.map;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class UniqueWordsFinder {

    public List<String> findUniqueWords(List<String> words) {
        Set<String> wordsUnique = new LinkedHashSet<>();
        for (String word : words) {
            if (!wordsUnique.add(word)) {
                wordsUnique.remove(word);
            }
        }
        return wordsUnique.stream().toList();
    }
}
