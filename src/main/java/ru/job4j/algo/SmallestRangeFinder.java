package ru.job4j.algo;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

public class SmallestRangeFinder {

    public static int[] findSmallestRange(int[] nums, int k) {
        int left = 0;
        int right = left + k - 1;
        boolean found = false;
        List<Integer> numsList = Arrays.stream(nums).boxed().toList();
        while (right < numsList.size()) {
            if (isSortedRangeContainUniqueItems(numsList.subList(left, right + 1))) {
                found = true;
                break;
            } else {
                left++;
                right++;
            }
        }
        return  found ? new int[]{left, right} : null;
    }

    private static boolean isSortedRangeContainUniqueItems(List<Integer> nums) {
        return nums.size() == new HashSet<>(nums).size();
    }

    public static void main(String[] args) {
        int[] nums = {1, 3, 5, 7, 9};
        int k = 3;
        int[] result = findSmallestRange(nums, k);
        if (result != null) {
            System.out.println("Наименьший диапазон с " + k + " различными элементами: " + Arrays.toString(result));
        } else {
            System.out.println("Такой диапазон не существует.");
        }
    }
}