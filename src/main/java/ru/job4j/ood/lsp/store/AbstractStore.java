package ru.job4j.ood.lsp.store;

import java.util.*;

public abstract class AbstractStore implements Store<Food> {

    List<Food> data = new ArrayList<>();

    public abstract boolean add(Food food);

    public Optional<Food> getById(Long id) {
        for (Food food : data) {
            if (id.equals(food.getId())) {
                return Optional.of(food);
            }
        }
        return Optional.empty();
    }

    public List<Food> getAll() {
        return data;
    }

    public boolean delete(Long id) {
        boolean rsl = false;
        Optional<Food> food = getById(id);
        if (food.isPresent()) {
            rsl = data.remove(food.get());
        }
        return rsl;
    }
}
