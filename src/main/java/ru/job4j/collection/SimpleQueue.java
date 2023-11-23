package ru.job4j.collection;

import java.util.NoSuchElementException;

public class SimpleQueue<T> {
    private final SimpleStack<T> in = new SimpleStack<>();
    private final SimpleStack<T> out = new SimpleStack<>();

    private boolean isEmpty(SimpleStack<T> stack) {
        boolean isEmpty = false;
        try {
            stack.push(stack.pop());
        } catch (NoSuchElementException e) {
            isEmpty = true;
        }
        return isEmpty;
    }

    public T poll() {
        if (isEmpty(out)) {
            while (!isEmpty(in)) {
                out.push(in.pop());
            }
        }
        if (isEmpty(out)) {
            throw new NoSuchElementException("Queue is empty");
        }
        return out.pop();
    }

    public void push(T value) {
        in.push(value);
    }
}