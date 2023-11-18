package ru.job4j.iterator;

import java.util.*;

public class CyclicIterator<T> implements Iterator<T> {

    private final List<T> data;
    private int index;

    public CyclicIterator(List<T> data) {
        this.data = data;
    }

    @Override
    public boolean hasNext() {
        T rst = null;
        while (!data.isEmpty()) {
            if (index == data.size()) {
                index = 0;
            }
            rst = data.get(index);
            if (rst != null) {
                break;
            }
            index++;
        }
        return rst != null;
    }

    @Override
    public T next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        return data.get(index++);
    }

    @Override
    public void remove() {
        throw new UnsupportedOperationException();
    }
}