package ru.job4j.ood.lsp.violators.warehouse;

/*  Нарушен Liskov Substitution Principle (LSP),
 *  Класс OrderStockAndPackValidator расширяющий класс OrderStockValidator
 *  переопределяет метод isValid c изменением его поведения - добавлен вызов исключения IllegalStateException.
 *
 *  Решение: В случае вызова IllegalStateException возвращать false
 *  */
public class OrderStockAndPackValidator extends OrderStockValidator {

    @Override
    public boolean isValid(Order order) {
        for (Item item : order.getItems()) {
            if (!item.isInStock()
             || !item.isPacked()) {
                throw new IllegalStateException(
                        String.format("Order %d is not valid!", order.getId())
                );
            }
        }
        return true;
    }
}
