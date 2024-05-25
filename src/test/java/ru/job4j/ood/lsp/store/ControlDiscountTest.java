package ru.job4j.ood.lsp.store;


import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

class ControlDiscountTest {

    private Store<Food> shop;
    private Store<Food> trash;
    ControlDiscount controlDiscount;

    @Test
    void whenExpiredPercent76ThanDiscount20() throws Exception {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2076, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        shop = new Shop(now);
        shop.add(new Food(1L, "Bread", last, future, 1.75D));
        shop.add(new Food(2L, "Meat", last, future, 10.5D));
        shop.add(new Food(3L, "Milk", last, future, 1.5D));

        List<Store<Food>> stores = List.of(shop);
        List<DiscountRule> discountRules = List.of(new DiscountRule("expiredFoodAbove75Discount20p", f -> f.expirePercent(now) > 75, (byte) 20),
                                                   new DiscountRule("expiredFood100discount100p", f -> f.expirePercent(now) == 100, (byte) 100));
        controlDiscount = new ControlDiscount(stores, discountRules);
        controlDiscount.setDiscountAll();

        Food food1 = shop.getById(1L).get();
        Food food2 = shop.getById(2L).get();
        Food food3 = shop.getById(3L).get();

        Assertions.assertEquals(76, food1.expirePercent(now));
        Assertions.assertEquals(76, food2.expirePercent(now));
        Assertions.assertEquals(76, food3.expirePercent(now));

        Assertions.assertEquals(20, food1.getDiscount());
        Assertions.assertEquals(20, food2.getDiscount());
        Assertions.assertEquals(20, food3.getDiscount());
    }

    @Test
    void whenExpiredPercent100ThanDiscount100() throws Exception {
        Date last = new GregorianCalendar(2000, Calendar.JANUARY, 1).getTime();
        Date now = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();
        Date future = new GregorianCalendar(2100, Calendar.JANUARY, 1).getTime();

        trash = new Trash(now);
        trash.add(new Food(1L, "Bread", last, future, 1.75D));
        trash.add(new Food(2L, "Meat", last, future, 10.5D));
        trash.add(new Food(3L, "Milk", last, future, 1.5D));
        List<Store<Food>> stores = List.of(trash);
        List<DiscountRule> discountRules = List.of(new DiscountRule("expiredFoodAbove75Discount20p", f -> f.expirePercent(now) > 75, (byte) 20),
                                                   new DiscountRule("expiredFood100discount100p", f -> f.expirePercent(now) == 100, (byte) 100));
        controlDiscount = new ControlDiscount(stores, discountRules);
        controlDiscount.setDiscountAll();

        Food food1 = trash.getById(1L).get();
        Food food2 = trash.getById(2L).get();
        Food food3 = trash.getById(3L).get();

        Assertions.assertEquals(100, food1.expirePercent(now));
        Assertions.assertEquals(100, food2.expirePercent(now));
        Assertions.assertEquals(100, food3.expirePercent(now));

        Assertions.assertEquals(100, food1.getDiscount());
        Assertions.assertEquals(100, food2.getDiscount());
        Assertions.assertEquals(100, food3.getDiscount());
    }
}
