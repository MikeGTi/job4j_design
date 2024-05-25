package ru.job4j.ood.lsp.store;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

class TrashTest {

    @Test
    void whenAdd3foodsThanSize3() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        Food food1 = new Food(1L, "Bread", last, future, 10D);
        Food food2 = new Food(2L, "Meat", last, future, 5D);
        Food food3 = new Food(3L, "Milk", last, future, 2.5D);

        Trash trash = new Trash(now);
        trash.add(food1);
        trash.add(food2);
        trash.add(food3);

        Assertions.assertEquals(3, trash.getAll().size());
    }

    @Test
    void whenAdd3foodsAndGetByIdThanGot() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        Food food1 = new Food(1L, "Bread", last, future, 10D);
        Food food2 = new Food(2L, "Meat", last, future, 5D);
        Food food3 = new Food(3L, "Milk", last, future, 2.5D);

        Trash trash = new Trash(now);
        trash.add(food1);
        trash.add(food2);
        trash.add(food3);

        Assertions.assertEquals(food1, trash.getById(1L).get());
        Assertions.assertEquals(food2, trash.getById(2L).get());
        Assertions.assertEquals(food3, trash.getById(3L).get());
    }

    @Test
    void whenExpiredPercent0thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Trash trash = new Trash(now);
        trash.add(food);

        Assertions.assertEquals(0, trash.getAll().size());
    }

    @Test
    void whenExpiredPercent24thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2024, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Trash trash = new Trash(now);
        trash.add(food);

        Assertions.assertEquals(0, trash.getAll().size());
    }

    @Test
    void whenExpiredPercent25thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2025, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Trash trash = new Trash(now);
        trash.add(food);

        Assertions.assertEquals(0, trash.getAll().size());
    }

    @Test
    void whenExpiredPercent74thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2074, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Trash trash = new Trash(now);
        trash.add(food);

        Assertions.assertEquals(0, trash.getAll().size());
    }

    @Test
    void whenExpiredPercent75thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2075, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Trash trash = new Trash(now);
        trash.add(food);

        Assertions.assertEquals(0, trash.getAll().size());
    }

    @Test
    void whenExpiredPercent76thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2076, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Trash trash = new Trash(now);
        trash.add(food);

        Assertions.assertEquals(0, trash.getAll().size());
    }

    @Test
    void whenExpiredPercent99thanFoodNotAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2099, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Trash trash = new Trash(now);
        trash.add(food);

        Assertions.assertEquals(0, trash.getAll().size());
    }

    @Test
    void whenExpiredPercent100thanFoodAdded() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);

        Trash trash = new Trash(now);
        trash.add(food);

        Assertions.assertEquals(1, trash.getAll().size());
    }
}