package ru.job4j.algo.newcoll.tree;

import ru.job4j.collection.SimpleQueue;
import ru.job4j.collection.SimpleStack;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;


public class TreeUtils<T> {

    /* Needs to re-code by SOLID principles, on Queue & Stack interfaces dependencies injection by constructor */

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

        SimpleQueue<Node<T>> queue = new SimpleQueue<>();
        int rsl = 1;
        queue.push(root);

        while (queue.size() > 0) {
            Node<T> parent = queue.poll();
            List<Node<T>> children = parent.getChildren();

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

        SimpleQueue<Node<T>> queue = new SimpleQueue<>();
        Collection<T> rsl = new ArrayList<>();
        queue.push(root);
        rsl.add(root.getValue());

        while (queue.size() > 0) {
            Node<T> parent = queue.poll();
            List<Node<T>> children = parent.getChildren();

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

    /**
     * Метод обходит дерево root и добавляет к узлу с ключом parent
     * новый узел с ключом child, при этом на момент добавления узел с ключом parent
     * уже должен существовать в дереве, а узла с ключом child в дереве быть не должно
     * @param root корень дерева
     * @param parent ключ узла-родителя
     * @param child ключ узла-потомка
     * @return true если добавление произошло успешно и false в обратном случае.
     * @throws IllegalArgumentException если root является null
     */
    public boolean add(Node<T> root, T parent, T child) {
        boolean rsl = false;
        Optional<Node<T>> parentNode = findByKey(root, parent);
        if (parentNode.isPresent()) {
            List<Node<T>> children = parentNode.get().getChildren();
            rsl =  children.add(new Node<>(child));
            if (rsl) {
                parentNode.get().setChildren(children);
            }
        }
        return rsl;
    }

    /**
     * Метод обходит дерево root и возвращает первый найденный узел с ключом key
     * @param root корень дерева
     * @param key ключ поиска
     * @return узел с ключом key, завернутый в объект типа Optional
     * @throws IllegalArgumentException если root является null
     */
    public Optional<Node<T>> findByKey(Node<T> root, T key) {
        if (root == null) {
            throw new IllegalArgumentException("Node root is empty");
        }

        SimpleStack<Node<T>> stack = new SimpleStack<>();
        Optional<Node<T>> rsl = Optional.empty();
        stack.push(root);

        while (stack.size() > 0) {
            Node<T> parent = stack.pop();
            T parentValue = parent.getValue();
            if (parentValue == key) {
                rsl = Optional.of(parent);
                break;
            }
            List<Node<T>> children = parent.getChildren();

            if (children.size() > 0) {
                for (Node<T> child : children) {
                    T childValue = child.getValue();
                    if (childValue != null) {
                        if (childValue == key) {
                            rsl = Optional.of(child);
                            break;
                        }
                        stack.push(child);
                    }
                }
            }
        }
        return rsl;
    }

    /**
     * Метод обходит дерево root и возвращает первый найденный узел с ключом key,
     * при этом из дерева root удаляется все поддерево найденного узла
     * @param root корень дерева
     * @param key ключ поиска
     * @return узел с ключом key, завернутый в объект типа Optional
     * @throws IllegalArgumentException если root является null
     */
    public Optional<Node<T>> divideByKey(Node<T> root, T key) {
        if (root == null) {
            throw new IllegalArgumentException("Node root is empty");
        }

        if (root.getValue() == key) {
            return Optional.of(root);
        }

        SimpleStack<Node<T>> stack = new SimpleStack<>();
        Optional<Node<T>> rsl = Optional.empty();
        stack.push(root);

        while (stack.size() > 0) {
            Node<T> parent = stack.pop();
            List<Node<T>> children = parent.getChildren();

            if (children.size() > 0) {
                for (Node<T> child : children) {
                    T childValue = child.getValue();
                    if (childValue != null) {
                        if (childValue == key) {
                            rsl = Optional.of(child);
                            parent.setChildren(children.stream().filter(c -> !c.equals(child)).toList());
                            break;
                        }
                        stack.push(child);
                    }
                }
            }
        }
        return rsl;
    }
}
