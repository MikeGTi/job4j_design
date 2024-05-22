package ru.job4j.ood.lsp.violators.figures;


/*  Нарушен Liskov Substitution Principle (LSP),
 *  Класс Square расширяющий класс Rectangle
 *  переопределяет методы setHeight, setWidth, которые изменяют поле side - что вызывает
 *  неожиданный эффект при расчете площади.
 *
 *  Решение: Отказ от реализации класса Square и использование класса Rectangle для квадратов
 *  */
public class Square extends Rectangle {

    private int side;

    @Override
    public int getHeight() {
        return side;
    }

    @Override
    public void setHeight(int height) {
        side = height;
    }

    @Override
    public int getWidth() {
        return side;
    }

    @Override
    public void setWidth(int width) {
        side = width;
    }

    @Override
    public int getArea() {
        return side * side;
    }
}
