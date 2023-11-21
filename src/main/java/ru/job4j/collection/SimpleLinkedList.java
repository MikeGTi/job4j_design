package ru.job4j.collection;

import java.util.*;

public class SimpleLinkedList<E> implements SimpleLinked<E> {
    private int size;
    private int modCount;
    private Node<E> head;

    @Override
    public void add(E value) {
        SimpleLinkedList.Node<E> newNode = new SimpleLinkedList.Node<>(value, null);
        if (head == null) {
            head = newNode;
        } else {
            SimpleLinkedList.Node<E> last = head;
            while (last.next != null) {
                last = last.next;
            }
            last.next = newNode;
        }
        size++;
        modCount++;
    }

    @Override
    public E get(int index) {
        Objects.checkIndex(index, size);

        int i = 0;
        SimpleLinkedList.Node<E> node = head;
        while (index != i) {
            i++;
            node = node.next;
        }
        return node.item;
    }

    @Override
    public Iterator<E> iterator() {
        return new Iterator<>() {
            private Node<E> nextNode = head;
            private final int expectedModCount = modCount;

            @Override
            public boolean hasNext() {
                if (expectedModCount != modCount) {
                    throw new ConcurrentModificationException();
                }
                return nextNode != null;
            }

            @Override
            public E next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                E item = nextNode.item;
                nextNode = nextNode.next;
                return item;
            }
        };
    }

    private static class Node<E> {
        private final E item;
        private Node<E> next;

        Node(E element, Node<E> next) {
            this.item = element;
            this.next = next;
        }
    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("SimpleLinkedList{");
        SimpleLinkedList.Node<E> node = head;
        while (node != null && node.next != null) {
            stringBuilder.append(node.item.toString())
                         .append(", ");
            node = node.next;
        }
        return stringBuilder.append(node != null ? node.item.toString() : "")
                            .append("}")
                            .toString();
    }

    public static void main(String[] args) {
        /*SimpleLinkedList<Integer> linkedList = new SimpleLinkedList<>();
        for (int i = 1; i < 6; i++) {
            System.out.print("Current size: " + linkedList.size());
            System.out.println(", value: " + linkedList);
            linkedList.add(i);
        }
        System.out.println(linkedList);
        System.out.println("Size: " + linkedList.size());*/
    }
}