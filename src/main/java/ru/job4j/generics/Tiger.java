package ru.job4j.generics;

public class Tiger extends Predator {
    public Tiger() {
        name = "Tiger";
    }

    @Override
    public String toString() {
        return "Tiger{"
                + "name='" + name + '\''
                + '}';
    }
}
