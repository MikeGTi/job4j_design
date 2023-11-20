package ru.job4j.collection;

import java.util.*;

public class SimpleArrayList<T> implements SimpleList<T> {

    private T[] container;
    private int size;
    private int modCount;

    public SimpleArrayList(int capacity) {
        container = (T[]) new Object[capacity];
    }

    @Override
    public void add(T value) {
        if (size == container.length) {
            container = grow();
        }
        container[size++] = value;
        modCount++;
    }

    @Override
    public T set(int index, T newValue) {
        if (isOutOfBound(index)) {
            throw new IndexOutOfBoundsException();
        }
        T old = container[index];
        container[index] = newValue;
        return old;
    }

    @Override
    public T get(int index) {
        if (isOutOfBound(index)) {
            throw new IndexOutOfBoundsException();
        }
        return container[index];
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public Iterator<T> iterator() {
        return new Iterator<T>() {
            private int index;
            private final int expectedModCount = modCount;

            @Override
            public boolean hasNext() {
                if (expectedModCount != modCount) {
                    throw new ConcurrentModificationException();
                }
                while (index != size && container[index] == null) {
                    index++;
                }
                return index != size;
            }

            @Override
            public T next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                return container[index++];
            }
        };
    }

    private T[] grow() {
        final int newSize = (container.length == 0 ? 2 : container.length * 2);
        return Arrays.copyOf(container, newSize);
    }

    private boolean isOutOfBound(int index) {
        return 0 <= index && index >= size;
    }

    /*public static void main(String[] args) {
        int[] list1 = new int[] {0, 1, 2, 3, 4, 5, 6, 0, 7, 8, 9};
        int[] list2 = new int[] {10, 11, 12, 13, 14, 15, 16};
        int[] list3 = new int[20];

        Arrays.stream(list1).mapToObj(i -> i + " ").forEach(System.out::print);
        System.out.println();

        System.arraycopy(list1, 8, list1, 7, 3);
        list1[list1.length - 1] = 0;

        Arrays.stream(list1).mapToObj(i -> i + " ").forEach(System.out::print);
    }*/

    @Override
    public T remove(int index) {
        if (isOutOfBound(index)) {
            throw new IndexOutOfBoundsException();
        }
        T removed = container[index];
        System.arraycopy(container,  index + 1, container, index, size - 1 - index);
        container[size - 1] = null;
        size--;
        modCount++;
        return removed;
    }
}