package ru.job4j.ood.lsp.store;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;


class WarehouseTest {

    @Test
    void whenAdd3foodsThanSize3() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2024, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        Food food1 = new Food(1L, "Bread", last, future, 10D);
        Food food2 = new Food(2L, "Meat", last, future, 5D);
        Food food3 = new Food(3L, "Milk", last, future, 2.5D);

        Warehouse warehouse = new Warehouse(now);
        warehouse.add(food1);
        warehouse.add(food2);
        warehouse.add(food3);

        Assertions.assertEquals(3, warehouse.getAll().size());
    }

    @Test
    void whenAdd3foodsAndGetByIdThanGot() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2024, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        Food food1 = new Food(1L, "Bread", last, future, 10D);
        Food food2 = new Food(2L, "Meat", last, future, 5D);
        Food food3 = new Food(3L, "Milk", last, future, 2.5D);

        Warehouse warehouse = new Warehouse(now);
        warehouse.add(food1);
        warehouse.add(food2);
        warehouse.add(food3);

        Assertions.assertEquals(food1, warehouse.getById(1L).get());
        Assertions.assertEquals(food2, warehouse.getById(2L).get());
        Assertions.assertEquals(food3, warehouse.getById(3L).get());
    }

    @Test
    void whenExpiredPercent0thanFoodAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        Warehouse warehouse = new Warehouse(now);
        Food food = new Food(1L, "Bread", last, future, 10D);
        warehouse.add(food);

        Assertions.assertEquals(1, warehouse.getAll().size());
    }

    @Test
    void whenExpiredPercent24thanFoodAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2024, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Warehouse warehouse = new Warehouse(now);
        warehouse.add(food);

        Assertions.assertEquals(1, warehouse.getAll().size());
    }

    @Test
    void whenExpiredPercent25thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2025, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Warehouse warehouse = new Warehouse(now);
        warehouse.add(food);

        Assertions.assertEquals(0, warehouse.getAll().size());
    }

    @Test
    void whenExpiredPercent75thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2075, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Warehouse warehouse = new Warehouse(now);
        warehouse.add(food);

        Assertions.assertEquals(0, warehouse.getAll().size());
    }

    @Test
    void whenExpiredPercent100thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Warehouse warehouse = new Warehouse(now);
        warehouse.add(food);

        Assertions.assertEquals(0, warehouse.getAll().size());
    }

}