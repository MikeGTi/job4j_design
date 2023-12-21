package ru.job4j.io;

import java.util.StringJoiner;

public class MultiplicationTable {

    public static String print() {
        StringJoiner sj = new StringJoiner("");
        int column = 1;
        int row = 1;
        for (int i = 1; i < 91; i++) {
            if (column > 9) {
                column = 1;
                row++;
                sj.add(System.lineSeparator());
            }
            sj.add(row * (column++) + " ");
        }
        return sj.toString();
    }
}
