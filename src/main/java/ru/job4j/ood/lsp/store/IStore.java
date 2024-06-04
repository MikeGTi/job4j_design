package ru.job4j.ood.lsp.store;

import java.util.List;
import java.util.Optional;

public interface IStore<Food> {
    boolean add(Food food);

    Optional<Food> getById(Long id);

    List<Food> getAll();

    boolean delete(Long id);
}
