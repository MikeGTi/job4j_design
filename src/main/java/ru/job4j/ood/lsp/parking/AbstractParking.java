package ru.job4j.ood.lsp.parking;

import java.util.*;

public abstract class AbstractParking implements IParking<IVehicle> {
    private IVehicle[] vehicles;
    private int occupied = 0;
    private int index = 0;

    public AbstractParking(int capacity) {
        this.vehicles = new IVehicle[capacity];
    }

    /*  Vehicle takes one place despite the size value */
    @Override
    public boolean park(IVehicle v) throws ParkingException {
        if (!hasPlace(1)) {
            throw new ParkingException("Overflow parking, not enough space");
        }
        this.occupied++;
        this.vehicles[index++] = v;
        return true;
    }

    @Override
    public boolean parkAll(List<IVehicle> vs) throws ParkingException {
        if (!hasPlace(vs.size())) {
            throw new ParkingException("Overflow parking, not enough space");
        }
        for (IVehicle v : vs) {
            this.occupied++;
            this.vehicles[index++] = v;
        }
        return true;
    }

    @Override
    public IVehicle leave(Long id) throws ParkingException {
        IVehicle rsl = null;
        for (int i = 0; i < vehicles.length; i++) {
            IVehicle v = vehicles[i];
            if (v != null && id.equals(v.getId())) {
                rsl = v;
                this.occupied--;
                this.index = i;
                break;
            }
        }
        if (rsl == null) {
            throw new ParkingException(String.format("Vehicle with id: %s, not found", id));
        }
        return rsl;
    }

    public List<IVehicle> leaveAll(List<Long> ids) throws ParkingException {
        List<IVehicle> vs = new ArrayList<>(ids.size());
        for (Long id : ids) {
            for (int i = 0; i < vehicles.length; i++) {
                IVehicle v = vehicles[i];
                if (v != null && id.equals(v.getId())) {
                    vs.add(v);
                    this.occupied--;
                    this.index = i;
                    break;
                }
            }
        }
        return vs;
    }

    @Override
    public boolean hasPlace(int size) {
        /* has free places on parking, and has place for vehicle size (defragmentation issue) */
        boolean rsl = (size <= (vehicles.length - this.occupied));
        if (rsl) {
            rsl = false;
            this.index = vehicles.length;
            for (int i = 0; i < vehicles.length; i++) {
                if (check(i, i + size - 1)) {
                    this.index = i;
                    rsl = true;
                    break;
                }
            }
        }
        return rsl;
    }

    private boolean check(int start, int end) {
        boolean checked = start >= 0
                       && start < vehicles.length
                       && end >= 0
                       && end < vehicles.length;
        if (checked) {
            for (int i = start; i < end + 1; i++) {
                if (vehicles[i] != null) {
                    checked = false;
                    break;
                }
            }
        }
        return checked;
    }

}