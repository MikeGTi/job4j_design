package ru.job4j.iterator;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class EvenNumbersIterator implements Iterator<Integer> {

    private int[] data;
    private int index;

    public EvenNumbersIterator(int[] data) {
        this.data = data;
    }

    @Override
    public boolean hasNext() {
        if (data.length == 0) {
            return false;
        } else {
            return getNextEvenItem() != 0;
        }
    }

    @Override
    public Integer next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }

        int rst = getNextEvenItem();
        this.index++;

        return rst;
    }

    private int getNextEvenItem() {
        if (index >= data.length || data.length == 0) {
            return 0;
        }

        for (int i = index; i < data.length; i++) {
            if (data[i] % 2 == 0) {
                this.index = i;
                return data[i];
            }
        }
        return 0;
    }

    @Override
    public void remove() {
        throw new UnsupportedOperationException();
    }
}