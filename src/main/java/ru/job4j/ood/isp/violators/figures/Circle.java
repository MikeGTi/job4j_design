package ru.job4j.ood.isp.violators.figures;

/*  Нарушен Interface Segregation Principle (ISP),
 *  Класс Circle нарушает принцип разделения интерфейсов,
 *  т.к. зависит от метода volume(), который не может реализовать.
 *
 *  Решение: Разделить реализуемый интерфейс IFigure на два:
 *  IFigure2D (метод area) и IFigure3D (метод volume)
 */
public class Circle implements IFigure {
    @Override
    public int area() {
        return 0;
    }

    @Override
    public int volume() {
        return 0;
    }
}
