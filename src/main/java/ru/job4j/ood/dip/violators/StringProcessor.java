package ru.job4j.ood.dip.violators;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;

/*  Нарушен Dependency Inversion Principle (DIP),
 *  Класс StringProcessor нарушает принцип инверсии зависимостей,
 *  так как зависит от конкретных классов, а не от абстракций.
 *
 *  Решение: Создать интерфейсы и реализовать их через классы.
 *  В класс Reporter внедрять зависимости через конструктор (IStringReader и IStringWriter).
 *  Инициализацию зависимостей можно вынести в отдельный класс, для еще большей гибкости
 *  (например инициализацию через файл *.properties)
 */
public class StringProcessor {

    private final StringReader stringReader;
    private final StringWriter stringWriter;

    public StringProcessor(StringReader stringReader, StringWriter stringWriter) {
        this.stringReader = stringReader;
        this.stringWriter = stringWriter;
    }

    public void printString() throws IOException {
        stringWriter.write(stringReader.read());
    }
}
