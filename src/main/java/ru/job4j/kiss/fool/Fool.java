package ru.job4j.kiss.fool;

import java.util.Objects;
import java.util.Scanner;

public class Fool {

    private int endsAt = 100;

    public Fool(int endsAt) {
        this.endsAt = endsAt;
    }

    public static void main(String[] args) {
        Fool fool = new Fool(100);
        System.out.println("Game FizzBuzz.");
        var startAt = 1;
        var input = new Scanner(System.in);
        while (startAt < fool.endsAt) {
            fool.printStep(startAt);
            startAt++;
            var answer = input.nextLine();
            if (!fool.validate(startAt, answer)) {
                System.out.println("Error. Starts new.");
                startAt = 0;
            }
            startAt++;
        }
        System.out.println("You win!");
    }
    
    public void printStep(int index) {
        if (index % 3 == 0 && index % 5 == 0) {
            System.out.println("FizzBuzz");
        } else if (index % 3 == 0) {
            System.out.println("Fizz");
        } else if (index % 5 == 0) {
            System.out.println("Buzz");
        } else {
            System.out.println(index);
        }
    }
    
    public boolean validate(int index, String answer) {
        boolean valid = true;
        if (index % 3 == 0 && index % 5 == 0) {
            if (!"FizzBuzz".equals(answer)) {
                valid = false;
            }
        } else if (index % 3 == 0) {
            if (!"Fizz".equals(answer)) {
                valid = false;
            }
        } else if (index % 5 == 0) {
            if (!"Buzz".equals(answer)) {
                valid = false;
            }
        } else {
            if (!Objects.equals(String.valueOf(index), answer)) {
                valid = false;
            }
        }
        return valid;
    }
}