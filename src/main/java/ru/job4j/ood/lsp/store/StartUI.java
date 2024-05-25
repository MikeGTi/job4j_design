package ru.job4j.ood.lsp.store;

import java.util.Date;
import java.util.List;

public class StartUI {
    public static void main(String[] args) throws Exception {
        List<Store<Food>> stores = List.of(new Warehouse(),
                                           new Shop(),
                                           new Trash());
        List<Food> items = getListOfFoods();
        ControlQuality controlQuality = new ControlQuality(stores);
        List<DiscountRule> discountRules = List.of(new DiscountRule("expiredFoodDiscount20p", f -> f.expirePercent(new Date()) > 75, (byte) 20));

        ControlDiscount controlDiscount = new ControlDiscount(stores,
                                                              discountRules);
        controlDiscount.setDiscountAll();
        controlQuality.distributeAll(items);
    }

    public static List<Food> getListOfFoods() {
        return List.of(new Food(1L, "Meat", new Date(2023, 10, 20), new Date(2024, 10, 20), 12.75D),
                       new Food(2L, "Bread", new Date(2024, 10, 20), new Date(2024, 10, 21), 2.1D),
                       new Food(3L, "Milk", new Date(2024, 10, 20), new Date(2024, 10, 30), 3.2D),
                       new Food(4L, "Banana", new Date(2024, 9, 20), new Date(2024, 10, 15), 1.5D));
    }

}
