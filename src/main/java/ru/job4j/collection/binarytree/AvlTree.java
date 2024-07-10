package ru.job4j.collection.binarytree;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class AvlTree<T extends Comparable<T>> {

    public Node root;

    public boolean insert(T value) {
        boolean result = false;
        if (Objects.nonNull(value) && !contains(value)) {
            root = insert(root, value);
            result = true;
        }
        return result;
    }

    private Node insert(Node node, T value) {
        Node result = new Node(value);
        if (Objects.nonNull(node)) {
            int comparisonResult = value.compareTo(node.key);
            if (comparisonResult < 0) {
                node.left = insert(node.left, value);
            } else {
                node.right = insert(node.right, value);
            }
            updateHeight(node);
            result = balance(node);
        }
        return result;
    }

    public boolean remove(T value) {
        boolean result = false;
        if (Objects.nonNull(value) && Objects.nonNull(root) && contains(value)) {
            root = remove(root, value);
            result = true;
        }
        return result;
    }

    private Node remove(Node node, T value) {
        if (node == null) {
            return null;
        }
        int comparisonResult = value.compareTo(node.key);
        if (comparisonResult < 0) {
            node.left = remove(node.left, value);
        } else if (comparisonResult > 0) {
            node.right = remove(node.right, value);
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

    public boolean contains(T value) {
        return Objects.nonNull(root) && Objects.nonNull(find(root, value));
    }

    private Node find(Node node, T value) {
        if (Objects.isNull(node)) {
            return null;
        }

        Node result;
        if (value.compareTo(node.key) == 0) {
            result = node;
        } else if (value.compareTo(node.key) > 0) {
            result = find(node.right, value);
        } else {
            result = find(node.left, value);
        }
        return result;
    }

    private void updateHeight(Node node) {
        int leftNodeHeight = Objects.isNull(node.left) ? -1 : node.left.height;
        int rightNodeHeight = Objects.isNull(node.right) ? -1 : node.right.height;
        node.height = 1 + Math.max(leftNodeHeight, rightNodeHeight);
        node.balanceFactor = rightNodeHeight - leftNodeHeight;
    }

    public void clear() {
        Node node = root;
        clear(node);
        root = null;
    }

    private void clear(Node first) {
        if (first != null) {
            clear(first.left);
            clear(first.right);

            first.left = null;
            first.right = null;
            first.key = null;
        }
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

    public List<T> inSymmetricalOrder() {
        List<T> result = new ArrayList<>();
        Node node = root;
        return inSymmetricalOrder(node, result);
    }

    private List<T> inSymmetricalOrder(Node localRoot, List<T> list) {
        if (localRoot != null) {
            inSymmetricalOrder(localRoot.left, list);
            list.add(localRoot.key);
            inSymmetricalOrder(localRoot.right, list);
        }
        return list;
    }

    public List<T> inPreOrder() {
        List<T> result = new ArrayList<>();
        Node node = root;
        return inPreOrder(node, result);
    }

    private List<T> inPreOrder(Node localRoot, List<T> list) {
        if (localRoot != null) {
            list.add(localRoot.key);
            inPreOrder(localRoot.left, list);
            inPreOrder(localRoot.right, list);
        }
        return list;
    }

    public List<T> inPostOrder() {
        List<T> result = new ArrayList<>();
        Node node = root;
        return inPostOrder(node, result);
    }

    private List<T> inPostOrder(Node localRoot, List<T> list) {
        if (localRoot != null) {
            inPostOrder(localRoot.left, list);
            inPostOrder(localRoot.right, list);
            list.add(localRoot.key);
        }
        return list;
    }

    @Override
    public String toString() {
        return TreePrinter.getTreeDisplay(root);
    }

    private class Node implements VisualNode {
        private int balanceFactor;
        private T key;
        private int height;
        private Node left;
        private Node right;

        public Node(T key) {
            this.key = key;
        }

        @Override
        public VisualNode getLeft() {
            return left;
        }

        @Override
        public VisualNode getRight() {
            return right;
        }

        @Override
        public String getText() {
            return String.valueOf(key);
        }
    }
}