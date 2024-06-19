package ru.job4j.ood.lsp.parking;

import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ControlParkingTest {

        /* Successfully park a vehicle in an available parking lot */
        @Test
        public void whenParkVehicleThenOk() throws ParkingException {
            IVehicle vehicle = new IVehicle() {
                public byte getSize() { 
                    return 1; 
                }
                public Long getId() { 
                    return 1L; 
                }
                public String getName() { 
                    return "Car"; 
                }
                public boolean isEmpty() { 
                    return false; 
                }
            };

            IParking<IVehicle> parkingLot = new IParking<>() {
                public boolean park(IVehicle v) { 
                    return true; 
                }
                public boolean parkAll(List<IVehicle> vs) { 
                    return false; 
                }
                public IVehicle leave(Long id) { 
                    return null; }
                public boolean hasPlace(int size) { 
                    return true; 
                }
            };

            ControlParking controlParking = new ControlParking(List.of(parkingLot));
            assertTrue(controlParking.park(vehicle));
        }

        /*  Attempt to park a vehicle when all parking lots are full */
        @Test
        public void whenParkVehicleInFullParkingThanParkingException() {
            IVehicle vehicle = new IVehicle() {
                public byte getSize() {
                    return 1;
                }
                public Long getId() {
                    return 2L;
                }
                public String getName() {
                    return "Truck";
                }
                public boolean isEmpty() {
                    return false;
                }
            };
            IParking<IVehicle> fullParkingLot = new IParking<>() {
                public boolean park(IVehicle v) throws ParkingException {
                    throw new ParkingException("Full");
                }
                public boolean parkAll(List<IVehicle> vs) throws ParkingException {
                    return false;
                }
                public IVehicle leave(Long id) throws ParkingException {
                    return null;
                }
                public boolean hasPlace(int size) {
                    return false;
                }
            };
            ControlParking controlParking = new ControlParking(List.of(fullParkingLot));
            assertThrows(ParkingException.class, () -> controlParking.park(vehicle));
        }

        /* Attempt to leave a vehicle that is not parked in any lot */
        @Test
        public void whenLeaveVehicleNotParkedThanParkingException() {
            IParking<IVehicle> parkingLot = new IParking<>() {
                public boolean park(IVehicle v) {
                    return false;
                }
                public boolean parkAll(List<IVehicle> vs) {
                    return false;
                }
                public IVehicle leave(Long id) throws ParkingException {
                    throw new ParkingException(String.format("Vehicle with id: %s, not found", id));
                }
                public boolean hasPlace(int size) {
                    return false;
                }
            };

            ControlParking controlParking = new ControlParking(List.of(parkingLot));
            assertThrows(ParkingException.class, () -> controlParking.leave(3L));
        }
}