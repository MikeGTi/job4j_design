package ru.job4j.collection;

import java.util.NoSuchElementException;

public class SimpleStack<T> {

    private ForwardLinked<T> linked = new ForwardLinked<>();

    public T pop() throws NoSuchElementException {
        return linked.deleteFirst();
    }

    public void push(T value) {
        linked.addFirst(value);
    }
}