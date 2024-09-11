package ru.job4j.map;

import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class UniqueWordsFinderTest {
    @Test
    public void testFindUniqueWordsWithDuplicates() {
        UniqueWordsFinder uniqueWordsFinder = new UniqueWordsFinder();
        List<String> words = Arrays.asList("apple", "banana", "apple", "orange", "banana", "grape");
        List<String> expected = Arrays.asList("orange", "grape");

        List<String> result = uniqueWordsFinder.findUniqueWords(words);
        assertEquals(expected, result);
    }

    @Test
    public void testFindUniqueWordsAllUnique() {
        UniqueWordsFinder uniqueWordsFinder = new UniqueWordsFinder();
        List<String> words = Arrays.asList("apple", "banana", "orange", "grape");
        List<String> expected = Arrays.asList("apple", "banana", "orange", "grape");

        List<String> result = uniqueWordsFinder.findUniqueWords(words);
        assertEquals(expected, result);
    }

    @Test
    public void testFindUniqueWordsEmptyList() {
        UniqueWordsFinder uniqueWordsFinder = new UniqueWordsFinder();
        List<String> words = new ArrayList<>();
        List<String> expected = new ArrayList<>();

        List<String> result = uniqueWordsFinder.findUniqueWords(words);
        assertEquals(expected, result);
    }

    @Test
    public void testFindUniqueWordsNoUnique() {
        UniqueWordsFinder uniqueWordsFinder = new UniqueWordsFinder();
        List<String> words = Arrays.asList("apple", "apple", "banana", "banana");
        List<String> expected = new ArrayList<>();

        List<String> result = uniqueWordsFinder.findUniqueWords(words);
        assertEquals(expected, result);
    }
}