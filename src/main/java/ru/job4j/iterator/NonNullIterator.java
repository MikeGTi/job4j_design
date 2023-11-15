package ru.job4j.iterator;

import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Optional;

public class NonNullIterator implements Iterator<Integer> {

    private Integer[] data;
    private int index;

    public NonNullIterator(Integer[] data) {
        this.data = data;
    }

    @Override
    public boolean hasNext() {
        if (data.length == 0) {
            return false;
        } else {
            return getNextNotNullItem().isPresent();
        }
    }

    @Override
    public Integer next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }

        Optional<Integer> rst = getNextNotNullItem();
        if (rst.isPresent()) {
            this.index++;
            return rst.get();
        } else {
            throw new Error("Method getNextNotNullItem() return 'Optional.empty()' value");
        }
    }

    private Optional<Integer> getNextNotNullItem() {
        if (index >= data.length || data.length == 0) {
            return Optional.empty();
        }

        for (int i = index; i < data.length; i++) {
            if (data[i] != null) {
                this.index = i;
                return Optional.of(data[i]);
            }
        }
        return Optional.empty();
    }

    @Override
    public void remove() {
        throw new UnsupportedOperationException();
    }
}