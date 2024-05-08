package ru.job4j.kiss.fool;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.*;

class FoolTest {

    private Fool fool;

    @BeforeEach
    void setUp() {
        this.fool = new Fool(100);
    }

    @Test
    public void whenIndexZeroAndAnswerFizzBuzzThanTrue() {
        boolean result = fool.validate(0, "FizzBuzz");
        assertTrue(result);
    }

    @Test
    public void whenIndex30andAnswerFizzBuzzThanTrue() {
        boolean result = fool.validate(30, "FizzBuzz");
        assertTrue(result);
    }

    @Test
    public void whenIndexZeroAndAnswerNotFizzBuzzThanFalse() {
        boolean result = fool.validate(0, "Buzz");
        assertFalse(result);
    }

    @Test
    public void whenIndex3andAnswerFizzThanTrue() {
        boolean result = fool.validate(3, "Fizz");
        assertTrue(result);
    }

    @Test
    public void whenIndex3andAnswerBuzzThanFalse() {
        boolean result = fool.validate(3, "Buzz");
        assertFalse(result);
    }

    @Test
    public void whenIndex3andAnswerBuzzThanTrue() {
        boolean result = fool.validate(5, "Buzz");
        assertTrue(result);
    }

    @Test
    public void whenIndex5andAnswerFizzThanFalse() {
        boolean result = fool.validate(5, "Fizz");
        assertFalse(result);
    }

    @Test
    public void whenIndex5andAnswerBuzzThanTrue() {
        boolean result = fool.validate(5, "Buzz");
        assertTrue(result);
    }

    @Test
    public void whenPrintStepDivisibleBy3and5() {
        ByteArrayOutputStream outContent = new ByteArrayOutputStream();
        System.setOut(new PrintStream(outContent));
        fool.printStep(15);
        assertEquals("FizzBuzz" + System.lineSeparator(), outContent.toString());
    }

    @Test
    public void whenPrintStepDivisibleBy3non5() {
        ByteArrayOutputStream outContent = new ByteArrayOutputStream();
        System.setOut(new PrintStream(outContent));
        fool.printStep(3);
        assertEquals("Fizz" + System.lineSeparator(), outContent.toString());
    }

    @Test
    public void whenPrintStepDivisibleBy5non3() {
        ByteArrayOutputStream outContent = new ByteArrayOutputStream();
        System.setOut(new PrintStream(outContent));
        fool.printStep(5);
        assertEquals("Buzz" + System.lineSeparator(), outContent.toString());
    }

    // Should print "FizzBuzz" if index is the maximum possible value (100)
    @Test
    public void whenPrintStepMaxValue() {
        ByteArrayOutputStream outContent = new ByteArrayOutputStream();
        System.setOut(new PrintStream(outContent));
        fool.printStep(100);
        assertEquals("Buzz" + System.lineSeparator(), outContent.toString());
    }

}