package ru.job4j.ood.isp.violators.worker;


/*  Нарушен Interface Segregation Principle (ISP),
 *  Класс Robot нарушает принцип разделения интерфейсов,
 *  т.к. зависит от метода eat(), который не реализует.
 *
 *  Решение: Разделить реализуемый интерфейс Worker на два:
 *  Worker (метод work) и Eater (метод eat())
 */
public class Robot implements Worker {

    @Override
    public void work() {

    }

    @Override
    public void eat() {
        System.out.println("Robot can't eat!");
    }
}
