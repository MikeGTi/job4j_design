package ru.job4j.ood.lsp.parking;

import java.util.Objects;

public class Car implements IVehicle {
    private final Long id;

    private final String name;

    public Car(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public byte getSize() {
        return (byte) 1;
    }

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public boolean isEmpty() {
        return Objects.isNull(this.id) && "".equals(this.name);
    }
}
