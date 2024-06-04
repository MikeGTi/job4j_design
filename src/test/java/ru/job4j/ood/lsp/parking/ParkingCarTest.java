package ru.job4j.ood.lsp.parking;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ParkingCarTest {

    @Test
    void whenAddCarAndLeaveThanEqualsCars() throws Exception {
        Car car1 = new Car(1L, "Lada 4x4");
        Car car2 = new Car(2L, "UAZ Hunter");
        Car car3 = new Car(3L, "Lada Kalina");

        ParkingCar parkingCar = new ParkingCar(10);
        parkingCar.park(car1);
        parkingCar.park(car2);
        parkingCar.park(car3);

        assertEquals(car1, parkingCar.leave(1L));
        assertEquals(car2, parkingCar.leave(2L));
        assertEquals(car3, parkingCar.leave(3L));
    }

    @Test
    void whenAddCarsAboveCapacityThanThrowException() throws Exception {
        Car car1 = new Car(1L, "Lada 4x4");
        Car car2 = new Car(2L, "UAZ Hunter");
        Car car3 = new Car(3L, "Lada Kalina");

        ParkingCar parkingCar = new ParkingCar(2);
        parkingCar.park(car1);
        parkingCar.park(car2);

        assertThrows(Exception.class, () -> parkingCar.park(car3));
    }

    @Test
    void whenAddTruckThanAdded() throws Exception {
        Truck truck1 = new Truck(4L, (byte) 4, "KAMAZ 4401");
        ParkingCar parkingCar = new ParkingCar(10);
        assertTrue(parkingCar.park(truck1));
    }

    @Test
    void whenAddTruckAndLeaveThanOk() throws Exception {
        Truck truck1 = new Truck(4L, (byte) 4, "KAMAZ 4401");
        Truck truck2 = new Truck(5L, (byte) 4, "MAZ 1643");
        ParkingCar parkingCar = new ParkingCar(10);
        assertTrue(parkingCar.park(truck1));
        assertTrue(parkingCar.park(truck2));
        assertEquals(truck1, parkingCar.leave(4L));
        assertEquals(truck2, parkingCar.leave(5L));
    }

    @Test
    void whenAddCarsTrucksAboveCapacityThanThrowException() throws Exception {
        Car car1 = new Car(1L, "Lada 4x4");
        Car car2 = new Car(2L, "UAZ Hunter");
        Car car3 = new Car(3L, "Lada Kalina");

        ParkingCar parkingCar = new ParkingCar(12);
        parkingCar.park(car1);
        parkingCar.park(car2);
        parkingCar.park(car3);

        Truck truck1 = new Truck(4L, (byte) 4, "KAMAZ 4401");
        Truck truck2 = new Truck(5L, (byte) 4, "MAZ 1643");
        Truck truck3 = new Truck(6L, (byte) 2, "KAMAZ 4403");

        parkingCar.park(truck1);
        parkingCar.park(truck2);
        assertThrows(Exception.class, () -> parkingCar.park(truck3));
    }

    @Test
    void whenAddCarAndGetAnotherThanThrowException() throws Exception {
        Car car1 = new Car(1L, "Lada 4x4");

        ParkingCar parkingCar = new ParkingCar(6);
        parkingCar.park(car1);

        assertThrows(Exception.class, () -> parkingCar.leave(2L));
    }

    @Test
    void whenAddTruckAndGetAnotherThanThrowException() throws Exception {
        ParkingCar parkingCar = new ParkingCar(6);
        Truck truck1 = new Truck(4L, (byte) 4, "KAMAZ 4401");
        parkingCar.park(truck1);
        assertThrows(Exception.class, () -> parkingCar.leave(3L));
    }

    @Test
    void whenAddLeaveCarAddTruckThanThrowException1() throws Exception {
        ParkingCar parkingCar = new ParkingCar(3);

        Car car1 = new Car(1L, "Lada 4x4");
        parkingCar.park(car1);
        assertEquals(car1, parkingCar.leave(1L));

        Truck truck1 = new Truck(4L, (byte) 4, "KAMAZ 4401");
        assertThrows(Exception.class, () -> parkingCar.park(truck1));
    }

    @Test
    void whenAddTwoTrucksAboveCapacityThanThrowException() throws Exception {
        ParkingCar parkingCar = new ParkingCar(6);

        Truck truck1 = new Truck(4L, (byte) 4, "KAMAZ 4401");
        Truck truck2 = new Truck(5L, (byte) 4, "MAZ 1643");

        parkingCar.park(truck1);
        assertThrows(Exception.class, () -> parkingCar.park(truck2));
    }
}