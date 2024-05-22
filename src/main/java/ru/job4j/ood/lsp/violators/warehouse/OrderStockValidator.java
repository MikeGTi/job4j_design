package ru.job4j.ood.lsp.violators.warehouse;

public class OrderStockValidator {

    public boolean isValid(Order order) {
        for (Item item : order.getItems()) {
            if (!item.isInStock()) {
                return false;
            }
        }
        return true;
    }
}
