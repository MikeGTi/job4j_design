package ru.job4j.ood.lsp.violators.cars;

/*  Нарушен Liskov Substitution Principle (LSP),
 *  Класс ToyCar расширяющий класс Car реализует метод reset, сбрасывающий счетчик пробега,
 *  при этом нарушая контракт класса Car, это испортит работу любого клиентского кода,
 *  который полагается на ограничение.
 *
 *  Решение: Отказ от метода reset в классе ToyCar или отказ от наследования
 *
 *  Также дан пример 2 (без нарушения LSP) ослабления предварительного условия, в методе doStuff,
 *  в классе Car: 0 < num <= 5, в расширяющем классе ToyCar метод принимает: 0 < num <= 10
 *  Все значения num, которые действительны для ToyCar.doStuff, действительны и для Car.doStuff
 *
 *  Если рассматривать пример 2 с нарушением, то нужно усилить предварительное условие в классе ToyCar: 0 < num <= 3,
 *  Тогда не все значения num, которые действительны для ToyCar.doStuff, будут действительны и для Car.doStuff
 *  */
public class ToyCar extends Car {

    public ToyCar(int mileage) {
        super(mileage);
    }

    public void reset() {
        mileage = 0;
    }

    @Override
    /* precondition: 0 < num <= 10 */
    public void doStuff(int num) {
        if (num <= 0 || num > 10) {
            throw new IllegalArgumentException("Input out of range 1-10");
        }
        /* some logic here... */
    }

    /* Other properties and methods */
}