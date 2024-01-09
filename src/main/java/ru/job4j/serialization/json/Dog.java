package ru.job4j.serialization.json;

import java.util.Arrays;

public class Dog {
    private final boolean gender;
    private final byte age;
    private final String name;
    private final String[] foodTypes;
    private final Contact owner;

    public Dog(boolean gender, byte age, String name, String[] foodTypes, Contact owner) {
        this.gender = gender;
        this.age = age;
        this.name = name;
        this.foodTypes = foodTypes;
        this.owner = owner;
    }

    @Override
    public String toString() {
        return "Dog{"
                + "gender=" + gender
                + ", age=" + age
                + ", name='" + name + '\''
                + ", foodTypes=" + Arrays.toString(foodTypes)
                + ", owner=" + owner
                + '}';
    }
}
