package ru.job4j.io.serialization.json;

import java.util.Arrays;

public class Dog {
    private final boolean gender;
    private final byte age;
    private final String name;
    private final String[] foodTypes;
    private final ContactJson owner;

    public Dog(boolean gender, byte age, String name, String[] foodTypes, ContactJson owner) {
        this.gender = gender;
        this.age = age;
        this.name = name;
        this.foodTypes = foodTypes;
        this.owner = owner;
    }

    public boolean getGender() {
        return gender;
    }

    public byte getAge() {
        return age;
    }

    public String getName() {
        return name;
    }

    public String[] getFoodTypes() {
        return foodTypes;
    }

    public ContactJson getOwner() {
        return owner;
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
