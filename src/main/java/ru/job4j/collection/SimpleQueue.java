package ru.job4j.collection;

import java.util.NoSuchElementException;

public class SimpleQueue<T> {
    private final SimpleStack<T> in = new SimpleStack<>();
    private final SimpleStack<T> out = new SimpleStack<>();
    private int inSize = 0;
    private int outSize = 0;

    /**
     * Метод добавляет элемент в конец очереди
     * @param value типа T
     */
    public void push(T value) {
        in.push(value);
        inSize++;
    }

    /**
     * Метод возвращает элемент из начала очереди и удаляет его
     * @return значение первого элемента очереди
     * @throws NoSuchElementException если очередь пуста
     */
    public T poll() {
        if (outSize == 0 && inSize == 0) {
            throw new NoSuchElementException("Queue is empty");
        }

        if (outSize == 0) {
            while (inSize != 0) {
                out.push(in.pop());
                outSize++;
                inSize--;
            }
        }

        outSize--;
        return out.pop();
    }

    /**
     * Метод возвращает элемент из начала очереди, без его удаления
     * @return значение первого элемента очереди
     * @throws NoSuchElementException если очередь пуста
     */
    public T peek() {
        if (outSize == 0 && inSize == 0) {
            throw new NoSuchElementException("Queue is empty");
        }
        if (outSize == 0) {
            while (inSize != 0) {
                out.push(in.pop());
                outSize++;
                inSize--;
            }
        }
        return out.peek();
    }

    /**
     * Метод возвращает количество элементов в очереди
     * @return количество элементов
     */
    public int size() {
        return inSize + outSize;
    }
}