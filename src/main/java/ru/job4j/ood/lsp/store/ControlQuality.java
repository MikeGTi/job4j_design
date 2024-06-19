package ru.job4j.ood.lsp.store;

import java.util.*;


/*
 * Распределяет продукты/вещи по хранилищам
 */
public class ControlQuality {
    private final List<IStore<Food>> stores;

    protected ControlQuality(List<IStore<Food>> stores) {
        this.stores = stores;
    }

    public void resort() throws Exception {
        List<Food> foods = new ArrayList<>();
        for (IStore<Food> str : stores) {
            foods.addAll(str.getAll());
        }

        distributeAll(foods);
        foods.clear();
    }

    public void distributeAll(List<Food> foods) throws Exception {
        for (Food food : foods) {
            if (!distribute(food)) {
                throw new Exception("Error item not distributed: " + food.getName());
            }
        }
    }

    private boolean distribute(Food food) throws Exception {
        boolean distributed = false;
        int count = 0;
        for (IStore<Food> store : stores) {
            count++;
            distributed = store.add(food);
            if (distributed) {
                break;
            } else {
                if (stores.size() == count) {
                    throw new Exception("Error food not distributed: " + food.getId());
                }
            }
        }
        return distributed;
    }

    public Optional<Food> getById(Long id) {
        Optional<Food> rsl = Optional.empty();
        for (IStore<Food> store : stores) {
            rsl = store.getById(id);
            if (rsl.isPresent()) {
                break;
            }
        }
        return rsl;
    }
}
