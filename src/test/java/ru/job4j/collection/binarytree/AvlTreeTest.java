package ru.job4j.collection.binarytree;

import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

class AvlTreeTest {
    @Test
    void whenAddToEmptyTreeThenListContainsOneElement() {
        AvlTree<String> tree = new AvlTree<>();
        assertThat(tree.insert("first")).isTrue();
        assertThat(tree.inSymmetricalOrder()).hasSize(1)
                .containsExactly("first");
    }

    @Test
    void whenAddTwoToEmptyTreeThenListContainsTwoElement() {
        AvlTree<String> tree = new AvlTree<>();
        assertThat(tree.insert("first")).isTrue();
        assertThat(tree.insert("second")).isTrue();
        assertThat(tree.inSymmetricalOrder()).hasSize(2)
                .containsExactly("first", "second");
    }

    @Test
    void whenAddElementThenContainElementOk() {
        AvlTree<String> tree = new AvlTree<>();
        tree.insert("first");
        tree.insert("second");
        tree.insert("three");
        assertThat(tree.contains("second")).isTrue();
        assertThat(tree.contains("four")).isFalse();
    }

    @Test
    void whenAddMaximumNotEndThenOk() {
        AvlTree<Integer> tree = new AvlTree<>();
        for (int element : new int[]{4, 2, 6, 1, 3, 5, 8, 7}) {
            tree.insert(element);
        }
        assertThat(tree.maximum()).isEqualTo(8);
    }

    @Test
    void whenAddMaximumIsEndThenOk() {
        AvlTree<Integer> tree = new AvlTree<>();
        for (int element : new int[]{4, 2, 6, 1, 3, 5, 7}) {
            tree.insert(element);
        }
        assertThat(tree.maximum()).isEqualTo(7);
    }

    @Test
    void whenAddMinimumIsEndThenOk() {
        AvlTree<Integer> tree = new AvlTree<>();
        for (int element : new int[]{4, 2, 6, 3, 5, 7, 1}) {
            tree.insert(element);
        }
        assertThat(tree.minimum()).isEqualTo(1);
    }

    @Test
    void whenAddMinimumIsNotEndThenOk() {
        AvlTree<Integer> tree = new AvlTree<>();
        for (int element : new int[]{4, 2, 6, 3, 5, 7 }) {
            tree.insert(element);
        }
        assertThat(tree.minimum()).isEqualTo(2);
    }

    @Test
    void whenSymmetricalOrderThenOk() {
        AvlTree<Integer> tree = new AvlTree<>();
        for (int element : new int[]{4, 2, 6, 3, 5, 7, 1}) {
            tree.insert(element);
        }
        assertThat(tree.inSymmetricalOrder()).hasSize(7)
                .containsExactly(1, 2, 3, 4, 5, 6, 7);
    }

    @Test
    void whenPreOrderThenOk() {
        AvlTree<Integer> tree = new AvlTree<>();
        for (int element : new int[]{4, 2, 6, 3, 5, 7, 1}) {
            tree.insert(element);
        }
        assertThat(tree.inPreOrder()).hasSize(7)
                .containsExactly(4, 2, 1, 3, 6, 5, 7);
    }

    @Test
    void whenPostOrderThenOk() {
        AvlTree<Integer> tree = new AvlTree<>();
        for (int element : new int[]{4, 2, 6, 3, 5, 7, 1}) {
            tree.insert(element);
        }
        assertThat(tree.inPostOrder()).hasSize(7)
                .containsExactly(1, 3, 2, 5, 7, 6, 4);
    }

    @Test
    public void whenRemoveNonExistentNodeThanFalse() {
        AvlTree<Integer> bst = new AvlTree<>();
        bst.insert(10);
        bst.insert(5);
        bst.insert(15);
        assertFalse(bst.remove(20));
    }

    @Test
    public void whenRemoveRootNode() {
        AvlTree<Integer> bst = new AvlTree<>();
        bst.insert(10);
        bst.insert(5);
        bst.insert(15);
        assertTrue(bst.remove(10));
        assertFalse(bst.contains(10));
    }

    @Test
    public void whenRemoveNodeWithOneChildThanOk() {
        AvlTree<Integer> bst = new AvlTree<>();
        bst.insert(10);
        bst.insert(5);
        bst.insert(15);
        assertTrue(bst.remove(15));
        assertFalse(bst.contains(15));
    }

    @Test
    public void whenRemoveNodeWithTwoChildrenThanOk() {
        AvlTree<Integer> bst = new AvlTree<>();
        bst.insert(10);
        bst.insert(5);
        bst.insert(15);
        bst.insert(3);
        bst.insert(7);
        assertTrue(bst.remove(5));
        assertFalse(bst.contains(5));
    }

    @Test
    public void whenRemoveNodeThanTreeOk() {
        AvlTree<Integer> bst = new AvlTree<>();
        bst.insert(10);
        bst.insert(5);
        bst.insert(15);
        bst.insert(3);
        bst.insert(7);
        /*System.out.printf("Before:%n%s%n", bst);*/
        assertTrue(bst.remove(5));
        /*System.out.printf("Remove node (5):%n%s%n", bst);*/
        assertFalse(bst.contains(5));
        assertTrue(bst.contains(3));
        assertTrue(bst.contains(7));
    }

    @Test
    public void whenClearThanRemovesAllNodes() {
        AvlTree<Integer> bst = new AvlTree<>();
        int[] array = new int[]{2, 1, 10, 6, 14, 4, 8, 12, 16, 11, 9, 13, 15, 17, 3, 5, 7};
        for (int i : array) {
            bst.insert(i);
        }
        bst.clear();
        assertTrue(bst.inSymmetricalOrder().isEmpty());
    }

    @Test
    public void whenClearOnEmptyTree() {
        AvlTree<Integer> bst = new AvlTree<>();
        bst.clear();
        assertTrue(bst.inSymmetricalOrder().isEmpty());
    }

    @Test
    public void whenClearOnSingleNodeTree() {
        AvlTree<Integer> bst = new AvlTree<>();
        bst.insert(1);
        bst.clear();
        assertTrue(bst.inSymmetricalOrder().isEmpty());
    }

    @Test
    public void whenClearOnPopulatedTreeDoesNotThrowExceptions() {
        AvlTree<Integer> bst = new AvlTree<>();
        bst.insert(5);
        bst.insert(10);
        assertDoesNotThrow(bst::clear);
    }

    @Test
    void whenSymmetricalOrderThanOk() {
        AvlTree<Integer> tree = new AvlTree<>();
        for (int i = 1; i < 8; i++) {
            tree.insert(i);
        }
        List<Integer> list = tree.inSymmetricalOrder();
        assertThat(list).containsExactly(1, 2, 3, 4, 5, 6, 7);
    }

}