package ru.job4j.algo.sorts.mergesort;

import java.util.Arrays;

public class Merge {
    public static int[] mergesort(int[] array) {
        int[] result = array;
        int n = array.length;
        if (n > 1) {
            int[] left = mergesort(Arrays.copyOfRange(array, 0, n / 2));
            int[] right = mergesort(Arrays.copyOfRange(array, n / 2, n));
            result = merge(left, right);
        }
        return result;
    }

    private static int[] merge(int[] left, int[] right) {
        int[] rsl = new int[left.length + right.length];
        int indLeft = 0;
        int indRight = 0;

        for (int i = 0; i < rsl.length; i++) {
            if (indLeft == left.length) {
                rsl[i] = right[indRight++];
            } else if (indRight == right.length) {
                rsl[i] = left[indLeft++];
            } else {
                if (left[indLeft] < right[indRight]) {
                    rsl[i] = left[indLeft++];
                } else {
                    rsl[i] = right[indRight++];
                }
            }
        }
        return rsl;
    }
}
