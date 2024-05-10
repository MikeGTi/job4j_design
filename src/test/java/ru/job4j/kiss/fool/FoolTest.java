package ru.job4j.kiss.fool;

import org.junit.jupiter.api.Test;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.StringJoiner;

import static org.junit.jupiter.api.Assertions.*;

public class FoolTest {

    /* If the number is Divisible by 3, the program prints "Fizz". */
    @Test
    public void whenDivisibleBy3thanPrintsFizz() {
        Fool.Step step = new Fool.Step(3);
        assertEquals("Fizz", step.value());
    }

    /* If the number is Divisible by 5, the program prints "Buzz". */
    @Test
    public void whenDivisibleBy5thanPrintsBuzz() {
        Fool.Step step = new Fool.Step(5);
        assertEquals("Buzz", step.value());
    }

    /* If the number is Divisible by both 3 and 5, the program prints "FizzBuzz". */
    @Test
    public void whenDivisibleBy3and5thanPrintsFizzBuzz() {
        Fool.Step step = new Fool.Step(15);
        assertEquals("FizzBuzz", step.value());
    }

    /* The program ends with printing "You win!" if the user successfully completes the game. */
    @Test
    public void whenProgramEndsThanPrintsYouWin() {
        /* Create a ByteArrayOutputStream to capture the output */
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        System.setOut(new PrintStream(outputStream));

        StringJoiner sj = new StringJoiner(System.lineSeparator());
        for (int i = 2; i < 101; i = i + 2) {
            sj.add(new Fool.Step(i).value());
        }

        /* Create a ByteArrayInputStream to simulate user input */
        ByteArrayInputStream inputStream = new ByteArrayInputStream(sj.toString().getBytes());
        System.setIn(inputStream);

        /* Call the main method of Fool class */
        Fool.main(null);

        /* Check if the output contains "You win!" */
        assertTrue(outputStream.toString().contains("You win!"));
    }
}