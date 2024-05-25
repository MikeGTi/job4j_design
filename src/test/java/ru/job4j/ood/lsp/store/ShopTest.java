package ru.job4j.ood.lsp.store;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

class ShopTest {
    @Test
    void whenAdd3foodsThanSize3() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2050, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        Food food1 = new Food(1L, "Bread", last, future, 10D);
        Food food2 = new Food(2L, "Meat", last, future, 5D);
        Food food3 = new Food(3L, "Milk", last, future, 2.5D);

        Shop shop = new Shop(now);
        shop.add(food1);
        shop.add(food2);
        shop.add(food3);

        Assertions.assertEquals(3, shop.getAll().size());
    }

    @Test
    void whenAdd3foodsAndGetByIdThanGot() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2050, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        Food food1 = new Food(1L, "Bread", last, future, 10D);
        Food food2 = new Food(2L, "Meat", last, future, 5D);
        Food food3 = new Food(3L, "Milk", last, future, 2.5D);

        Shop shop = new Shop(now);
        shop.add(food1);
        shop.add(food2);
        shop.add(food3);

        Assertions.assertEquals(food1, shop.getById(1L).get());
        Assertions.assertEquals(food2, shop.getById(2L).get());
        Assertions.assertEquals(food3, shop.getById(3L).get());
    }

    @Test
    void whenExpiredPercent0thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Shop shop = new Shop(now);
        boolean rsl = shop.add(food);

        Assertions.assertFalse(rsl);
        Assertions.assertEquals(0, shop.getAll().size());
    }

    @Test
    void whenExpiredPercent24thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2024, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Shop shop = new Shop(now);
        boolean rsl = shop.add(food);

        Assertions.assertFalse(rsl);
        Assertions.assertEquals(0, shop.getAll().size());
    }

    @Test
    void whenExpiredPercent25thanFoodAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2025, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Shop shop = new Shop(now);
        boolean rsl = shop.add(food);

        Assertions.assertTrue(rsl);
        Assertions.assertEquals(1, shop.getAll().size());
    }

    @Test
    void whenExpiredPercent74thanFoodAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2074, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Shop shop = new Shop(now);
        boolean rsl = shop.add(food);

        Assertions.assertTrue(rsl);
        Assertions.assertEquals(1, shop.getAll().size());
    }

    @Test
    void whenExpiredPercent75thanFoodAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2075, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Shop shop = new Shop(now);
        boolean rsl = shop.add(food);

        Assertions.assertTrue(rsl);
        Assertions.assertEquals(1, shop.getAll().size());
    }

    @Test
    void whenExpiredPercent76thanFoodAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2076, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Shop shop = new Shop(now);
        boolean rsl = shop.add(food);

        Assertions.assertTrue(rsl);
        Assertions.assertEquals(1, shop.getAll().size());
    }

    @Test
    void whenExpiredPercent99thanFoodAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2099, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Shop shop = new Shop(now);
        boolean rsl = shop.add(food);

        Assertions.assertTrue(rsl);
        Assertions.assertEquals(1, shop.getAll().size());
    }

    @Test
    void whenExpiredPercent100thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2110, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Shop shop = new Shop(now);
        boolean rsl = shop.add(food);

        Assertions.assertFalse(rsl);
        Assertions.assertEquals(0, shop.getAll().size());
    }

    @Test
    void whenExpiredPercent150thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2150, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Shop shop = new Shop(now);
        boolean rsl = shop.add(food);

        Assertions.assertFalse(rsl);
        Assertions.assertEquals(0, shop.getAll().size());
    }

}