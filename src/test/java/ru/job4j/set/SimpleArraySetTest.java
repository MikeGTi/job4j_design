package ru.job4j.set;

import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.assertThat;

class SimpleArraySetTest {

    @Test
    void whenAddNonNull() {
        SimpleSet<Integer> set = new SimpleArraySet<>();
        assertThat(set.add(1)).isTrue();
        assertThat(set.contains(1)).isTrue();
        assertThat(set.add(1)).isFalse();
    }

    @Test
    void whenAddSomeElementsNonNull() {
        SimpleSet<Integer> set = new SimpleArraySet<>();
        assertThat(set.contains(1)).isFalse();
        assertThat(set.add(1)).isTrue();
        assertThat(set.contains(1)).isTrue();
        assertThat(set.add(1)).isFalse();
        assertThat(set.contains(2)).isFalse();
        assertThat(set.add(2)).isTrue();
        assertThat(set.contains(2)).isTrue();
        assertThat(set.add(2)).isFalse();
        assertThat(set.contains(3)).isFalse();
        assertThat(set.add(3)).isTrue();
        assertThat(set.contains(3)).isTrue();
        assertThat(set.add(3)).isFalse();
    }

    @Test
    void whenAddNull() {
        SimpleSet<Integer> set = new SimpleArraySet<>();
        assertThat(set.add(null)).isTrue();
        assertThat(set.contains(null)).isTrue();
        assertThat(set.add(null)).isFalse();
    }

    /*
     * Parametrized by String
     */
    @Test
    void whenAddNonEmptyString() {
        SimpleSet<String> set = new SimpleArraySet<>();
        assertThat(set.add("Test1")).isTrue();
        assertThat(set.contains("Test1")).isTrue();
        assertThat(set.add("Test1")).isFalse();
    }

    @Test
    void whenAddSomeElementsNonEmptyString() {
        SimpleSet<String> set = new SimpleArraySet<>();
        assertThat(set.contains("Test1")).isFalse();
        assertThat(set.add("Test1")).isTrue();
        assertThat(set.contains("Test1")).isTrue();
        assertThat(set.add("Test1")).isFalse();
        assertThat(set.contains("Test2")).isFalse();
        assertThat(set.add("Test2")).isTrue();
        assertThat(set.contains("Test2")).isTrue();
        assertThat(set.add("Test2")).isFalse();
        assertThat(set.contains("Test3")).isFalse();
        assertThat(set.add("Test3")).isTrue();
        assertThat(set.contains("Test3")).isTrue();
        assertThat(set.add("Test3")).isFalse();
    }

    @Test
    void whenAddEmptyString() {
        SimpleSet<String> set = new SimpleArraySet<>();
        assertThat(set.add("")).isTrue();
        assertThat(set.contains("")).isTrue();
        assertThat(set.add("")).isFalse();
    }
}