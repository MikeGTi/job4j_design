package ru.job4j.ood.dip.violators;

/*  Нарушен Dependency Inversion Principle (DIP),
 *  Класс OrderService нарушает принцип инверсии зависимостей,
 *  так как зависит от конкретных классов, а не от абстракций,
 *  класс OrderService должен взаимодействовать с репозиториями через интерфейсы.
 *
 *  Решение: Создать интерфейсы, реализовать их.
 *  В класс OrderService внедрять зависимости через конструктор.
 *  Инициализацию зависимостей можно вынести в отдельный класс, для еще большей гибкости
 *  (например инициализацию через файл *.properties)
 */
public class OrderService {
    /* Пример не корректной реализации метода класса
    private final UserRepositoryImpl userRepository;
    private final ProductRepositoryImpl productRepository;
    private final OrderRepositoryImpl orderRepository;

    public void create(CreateOrderRequest request) {
        var user = userRepository.find(request.getUserId());
        var product = productRepository.find(request.getProductId());

        if (user.getBalance() < product.getPrice()) {
            throw new RuntimeException("Недостаточно средств");
        }

        var order = new Order(UUID.randomUUID(), user.getId(), product.getId());
        orderRepository.create(order);*/
}
