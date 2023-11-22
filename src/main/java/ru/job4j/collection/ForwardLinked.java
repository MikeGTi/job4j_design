package ru.job4j.collection;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Objects;

public class ForwardLinked<T> implements Iterable<T> {
    private int size;
    private int modCount;
    private Node<T> head;

    public void add(T value) {
        Node<T> newNode = new Node<>(value, null);
        if (head == null) {
            head = newNode;
        } else {
            Node<T> last = head;
            while (last.next != null) {
                last = last.next;
            }
            last.next = newNode;
        }
        size++;
        modCount++;
    }

    public T get(int index) {
        Objects.checkIndex(index, size);

        Node<T> node = head;
        for (int i = 0; i < index; i++) {
            node = node.next;
        }
        return node.item;
    }

    public void addFirst(T value) {
        head = new Node<>(value, head);
        size++;
        modCount++;
    }

    public T deleteFirst() throws NoSuchElementException {
        T value;
        if (head != null) {
            Node<T> toDelete = head;
            value = toDelete.item;
            if (head.next != null) {
                head.item = head.next.item;
                head = head.next;
            } else {
                head.item = null;
                head = null;
            }
            toDelete.item = null;
            toDelete.next = null;
        } else {
            throw new NoSuchElementException();
        }
        size--;
        modCount++;
        return value;
    }

    @Override
    public Iterator<T> iterator() {
        return new Iterator<>() {
            private Node<T> nextNode = head;
            private final int expectedModCount = modCount;

            @Override
            public boolean hasNext() {
                if (expectedModCount != modCount) {
                    throw new ConcurrentModificationException();
                }
                return nextNode != null;
            }

            @Override
            public T next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                T item = nextNode.item;
                nextNode = nextNode.next;
                return item;
            }
        };
    }

    private static class Node<T> {
        private T item;
        private Node<T> next;

        Node(T element, Node<T> next) {
            this.item = element;
            this.next = next;
        }
    }
}