package ru.job4j.bitstore;

public interface Store<B> {
    void put();

    B get();
}
