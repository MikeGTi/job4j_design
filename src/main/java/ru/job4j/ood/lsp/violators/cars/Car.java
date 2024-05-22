package ru.job4j.ood.lsp.violators.cars;

public abstract class Car {

    /* Allowed to be set once at the time of creation.
    * Value can only increment thereafter.
    * Value cannot be reset.
     */
    protected int mileage;

    public Car(int mileage) {
        this.mileage = mileage;
    }

    /* precondition: 0 < num <= 5 */
    public void doStuff(int num) {
        if (num <= 0 || num > 5) {
            throw new IllegalArgumentException("Input out of range 1-5");
        }
        /* some logic here... */
    }

    /* Other properties and methods... */

}
