package ru.job4j.ood.lsp.parking;


import java.util.ArrayList;
import java.util.List;

public class ParkingCar extends AbstractParking {

    public ParkingCar(int capacity) {
        super(capacity);
    }

    @Override
    public boolean park(IVehicle v) {
        byte size = v.getSize();
        boolean rsl;
        if (size == 1) {
            rsl = super.park(v);
        } else {
            if (hasPlace(size)) {
                List<IVehicle> vs = createListVehicles(v, size);
                rsl = super.parkAll(vs);
            } else {
                return false;
            }
        }
        return rsl;
    }

    private List<IVehicle> createListVehicles(IVehicle vehicle, int amount) {
        ArrayList<IVehicle> vehicles = new ArrayList<>(amount);
        for (int i = 0; i < amount; i++) {
            vehicles.add(vehicle);
        }
        return vehicles;
    }

    private List<Long> createListVehiclesIds(Long vehicleId, int amount) {
        ArrayList<Long> vehiclesId = new ArrayList<>(amount);
        for (int i = 0; i < amount; i++) {
            vehiclesId.add(vehicleId);
        }
        return vehiclesId;
    }

    @Override
    public IVehicle leave(Long id) throws ParkingException {
        IVehicle v = super.leave(id);
        if (v != null) {
            int size = v.getSize();
            if (size > 1) {
                super.leaveAll(createListVehiclesIds(v.getId(), size - 1));
            }
        } else {
            throw new ParkingException(String.format("Vehicle with id: %s, not found", id));
        }
        return v;
    }

    @Override
    public boolean hasPlace(int size) {
        return super.hasPlace(size);
    }
}
