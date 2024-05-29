package ru.job4j.ood.lsp.parking;

import java.util.*;

public class AbstractParking implements IParking<Vehicle> {
    private Map<Long, Vehicle> vehicles;

    public AbstractParking(Integer numberParkingSpaces) {
        vehicles = new HashMap<>(numberParkingSpaces);
    }

    @Override
    public boolean park(Vehicle v) {
        return vehicles.put(v.getId(), v) == null;
    }

    @Override
    public Vehicle pick(Long id) throws NoSuchElementException {
        Vehicle rsl = vehicles.get(id);
        if (!(rsl == null)) {
            return rsl;
        }
        throw new NoSuchElementException();
    }
}