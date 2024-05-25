package ru.job4j.ood.lsp.store;

import org.junit.jupiter.api.Test;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import static org.junit.jupiter.api.Assertions.assertEquals;

class FoodTest {
    @Test
    void whenCreateExpiryCurDateNowThanExpiredPercent0() {
        Date now = new GregorianCalendar().getTime();
        Food food = new Food(1L, "Bread", now, now, 10D);
        assertEquals(0, food.expirePercent(now));
    }

    @Test
    void whenCreateDate2000ExpiryDate2100curDate2050ThanExpiredPercent50() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2050, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);
        assertEquals(50, food.expirePercent(now));
    }

    @Test
    void whenCreateDate2000ExpiryDate2100curDate2025thanExpiredPercent25() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2025, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);
        assertEquals(25, food.expirePercent(now));
    }

    @Test
    void whenCreateDate2000ExpiryDate2100curDate2075thanExpiredPercent75() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2075, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);
        assertEquals(75, food.expirePercent(now));
    }

    @Test
    void whenCreateDate2000ExpiryDate2100curDate2099thanExpiredPercent99() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2099, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);
        assertEquals(99, food.expirePercent(now));
    }

    @Test
    void whenCreateDate2000ExpiryDate2100curDate2100thanExpiredPercent100() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);
        assertEquals(100, food.expirePercent(now));
    }

    @Test
    void whenCreateDate2000ExpiryDate2100curDate2150thanExpiredPercent100() {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2150, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Food food = new Food(1L, "Bread", last, future, 10D);
        assertEquals(100, food.expirePercent(now));
    }
}