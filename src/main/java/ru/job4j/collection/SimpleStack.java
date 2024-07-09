package ru.job4j.collection;

import java.util.NoSuchElementException;

public class SimpleStack<T> {

    private ForwardLinked<T> linked = new ForwardLinked<>();

    /**
     * Метод удаляет верхний элемент стека и возвращает его
     * @return узел находившийся на вершине стека
     * @throws NoSuchElementException если стек пуст
     */
    public T pop() throws NoSuchElementException {
        return linked.deleteFirst();
    }

    /**
     * Метод добавляет верхний элемент стека
     * @param value добавляемое значение
     */
    public void push(T value) {
        linked.addFirst(value);
    }

    /**
     * Метод возвращает верхний элемент стека, без удаления
     * @return узел находящийся на вершине стека
     * @throws NoSuchElementException если стек пуст
     */
    public T peek() throws NoSuchElementException {
        return linked.get(linked.size() - 1);
    }

    /**
     * Метод возвращает количество элементов стека
     * @return количество элементов стека
     */
    public int size() {
        return linked.size();
    }
}