package ru.job4j.ood.lsp.violators.warehouse;

import java.util.List;

public class Order {

    private long id;
    private List<Item> items;

    public Order(long id, List<Item> items) {
        this.id = id;
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public long getId() {
        return id;
    }
}
