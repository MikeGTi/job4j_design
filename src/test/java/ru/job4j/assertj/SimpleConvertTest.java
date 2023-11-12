package ru.job4j.assertj;

import org.assertj.core.data.Index;
import org.junit.jupiter.api.Test;

import java.util.*;

import static org.assertj.core.api.Assertions.assertThat;

class SimpleConvertTest {
    @Test
    void checkArray() {
        SimpleConvert simpleConvert = new SimpleConvert();
        String[] array = simpleConvert.toArray("first", "second", "three", "four", "five");
        assertThat(array).isInstanceOf(String[].class)
                .hasSize(5)
                .contains("second")
                .contains("first", Index.atIndex(0))
                .containsAnyOf("zero", "second", "six")
                .doesNotContain("first", Index.atIndex(1));
    }

    @Test
    void checkList() {
        SimpleConvert simpleConvert = new SimpleConvert();
        List<String> list = simpleConvert.toList("1", "2", "3", "4", "5", "6");
        assertThat(list).isInstanceOf(List.class)
                .hasSize(6)
                .contains("2")
                .contains("1", Index.atIndex(0))
                .containsAnyOf("0", "2", "6", "7")
                .doesNotContain("1", Index.atIndex(1));
    }

    @Test
    void checkSet() {
        SimpleConvert simpleConvert = new SimpleConvert();
        Set<String> set = simpleConvert.toSet("1", "2", "3", "4", "5", "6");
        assertThat(set).isInstanceOf(Set.class)
                .hasSize(6)
                .contains("2")
                .containsExactly("1", "2", "3", "4", "5", "6")
                .containsAnyOf("0", "2", "6", "7")
                .doesNotContain("0");
    }

    @Test
    void checkMap() {
        SimpleConvert simpleConvert = new SimpleConvert();
        Map<String, Integer> map = simpleConvert.toMap("1", "2", "3", "4", "5", "6");
        assertThat(map).isInstanceOf(Map.class)
                .hasSize(6)
                .contains(Map.entry("1", 0))
                .containsAnyOf(Map.entry("0", 0), Map.entry("1", 0))
                .doesNotContain(Map.entry("0", 0));
    }
}