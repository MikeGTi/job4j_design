package ru.job4j.generic;

public abstract class Base {

    private String id;

    public Base(final String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}