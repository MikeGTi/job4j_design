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
        int rst = 0;
        outerLoops:
        while (row < data.length) {
            while (column < data[row].length) {
                rst = data[row][column];
                if (rst != 0) {
                    break outerLoops;
                }
                column++;
            }
            column = 0;
            row++;
        }
        return rst != 0;
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