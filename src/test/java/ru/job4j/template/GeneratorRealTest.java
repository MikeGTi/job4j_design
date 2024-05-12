package ru.job4j.template;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Disabled;
import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Map;
@Disabled("Тесты отключены. Удалить аннотацию после реализации всех методов по заданию.")
class GeneratorRealTest {

    @Test
    public void whenRightArgsThanStringOk() {
        String template = "I am ${name}, Who are ${subject}? ";
        Map<String, String> map = Map.of("name", "Petr Arsentev",
                                         "subject", "you");
        GeneratorReal generator = new GeneratorReal();
        assertEquals("I am Petr Arsentev, Who are you? ", generator.produce(template, map));
    }

    @Test
    public void whenAbsentKeyInMapThanException() {
        String template = "I am ${name}, Who are ${subject}? ";
        Map<String, String> map = Map.of("name", "Petr Arsentev");
        GeneratorReal generator = new GeneratorReal();
        assertThrows(IllegalArgumentException.class, () -> generator.produce(template, map));
    }

    @Test
    public void whenExtraKeyInMapThanException() {
        String template = "I am ${name}, Who are ${subject}? ";
        Map<String, String> map = Map.of("name", "Petr Arsentev",
                                         "subject", "you",
                                         "extra", "key");
        GeneratorReal generator = new GeneratorReal();
        assertThrows(IllegalArgumentException.class, () -> generator.produce(template, map));
    }

}