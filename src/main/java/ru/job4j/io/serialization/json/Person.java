package ru.job4j.io.serialization.json;

import java.util.Arrays;

public class Person {
    private final boolean sex;
    private final int age;
    private final ContactJson contactJSON;
    private final String[] statuses;

    public Person(boolean sex, int age, ContactJson contactJSON, String[] statuses) {
        this.sex = sex;
        this.age = age;
        this.contactJSON = contactJSON;
        this.statuses = statuses;
    }

    @Override
    public String toString() {
        return "Person{"
                + "sex=" + sex
                + ", age=" + age
                + ", contactJSON=" + contactJSON
                + ", statuses=" + Arrays.toString(statuses)
                + '}';
    }
}