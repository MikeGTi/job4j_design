package ru.job4j.ood.lsp.store;

import java.util.List;
import java.util.Optional;


/*
 * Распределяет продукты/вещи по хранилищам
 */
public class ControlQuality {
    private final List<Store<Food>> stores;

    protected ControlQuality(List<Store<Food>> stores) {
        this.stores = stores;
    }

    public void distributeAll(List<Food> foods) throws Exception {
        for (Food food : foods) {
            if (!distribute(food)) {
                throw new Exception("Error item not distributed: " + food.getName());
            }
        }
    }

    private boolean distribute(Food food) {
        boolean distributed = false;
        for (Store<Food> store : stores) {
            if (store.add(food)) {
                distributed = true;
                break;
            }
        }
        return distributed;
    }

    public Optional<Food> getById(Long id) {
        Optional<Food> rsl = Optional.empty();
        for (Store<Food> store : stores) {
            rsl = store.getById(id);
            if (rsl.isPresent()) {
                break;
            }
        }
        return rsl;
    }
}
