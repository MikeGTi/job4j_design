package ru.job4j.ood.lsp.store;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public class Warehouse extends AbstractStore {

    private Date now = null;

    public Warehouse() {

    }

    public Warehouse(Date nowOnlyForTest) {
        this.now = nowOnlyForTest;
    }

    @Override
    public boolean add(Food food) {
        if (now == null) {
            now = new Date();
        }
        boolean rsl = false;
        if (food.expirePercent(now) < 25) {
            rsl = super.data.add(food);
        }
        return rsl;
    }

    @Override
    public Optional<Food> getById(Long id) {
        return super.getById(id);
    }

    @Override
    public List<Food> getAll() {
        return super.getAll();
    }

    @Override
    public boolean delete(Long id) {
        return super.delete(id);
    }

}
