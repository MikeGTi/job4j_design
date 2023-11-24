package ru.job4j.iterator;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.util.*;

class ListUtilsTest {

    private List<Integer> input;

    @BeforeEach
    void setUp() {
        input = new ArrayList<>(Arrays.asList(1, 3));
    }

    @Test
    void whenAddBefore() {
        ListUtils.addBefore(input, 1, 2);
        assertThat(input).hasSize(3).containsSequence(1, 2, 3);
    }

    @Test
    void whenAddBeforeWithInvalidIndex() {
        assertThatThrownBy(() -> ListUtils.addBefore(input, 3, 2))
                .isInstanceOf(IndexOutOfBoundsException.class);
    }

    @Test
    void whenAddAfter() {
        ListUtils.addAfter(input, 0, 2);
        assertThat(input).hasSize(3).containsSequence(1, 2, 3);
    }

    @Test
    void whenRemoveIfAll() {
        ListUtils.removeIf(input, x -> true);
        assertThat(input).hasSize(0);
    }

    @Test
    void whenRemoveIfNotAll() {
        ListUtils.removeIf(input, x -> x < 3);
        assertThat(input).hasSize(1).containsSequence(3);
    }

    @Test
    void whenRemoveIfNothing() {
        ListUtils.removeIf(input, x -> false);
        assertThat(input).hasSize(2).containsSequence(1, 3);
    }

    @Test
    void whenReplaceIfAll() {
        ListUtils.replaceIf(input, x -> true, 4);
        assertThat(input).hasSize(2).containsSequence(4, 4);
    }

    @Test
    void whenReplaceIfNotAll() {
        ListUtils.replaceIf(input, x -> x > 1, 2);
        assertThat(input).hasSize(2).containsSequence(1, 2);
    }

    @Test
    void whenReplaceIfNothing() {
        ListUtils.replaceIf(input, x -> false, 2);
        assertThat(input).hasSize(2).containsSequence(1, 3);
    }

    @Test
    void whenRemoveAllAll() {
        ListUtils.removeAll(input, List.of(1, 3));
        assertThat(input).hasSize(0).containsSequence();
    }

    @Test
    void whenRemoveAllNotAll() {
        ListUtils.removeAll(input, List.of(1, 5));
        assertThat(input).hasSize(1).containsSequence(3);
    }

    @Test
    void whenRemoveAllNothing() {
        ListUtils.removeAll(input, List.of(4, 5));
        assertThat(input).hasSize(2).containsSequence(1, 3);
    }
}