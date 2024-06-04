package ru.job4j.ood.lsp.parking;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

class TruckTest {

    @Test
    void whenNewTruckWithSize2ThanSize2() {
        Truck truck = new Truck(1L, (byte) 2, "MAZ 1643");
        assertEquals(2, truck.getSize());
    }

    @Test
    void whenNewTruckWithId1ThanId1() {
        Truck truck = new Truck(1L, (byte) 2, "MAZ 1643");
        assertEquals(1L, truck.getId());
    }

    @Test
    void whenNewCarWithNameLadaThanNameLada() {
        Truck truck = new Truck(1L, (byte) 4, "Kamaz");
        assertEquals("Kamaz", truck.getName());
    }
}