package ru.job4j.ood.lsp.store;

import java.util.Date;
import java.util.function.Predicate;

public class DiscountRule {
    private final String name;
    private final Predicate<Food> predicate;
    private final byte discount;

    private Date now = null;

    public DiscountRule(String name, Predicate<Food> predicate, byte discount) {
        this.name = name;
        this.predicate = predicate;
        this.discount = discount;
    }

    public DiscountRule(String name, Predicate<Food> predicate, byte discount, Date nowOnlyForTest) {
        this.name = name;
        this.predicate = predicate;
        this.discount = discount;
        this.now = nowOnlyForTest;
    }

    public boolean apply(Food food) {
        boolean rsl = predicate.test(food);
        if (rsl) {
            food.setDiscount(this.discount);
        }
        return rsl;
    }

    public byte getDiscount() {
        return this.discount;
    }


}
