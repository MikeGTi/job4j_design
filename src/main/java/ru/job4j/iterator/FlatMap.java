package ru.job4j.iterator;

import java.util.*;

public class FlatMap<T> implements Iterator<T> {
    private final Iterator<Iterator<T>> data;
    private Iterator<T> cursor = Collections.emptyIterator();

    public FlatMap(Iterator<Iterator<T>> data) {
        this.data = data;
        if (data.hasNext()) {
            cursor = data.next();
        }
    }

    private void getNextIterator() {
        while (data.hasNext() && data.next().equals(Collections.emptyIterator())) {
            cursor = data.next();
        }
    }

    @Override
    public boolean hasNext() {
        if (cursor.hasNext()) {
            return true;
        } else {
            getNextIterator();
        }
        if (cursor.equals(Collections.emptyIterator())) {
            return false;
        }
        return cursor.hasNext();
    }

    @Override
    public T next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        return cursor.next();
    }

    @Override
    public void remove() {
        throw new UnsupportedOperationException();
    }

    public static void main(String[] args) {
        Iterator<Iterator<Integer>> data = List.of(
                List.of(1, 2, 3).iterator(),
                List.of(4, 5, 6).iterator(),
                List.of(7, 8, 9).iterator()
        ).iterator();
        FlatMap flat = new FlatMap(data);
        while (flat.hasNext()) {
            System.out.println(flat.next());
        }
    }
}