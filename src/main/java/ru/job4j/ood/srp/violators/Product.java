package ru.job4j.ood.srp.violators;

/* Нарушен Single Responsibility Principe (SRP), т.к. класс отвечает за две сущности:
 *  работа с количеством товаров на складе и
 *  работа со стоимостью товара
 *
 *  Решение: Создать два класса ProductOffer (цена) и ProductStock (склад)
 *  Общее: Разделение ответственности класса по пользователям этого класса (цена - менеджер, количество - складской работник).
 *  */
public class Product {
    int stock;
    Double price;

    void addStock(int amount) {
        stock += amount;
    }

    void setPrice(double newPrice) {
        price = newPrice;
    }
}
