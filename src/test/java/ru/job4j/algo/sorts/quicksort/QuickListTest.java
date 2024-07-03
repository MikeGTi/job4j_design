package ru.job4j.algo.sorts.quicksort;

import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import static org.assertj.core.api.Assertions.*;

class QuickListTest {
    @Test
    void whenSortThenOk() {
        User user1 = new User(1, "11");
        User user2 = new User(1, "22");
        User user3 = new User(3, "33");
        User user4 = new User(-4, "44");
        User user5 = new User(4, "55");
        User user6 = new User(6, "66");
        Comparator<User> comparator = Comparator.comparingInt(User::getId);
        List<User> listUser = new ArrayList<>();
        listUser.add(user3);
        listUser.add(user5);
        listUser.add(user1);
        listUser.add(user4);
        listUser.add(user6);
        listUser.add(user2);
        QuickList.quickSort(listUser, comparator);
        List<Integer> result = listUser.stream().map(User::getId).toList();
        assertThat(result).containsExactly(-4, 1, 1, 3, 4, 6);
    }

    @Test
    void whenNaturalOrderThenOk() {
        Comparator<Integer> comparator = (a, b) -> a - b;
        List<Integer> list = new ArrayList<>();
        list.add(-2);
        list.add(-8);
        list.add(1);
        list.add(0);
        list.add(10);
        list.add(1);
        list.add(8);
        QuickList.quickSort(list, comparator);
        assertThat(list).containsExactly(-8, -2, 0, 1, 1, 8, 10);
    }

    @Test
    void whenReverseOrderThenOk() {
        Comparator<Integer> comparator = (a, b) -> b - a;
        List<Integer> list = new ArrayList<>();
        list.add(-2);
        list.add(-8);
        list.add(1);
        list.add(0);
        list.add(10);
        list.add(1);
        list.add(8);
        QuickList.quickSort(list, comparator);
        System.out.println(list);
        assertThat(list).containsExactly(10, 8, 1, 1, 0, -2, -8);
    }

    @Test
    void whenInputArrayEmptyThenReturnEmpty() {
        Comparator<Integer> comparator = (a, b) -> b - a;
        List<Integer> list = new ArrayList<>();
        QuickList.quickSort(list, comparator);
        assertThat(list).isEqualTo(List.of());
    }

    @Test
    void whenInputArrayWithOneElementThenOk() {
        Comparator<Integer> comparator = (a, b) -> a - b;
        List<Integer> list1 = new ArrayList<>();
        list1.add(-2);
        QuickList.quickSort(list1, comparator);
        assertThat(list1.size()).isEqualTo(1);
        assertThat(list1).containsExactly(-2);

        List<Integer> list2 = new ArrayList<>();
        list2.add(0);
        QuickList.quickSort(list2, comparator);
        assertThat(list2.size()).isEqualTo(1);
        assertThat(list2).containsExactly(0);

        List<Integer> list3 = new ArrayList<>();
        list3.add(1);
        QuickList.quickSort(list3, comparator);
        assertThat(list3.size()).isEqualTo(1);
        assertThat(list3).containsExactly(1);
    }

    private static class User {
        private Integer id;
        private String name;

        public User(int id, String name) {
            this.id = id;
            this.name = name;
        }

        public int getId() {
            return id;
        }
    }
}