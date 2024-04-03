package ru.job4j.pool;

public class IntPoolExample {
    public static void main(String[] args) {
        System.out.println("Compare digits from Integer pool");
        Integer pool1 = 127;
        Integer pool2 = 127;
        System.out.println(pool1 == pool2);
        System.out.println("Compare digits Not from Integer pool");
        Integer heap1 = -129;
        Integer heap2 = -129;
        System.out.println(heap1 == heap2);
    }

    private static void exampleCreateDigitsNonIntegerPool() {
        Integer pool1 = new Integer(127);
        Integer pool2 = new Integer(127);
        System.out.println(pool1 == pool2);
    }
}