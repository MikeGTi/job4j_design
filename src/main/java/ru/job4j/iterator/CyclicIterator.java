package ru.job4j.iterator;

import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

public class CyclicIterator<T> implements Iterator<T> {

    private final List<T> data;
    private int index;

    public CyclicIterator(List<T> data) {
        this.data = data;
    }

    @Override
    public boolean hasNext() {
        if (data.size() == 0) {
            return false;
        } else {
            return getNextItemCyclic().isPresent();
        }
    }

    @Override
    public T next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        Optional<T> rst = getNextItemCyclic();
        if (rst.isPresent()) {
            this.index++;
            return rst.get();
        } else {
            throw new Error("Method getNextItem() return 'Optional.empty()' value");
        }
    }

    private Optional<T> getNextItemCyclic() {
        if (data.size() == 0) {
            return Optional.empty();
        }

        if (index >= data.size()) {
            index = 0;
        }

        for (int i = index; i < data.size(); i++) {
            if (data.get(i) != null) {
                this.index = i;
                return Optional.of(data.get(i));
            }
        }
        return Optional.empty();
    }

    @Override
    public void remove() {
        throw new UnsupportedOperationException();
    }
}