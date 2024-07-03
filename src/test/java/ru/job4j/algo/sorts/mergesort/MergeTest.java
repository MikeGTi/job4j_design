package ru.job4j.algo.sorts.mergesort;

import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.*;

class MergeTest {
    @Test
    void whenMergesortThenSizesEqual() {
        int[] array = {10, 4, 6, 4, 8, -13, 2, 3};
        assertThat(Merge.mergesort(array).length).isEqualTo(array.length);
    }

    @Test
    void whenInputArrayWithOneElementThenSortedEqual() {
        int[] array = {10};
        assertThat(Merge.mergesort(array)).isEqualTo(array);
    }

    @Test
    void whenInputArrayWithSeveralEqualValuesThenOk() {
        int[] array = {1, 1, 1, 1, 1, 1, 1, 1};
        assertThat(Merge.mergesort(array)).containsExactly(1, 1, 1, 1, 1, 1, 1, 1);
    }

    @Test
    void whenInputArrayEmptyThenSortedEmpty() {
        int[] array = new int[]{};
        assertThat(Merge.mergesort(array)).isEqualTo(array);
    }

    @Test
    void whenSortedThenOk() {
        int[] array = {10, 4, 6, 4, 8, -13, 2, 3};
        assertThat(Merge.mergesort(array)).containsExactly(-13, 2, 3, 4, 4, 6, 8, 10);
    }
}