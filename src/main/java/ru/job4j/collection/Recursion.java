package ru.job4j.collection;

public class Recursion {

    public int sum(int summary, int index) {
        if (index > 0) {
            summary += index;
            index--;
            summary = sum(summary, index);
        }
        return summary;
    }

    public int loop(int summary, int index) {
        for (int i = index; i > 0; i--) {
            summary += i;
        }
        return summary;
    }

    public long factorialLoop(int f) {
        long result = 1L;
        if (f > 0) {
            for (int i = 1; i <= f; i++) {
                result = result * i;
            }
        }
        return result;
    }

    public long factorialRecursion(long index) {
        if (index == 0L || index == 1L) {
            return 1L;
        }
        return index * factorialRecursion(index - 1L);
    }

    public long fibonacciLoop(int n) {
        long result = 0L;
        if (n == 1) {
            result = 1L;
        } else if (n > 1) {
            long f1 = 1L;
            long f2 = 1L;
            for (int i = 0; i < (n - 2); i++) {
                result = f2 + f1;
                f1 = f2;
                f2 = result;
            }
        }
        return result;
    }

    public long fibonacciRecursion(int n) {
        if (n == 0) {
            return 0L;
        }
        if (n == 1) {
            return 1L;
        }

        return fibonacciRecursion(n - 1) + fibonacciRecursion(n - 2);
    }

    public static void main(String[] args) {
        Recursion recursion = new Recursion();
        System.out.printf("Factorial by Loop:  %s%n", recursion.factorialLoop(5));
        System.out.printf("Factorial by recursion: %s%n", recursion.factorialRecursion(5));

        System.out.printf("Fibonacci by Loop:  %s%n", recursion.fibonacciLoop(8));
        System.out.printf("Fibonacci by recursion: %s%n", recursion.fibonacciRecursion(8));
    }
}