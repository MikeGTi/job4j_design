package ru.job4j.pool;

public class StringPoolExample {
    public static void main(String[] args) {
        System.out.println("Strings compare:");
        exampleStringsCompare();
        System.out.printf("\nIntern method test1: ");
        exampleStringIntern1();
        System.out.printf("\nIntern method test2:");
        exampleStringIntern2();
    }

    private static void exampleStringsCompare() {
        String string1 = new String("Hello");
        String string2 = new String("Hello");
        String string3 = "Hello";
        String string4 = "Hello";
        System.out.println(string1 == string2);
        System.out.println(string3 == string4);
        System.out.println(string1 == string3);
        System.out.println(string2 == string4);
    }

    private static void exampleStringIntern1() {
        String string1 = "Hello";
        String string2 = new String("Hello");
        String string3 = string2.intern();
        System.out.println(string1 == string3);
    }

    private static void exampleStringIntern2() {
        System.out.printf("\nCompare strings from heap (created as objects by new): ");
        System.out.println(new String("New string") == new String("New string"));
        System.out.printf("\nCompare strings interned into string pool: ");
        System.out.println(new String("Interned string").intern() == new String("Interned string").intern());
        /* use (for more efficiency: speed & memory usage) strings intern method and compare by == (not 'equal' method, by chars compare) */
    }
}