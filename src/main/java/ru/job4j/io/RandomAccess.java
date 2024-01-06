package ru.job4j.io;

import java.io.IOException;
import java.io.RandomAccessFile;

public class RandomAccess {

    public static void main(String[] args)  {
        try (RandomAccessFile randomAccess = new RandomAccessFile("./src/data/random.txt", "rw")) {
            randomAccess.writeInt(100);
            randomAccess.writeChar('A');
            randomAccess.writeBoolean(true);
            randomAccess.seek(0);
            System.out.println(randomAccess.readInt());
            System.out.println(randomAccess.readChar());
            System.out.println(randomAccess.readBoolean());
            randomAccess.seek(4);
            System.out.println("Data from position 4: " + randomAccess.readChar());
            randomAccess.seek(4);
            randomAccess.writeChar('B');
            randomAccess.seek(4);
            System.out.println("Data from position 4: " + randomAccess.readChar());
            randomAccess.seek(randomAccess.length());
            System.out.println("Конец файла: " + randomAccess.getFilePointer());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}