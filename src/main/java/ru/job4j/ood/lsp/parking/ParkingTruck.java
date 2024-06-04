package ru.job4j.ood.lsp.parking;

import java.util.ArrayList;
import java.util.List;

/* Truck takes one place despite the size value */
public class ParkingTruck extends AbstractParking {

    public ParkingTruck(int capacity) {
        super(capacity);
    }

    @Override
    public boolean park(IVehicle v) throws ParkingException {
        if (v != null && v.getSize() < 2) {
            throw new ParkingException("Error parking only vehicles with size more than one");
        }
        return super.park(v);
    }

    @Override
    public IVehicle leave(Long id) throws ParkingException {
        return super.leave(id);
    }

    @Override
    public List<IVehicle> leaveAll(List<Long> ids) throws ParkingException {
        List<IVehicle> rsl = new ArrayList<>(ids.size());
        for (Long id : ids) {
            rsl.add(this.leave(id));
        }
        return rsl;
    }

    @Override
    public boolean hasPlace(int size) {
        return super.hasPlace(1);
    }
}
