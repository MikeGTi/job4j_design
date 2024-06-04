package ru.job4j.ood.lsp.store;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

class ControlQualityTest {
    private IStore<Food> warehouse;
    private IStore<Food> shop;
    private IStore<Food> trash;

    List<Food> foods;

    private ControlQuality controlQuality;

    @Test
    void whenExpiredPercent0thanAddToWarehouseOnly() throws Exception {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        warehouse = new Warehouse(now);
        shop = new Shop(now);
        trash = new Trash(now);

        foods = List.of(new Food(1L, "Bread", last, future, 1.5D));

        controlQuality = new ControlQuality(List.of(warehouse, shop, trash));
        controlQuality.distributeAll(foods);

        Assertions.assertEquals(1, warehouse.getAll().size());
        Assertions.assertEquals(0, shop.getAll().size());
        Assertions.assertEquals(0, trash.getAll().size());
    }

    @Test
    void whenExpiredPercent25thanAddToShopOnly() throws Exception {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2025, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        warehouse = new Warehouse(now);
        shop = new Shop(now);
        trash = new Trash(now);

        foods = List.of(new Food(1L, "Bread", last, future, 1.5D));

        controlQuality = new ControlQuality(List.of(warehouse, shop, trash));
        controlQuality.distributeAll(foods);

        Assertions.assertEquals(0, warehouse.getAll().size());
        Assertions.assertEquals(1, shop.getAll().size());
        Assertions.assertEquals(0, trash.getAll().size());
    }

    @Test
    void whenExpiredPercent100thanAddToTrashOnly() throws Exception {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        warehouse = new Warehouse(now);
        shop = new Shop(now);
        trash = new Trash(now);

        foods = List.of(new Food(1L, "Bread", last, future, 1.5D));

        controlQuality = new ControlQuality(List.of(warehouse, shop, trash));
        controlQuality.distributeAll(foods);

        Assertions.assertEquals(0, warehouse.getAll().size());
        Assertions.assertEquals(0, shop.getAll().size());
        Assertions.assertEquals(1, trash.getAll().size());
    }
}