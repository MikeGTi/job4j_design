package ru.job4j.ood.lsp.parking;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

class CarTest {

    @Test
    void whenNewCarThanSize1() {
        Car car = new Car(1L, "Lada 4x4");
        assertEquals(1L, car.getSize());
    }

    @Test
    void whenNewCarWithId1ThanId1() {
        Car car = new Car(1L, "Lada 4x4");
        assertEquals(1L, car.getId());
    }

    @Test
    void whenNewCarWithNameLadaThanNameLada() {
        Car car = new Car(1L, "Lada");
        assertEquals("Lada", car.getName());
    }
}