package ru.job4j.iterator;

import java.util.*;

public class MatrixIt implements Iterator<Integer> {
    private final int[][] data;
    private int row = 0;
    private int column = 0;

    public MatrixIt(int[][] data) {
        this.data = data;
    }

    @Override
    public boolean hasNext() {
        while (row != data.length && (column == data[row].length || data[row].length == 0)) {
            row++;
            column = 0;
        }
        return row != data.length;
    }

    @Override
    public Integer next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        return data[row][column++];
    }

    @Override
    public void remove() {
        throw new UnsupportedOperationException();
    }
}