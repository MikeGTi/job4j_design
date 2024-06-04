package ru.job4j.ood.lsp.parking;

import java.util.Objects;

public class Truck implements IVehicle {
    private final Long id;

    private final byte size;

    private final String name;

    public Truck(Long id, byte size, String name) {
        this.id = id;
        this.size = size;
        this.name = name;
    }

    @Override
    public byte getSize() {
        return this.size;
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
        return Objects.isNull(this.id) && this.size == 0 && "".equals(this.name);
    }
}
