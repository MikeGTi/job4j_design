package ru.job4j.algo.hash;

import java.util.*;

public class LongestUniqueSubstring {
    public static String longestUniqueSubstring(String str) {
        String rsl = str.isEmpty() ? "" : str;

        List<Character> charsList = str.chars()
                .mapToObj(c -> (char) c)
                .toList();
        HashSet<Character> charsSet = new HashSet<>(charsList);

        if (charsList.size() != charsSet.size() && charsSet.size() != 1) {
            ArrayList<String> words = getWords(str);
            int max = 0;
            for (String word : words) {
                if (word.length() > max) {
                    max = word.length();
                    rsl = word;
                }
            }
        } else if (charsSet.size() == 1) {
            rsl = Character.toString(charsList.get(0));
        }
        return rsl;
    }

    private static ArrayList<String> getWords(String str) {
        HashSet<Character> charsSet = new HashSet<>();
        ArrayList<String> words = new ArrayList<>();
        int left = 0;
        int right = 0;
        while (right < str.length()) {
            Character chr = str.charAt(right);

            if (charsSet.contains(chr) && right == str.length() - 1) {
                words.add(str.substring(left, right));
                charsSet.clear();
                left = right;
            } else if (charsSet.contains(chr) || right == str.length() - 1) {
                if (right == str.length() - 1) {
                    words.add(str.substring(left));
                } else {
                    words.add(str.substring(left, right));
                }
                charsSet.clear();
                left = right;
            }
            charsSet.add(chr);
            right++;
        }
        return words;
    }
}