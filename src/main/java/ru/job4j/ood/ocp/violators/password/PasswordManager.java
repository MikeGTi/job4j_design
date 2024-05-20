package ru.job4j.ood.ocp.violators.password;

/*  Нарушен Open-Closed Principle (OCP), в классе PasswordValidator, в случае
 *  если он используется многими пользователями, невозможно настроить различную
 *  минимальную длину пароля для каждого из пользователей, или внести любое другое правило.
 *
 *  Решение: Создать интерфейс IValidator, заменить в классе PasswordManager зависимость passwordValidator - на IValidator,
 *  применить в passwordValidator паттерн Strategy, c реализацией правил валидации в отдельных классах (интерфейс IRule) Rule.
 *  Общее: Применять паттерн проектирования Strategy, и типы полей класса должны представлять собой абстракции или примитивные типы.
 *  */
public class PasswordManager {
    public boolean changePassword() {
        var passwordValidator = new PasswordValidator();
        var isPasswordValid = passwordValidator.isValid(new PasswordChangeModel());

        /*
        * some logic
        */

        return isPasswordValid;
    }
}
