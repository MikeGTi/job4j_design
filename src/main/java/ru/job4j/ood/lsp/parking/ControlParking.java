package ru.job4j.ood.lsp.parking;

import java.util.List;

public class ControlParking {

    private final List<IParking<IVehicle>> parkingLots;

    /* !Needs truck parking first in List */
    public ControlParking(List<IParking<IVehicle>> parkingLots) {
        this.parkingLots = parkingLots;
    }

    public boolean park(IVehicle vehicle) throws ParkingException {
        boolean parked = false;
        for (int i = 0; i < parkingLots.size(); i++) {
            parked = parkingLots.get(i).park(vehicle);
            if (parked) {
                break;
            } else {
                if (i == parkingLots.size() - 1) {
                    throw new ParkingException("Error vehicle not parked: " + vehicle.getId());
                }
            }
        }
        return parked;
    }

    public IVehicle leave(Long id) throws ParkingException {
        IParking<IVehicle> parking;
        IVehicle v = null;
        for (int i = 0; i < parkingLots.size(); i++) {
            parking = parkingLots.get(i);
            try {
                v = parking.leave(id);
            } catch (ParkingException pe) {
                pe.printStackTrace();
            }
            if (v == null && i == parkingLots.size() - 1) {
                throw new ParkingException(String.format("Vehicle with id: %s, not found", id));
            }
        }
        return v;
    }

    public void parkAll(List<IVehicle> vehicles) throws ParkingException {
        for (IVehicle vehicle : vehicles) {
            this.park(vehicle);
        }
    }

    /*public List<IVehicle> leaveAll() throws Exception {
        List<IVehicle> vehicles = new ArrayList<>();
        for (IParking<IVehicle> parking : parkingLots) {
            vehicles.add(parking.leave(1L));
        }
        return vehicles;
    }*/

}
