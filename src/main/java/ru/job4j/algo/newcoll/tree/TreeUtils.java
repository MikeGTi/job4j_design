package ru.job4j.algo.newcoll.tree;

import ru.job4j.collection.SimpleQueue;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


public class TreeUtils<T> {

    /* SimpleQueue need to implements Queue interface */
    SimpleQueue<Node<T>> queue;

    public TreeUtils(SimpleQueue<Node<T>> queue) {
        this.queue = queue;
    }

    /**
     * Метод выполняет обход дерева и считает количество узлов
     * @param root корневой узел дерева
     * @return количество узлов
     * @throws IllegalArgumentException если root является null
     */
    public int countNode(Node<T> root) throws IllegalArgumentException {
        if (root == null) {
            throw new IllegalArgumentException("Node root is empty");
        }

        int rsl = 1;
        queue.push(root);

        while (queue.size() > 0) {
            Node<T> currentNode = queue.poll();
            List<Node<T>> children = currentNode.getChildren();

            if (children.size() > 0) {
                for (Node<T> child : children) {
                    if (child.getValue() != null) {
                        rsl++;
                        queue.push(child);
                    }
                }
            }
        }
        return rsl;
    }

    /**
     * Метод выполняет обход дерева и возвращает коллекцию ключей узлов дерева
     * @param root корневой узел
     * @return коллекция с ключами, реализующая интерфейс Iterable<E>
     * @throws IllegalArgumentException если root является null
     */
    public Iterable<T> findAll(Node<T> root) {
        if (root == null) {
            throw new IllegalArgumentException("Node root is empty");
        }

        Collection<T> rsl = new ArrayList<>();
        queue.push(root);
        rsl.add(root.getValue());

        while (queue.size() > 0) {
            Node<T> currentNode = queue.poll();
            List<Node<T>> children = currentNode.getChildren();

            if (children.size() > 0) {
                for (Node<T> child : children) {
                    if (child.getValue() != null) {
                        rsl.add(child.getValue());
                        queue.push(child);
                    }
                }
            }
        }

        return rsl;
    }
}
