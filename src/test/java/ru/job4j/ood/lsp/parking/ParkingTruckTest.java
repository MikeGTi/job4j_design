package ru.job4j.ood.lsp.parking;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class ParkingTruckTest {

    @Test
    void whenAddTruckAndLeaveThanEquals() throws Exception {
        Truck truck1 = new Truck(1L, (byte) 4, "KAMAZ 4401");
        Truck truck2 = new Truck(2L, (byte) 2, "MAZ 1643");
        Truck truck3 = new Truck(3L, (byte) 4, "KAMAZ 4403");

        ParkingTruck parkingTruck = new ParkingTruck(10);
        parkingTruck.park(truck1);
        parkingTruck.park(truck2);
        parkingTruck.park(truck3);

        assertEquals(truck1, parkingTruck.leave(1L));
        assertEquals(truck2, parkingTruck.leave(2L));
        assertEquals(truck3, parkingTruck.leave(3L));
    }

    @Test
    void whenExceedCapacityThanThrowException() throws Exception {
        Truck truck1 = new Truck(1L, (byte) 4, "KAMAZ 4401");
        Truck truck2 = new Truck(2L, (byte) 2, "MAZ 1643");
        Truck truck3 = new Truck(3L, (byte) 4, "KAMAZ 4403");

        ParkingTruck parkingTruck = new ParkingTruck(2);
        parkingTruck.park(truck1);
        parkingTruck.park(truck2);

        assertThrows(ParkingException.class, () -> parkingTruck.park(truck3));
    }

    @Test
    void whenGetNotParkedTruckThanThrowException() throws Exception {
        Truck truck1 = new Truck(1L, (byte) 4, "KAMAZ 4401");
        ParkingTruck parkingTruck = new ParkingTruck(2);
        parkingTruck.park(truck1);
        assertThrows(Exception.class, () -> parkingTruck.leave(2L));
    }

    @Test
    void whenAddCarThanThrowException() {
        Car car1 = new Car(1L, "Lada 4x4");
        ParkingTruck parkingTruck = new ParkingTruck(10);
        assertThrows(ParkingException.class, () -> parkingTruck.park(car1));
    }
}