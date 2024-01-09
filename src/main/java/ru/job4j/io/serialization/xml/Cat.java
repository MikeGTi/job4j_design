package ru.job4j.io.serialization.xml;

import ru.job4j.io.serialization.json.ContactJson;

import java.util.Arrays;

public class Cat {
    private final boolean gender;
    private final byte age;
    private final String name;
    private final String[] foodTypes;
    private final ContactJson owner;

    public Cat(boolean gender, byte age, String name, String[] foodTypes, ContactJson owner) {
        this.gender = gender;
        this.age = age;
        this.name = name;
        this.foodTypes = foodTypes;
        this.owner = owner;
    }

    @Override
    public String toString() {
        return "Cat{"
                + "gender=" + gender
                + ", age=" + age
                + ", name='" + name + '\''
                + ", foodTypes=" + Arrays.toString(foodTypes)
                + ", owner=" + owner
                + '}';
    }
}
