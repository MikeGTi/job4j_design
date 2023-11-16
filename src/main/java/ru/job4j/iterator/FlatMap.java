package ru.job4j.iterator;

import java.util.*;

public class FlatMap<T> implements Iterator<T> {
    private final Iterator<Iterator<T>> data;
    private Iterator<T> cursor = Collections.emptyIterator();
    private T nextValue;

    public FlatMap(Iterator<Iterator<T>> data) {
        this.data = data;
        this.nextValue = null;
    }

    private boolean setNext() {
        while (true) {
            if (cursor.equals(Collections.emptyIterator()) && data.hasNext()) {
                cursor = data.next();
            }
            if (cursor.equals(Collections.emptyIterator()) && !data.hasNext()) {
                return false;
            }
            if (!cursor.equals(Collections.emptyIterator()) && cursor.hasNext()) {
                this.nextValue = cursor.next();
                return true;
            }
            if (!cursor.equals(Collections.emptyIterator()) && !cursor.hasNext()) {
                if (data.hasNext()) {
                    cursor = data.next();
                } else {
                    cursor = Collections.emptyIterator();
                    this.nextValue = null;
                }
            }
        }
    }

    @Override
    public boolean hasNext() {
        return this.nextValue != null || setNext();
    }

    @Override
    public T next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        if (this.nextValue != null) {
            T next = this.nextValue;
            this.nextValue = null;
            setNext();
            return next;
        }
        return null;
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