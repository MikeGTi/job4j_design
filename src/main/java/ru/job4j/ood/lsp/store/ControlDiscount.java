package ru.job4j.ood.lsp.store;

import java.util.ArrayList;
import java.util.List;

/*
 * Устанавливает скидку на продукты/вещи,
 * выбирая максимальную
 */
public class ControlDiscount {

    private final List<Store<Food>> stores;

    private final List<DiscountRule> rules;

    public ControlDiscount(List<Store<Food>> stores, List<DiscountRule> rules) {
        this.stores = stores;
        this.rules = rules;
    }

    /*
     * apply first max discount
     */
    public void setDiscountAll() throws Exception {
        List<DiscountRule> sorted = new ArrayList<>(rules);
        sorted.sort(new RuleDiscountComparator().reversed());
        for (Store<Food> store : stores) {
            for (Food food : store.getAll()) {
                if (!setDiscount(food, sorted)) {
                    throw new Exception("Error item not set discount: " + food.getName());
                }
            }
        }
        sorted.clear();
    }

    private boolean setDiscount(Food food, List<DiscountRule> rules) {
        boolean applied = false;
        for (DiscountRule rule : rules) {
            if (rule.apply(food)) {
                applied = true;
                break;
            }
        }
        return applied;
    }
}
