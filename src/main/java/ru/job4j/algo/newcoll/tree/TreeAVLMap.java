package ru.job4j.algo.newcoll.tree;

import java.util.*;

public class TreeAVLMap<T extends Comparable<T>, V> {

    private Node root;

    public boolean insert(T elementKey, V elementValue) {
        boolean result = false;
        if (Objects.nonNull(elementValue)) {
            if (contains(elementKey)) {
                remove(elementKey);
            }
            root = insert(root, elementKey, elementValue);
            result = true;
        }
        return result;
    }

    private Node insert(Node node, T elementKey, V elementValue) {
        Node result = new Node(elementKey, elementValue);
        if (Objects.nonNull(node)) {
            int comparisonResult = elementKey.compareTo(node.key);
            if (comparisonResult < 0) {
                node.left = insert(node.left, elementKey, elementValue);
            } else {
                node.right = insert(node.right, elementKey, elementValue);
            }
            updateHeight(node);
            result = balance(node);
        }
        return result;
    }

    public boolean remove(T elementKey) {
        boolean result = false;
        if (Objects.nonNull(elementKey) && Objects.nonNull(root) && contains(elementKey)) {
            root = remove(root, elementKey);
            result = true;
        }
        return result;
    }

    private Node remove(Node node, T elementKey) {
        if (node == null) {
            return null;
        }
        int comparisonResult = elementKey.compareTo(node.key);
        if (comparisonResult < 0) {
            node.left = remove(node.left, elementKey);
        } else if (comparisonResult > 0) {
            node.right = remove(node.right, elementKey);
        } else {
            if (node.left == null) {
                return node.right;
            } else if (node.right == null) {
                return node.left;
            } else {
                if (node.left.height > node.right.height) {
                    T heir = maximum(node.left).key;
                    node.key = heir;
                    node.left = remove(node.left, heir);
                } else {
                    T heir = minimum(node.right).key;
                    node.key = heir;
                    node.right = remove(node.right, heir);
                }
            }
        }
        updateHeight(node);
        return balance(node);
    }

    public T minimum() {
        return Objects.nonNull(root) ? minimum(root).key : null;
    }

    private Node minimum(Node node) {
        Node result;
        if (Objects.nonNull(node) && Objects.isNull(node.left)) {
            result = node;
        } else {
            result = minimum(node.left);
        }
        return result;
    }

    public T maximum() {
        return Objects.nonNull(root) ? maximum(root).key : null;
    }

    private Node maximum(Node node) {
        Node result;
        if (Objects.nonNull(node) && Objects.isNull(node.right)) {
            result = node;
        } else {
            result = maximum(node.right);
        }
        return result;
    }
    
    public boolean contains(T elementKey) {
        return Objects.nonNull(root) && Objects.nonNull(find(root, elementKey));
    }

    private Node find(Node node, T elementKey) {
        if (Objects.isNull(node)) {
            return null;
        }

        Node result;
        if (elementKey.compareTo(node.key) == 0) {
            result = node;
        } else if (elementKey.compareTo(node.key) > 0) {
            result = find(node.right, elementKey);
        } else {
            result = find(node.left, elementKey);
        }
        return result;
    }

    private void updateHeight(Node node) {
        int leftNodeHeight = Objects.isNull(node.left) ? -1 : node.left.height;
        int rightNodeHeight = Objects.isNull(node.right) ? -1 : node.right.height;
        node.height = 1 + Math.max(leftNodeHeight, rightNodeHeight);
        node.balanceFactor = rightNodeHeight - leftNodeHeight;
    }

    private Node balance(Node node) {
        Node result = node;
        if (node.balanceFactor < -1) {
            if (node.left.balanceFactor >= 0) {
                result = leftRightCase(node);
            } else {
                result = rightRotation(node);
            }
        } else if (node.balanceFactor > 1) {
            if (node.right.balanceFactor >= 0) {
                result = leftRotation(node);
            } else {
                result = rightLeftCase(node);
            }
        }
        return result;
    }

    private Node leftRightCase(Node node) {
        node.left = leftRotation(node.left);
        return rightRotation(node);
    }

    private Node rightLeftCase(Node node) {
        node.right = rightRotation(node.right);
        return leftRotation(node);
    }

    private Node leftRotation(Node node) {
        Node newParent = node.right;
        node.right = newParent.left;
        newParent.left = node;
        updateHeight(node);
        updateHeight(newParent);
        return newParent;
    }

    private Node rightRotation(Node node) {
        Node newParent = node.left;
        node.left = newParent.right;
        newParent.right = node;
        updateHeight(node);
        updateHeight(newParent);
        return newParent;
    }



    public V get(T elementKey) {
        V result = null;
        if (Objects.nonNull(root) && contains(elementKey)) {
            result = find(root, elementKey).value;
        }
        return result;
    }

    public Set<T> keySet() {
        Set<T> result = new HashSet<>();
        Node node = root;
        return inSymmetricalOrder(node, result);
    }

    private Set<T> inSymmetricalOrder(Node localRoot, Set<T> set) {
        if (localRoot != null) {
            inSymmetricalOrder(localRoot.left, set);
            set.add(localRoot.key);
            inSymmetricalOrder(localRoot.right, set);
        }
        return set;
    }

    public Collection<V> values() {
        Collection<V> result = new ArrayList<>();
        Node node = root;
        return getValuesInSymmetricalOrder(node, result);
    }

    private Collection<V> getValuesInSymmetricalOrder(Node localRoot, Collection<V> collection) {
        if (localRoot != null) {
            getValuesInSymmetricalOrder(localRoot.left, collection);
            collection.add(localRoot.value);
            getValuesInSymmetricalOrder(localRoot.right, collection);
        }
        return collection;
    }

    private class Node {
        private int balanceFactor;
        private T key;
        private V value;
        private int height;
        private Node left;
        private Node right;

        Node(T key, V value) {
            this.key = key;
            this.value = value;
        }
    }
}