package ru.job4j.kiss.fool;

import java.util.Scanner;

public class Fool {

    static class Step {
        private final int num;

        public Step(int num) {
            this.num = num;
        }

        public String value() {
            String rsl = String.valueOf(num);
            if (num % 3 == 0 && num % 5 == 0) {
                rsl = "FizzBuzz";
            } else if (num % 3 == 0) {
                rsl = "Fizz";
            } else if (num % 5 == 0) {
                rsl = "Buzz";
            }
            return rsl;
        }
    }

    public static void main(String[] args) {
        System.out.println("Game FizzBuzz.");
        var startAt = 1;
        var input = new Scanner(System.in);
        while (startAt < 100) {
            System.out.println(new Step(startAt++).value());
            if (!input.nextLine().equals(new Step(startAt).value())) {
                System.out.println("Error. Starts new game.");
                startAt = 0;
            }
            startAt++;
        }
        System.out.println("You win!");
    }
}