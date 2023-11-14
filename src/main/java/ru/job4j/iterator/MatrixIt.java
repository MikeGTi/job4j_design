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
        if (isEmptyTwoDimArray(data)) {
            return false;
        } else {
            return getNextItem() > 0;
        }
    }

    private boolean isEmptyTwoDimArray(int[][] ar2d) {
        boolean isEmpty = (ar2d.length == 0);
        if (isEmpty) {
            return true;
        }
        for (int[] array : ar2d) {
            if (Arrays.stream(array).anyMatch(Objects::nonNull)) {
                return false;
            }
        }
        return true;
    }

    private int getNextItem() {
        if (column >= data[row].length || data[row].length == 0) {
            column = 0;
            row++;
        }
        for (int i = row; i < data.length; i++) {
            for (int j = column; j < data[i].length; j++) {
                    if (data[i][j] != 0) {
                        this.row = i;
                        this.column = j;
                        return data[i][j];
                    }
                }
                column = 0;
            }
        return 0;
    }

    @Override
    public Integer next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }

        int rst = getNextItem();
        this.column++;

        return rst;
    }
}