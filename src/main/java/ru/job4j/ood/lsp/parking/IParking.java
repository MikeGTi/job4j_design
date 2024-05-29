package ru.job4j.ood.lsp.parking;


import java.util.NoSuchElementException;

public interface IParking<Vehicle> {

    boolean park(Vehicle v);


    Vehicle pick(Long id) throws NoSuchElementException;

}