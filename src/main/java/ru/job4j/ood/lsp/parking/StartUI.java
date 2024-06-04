package ru.job4j.ood.lsp.parking;

import java.util.List;

public class StartUI {
    public static void main(String[] args) throws ParkingException {
        /* !Needs truck parking first in List */
        List<IParking<IVehicle>> parkingLots = List.of(new ParkingTruck(4),
                                                       new ParkingCar(10));
        List<IVehicle> vehicles = getListOfVehicles();
        ControlParking controlParking = new ControlParking(parkingLots);

        controlParking.parkAll(vehicles);
        IVehicle v = controlParking.leave(1L);
        System.out.println(v.getId());
    }

    public static List<IVehicle> getListOfVehicles() {
        return List.of(new Truck(9L, (byte) 4, "KAMAZ 4401"),
                        new Truck(10L, (byte) 2, "MAZ 1643"),
                        new Truck(11L, (byte) 4, "KAMAZ 4403"),
                        new Truck(12L, (byte) 2, "MAZ 1843"),
                        new Truck(14L, (byte) 2, "ZIL 131"),
                        new Car(1L, "Lada 4x4"),
                        new Car(2L, "UAZ Hunter"),
                        new Car(3L, "Lada Kalina"),
                        new Car(4L, "Uaz Patriot"),
                        new Car(5L, "Zaz 965"),
                        new Car(6L, "Porsche 911"),
                        new Car(7L, "Lotus Elan"),
                        new Car(8L, "Vaz 2108"));
    }
}
