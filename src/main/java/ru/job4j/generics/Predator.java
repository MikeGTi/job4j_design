package ru.job4j.generics;

public class Predator extends Animal {
    public Predator() {
        name = "Predator";
    }

    @Override
    public String toString() {
        return "Predator{"
                + "name='" + name + '\''
                + '}';
    }
}
