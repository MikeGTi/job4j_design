package ru.job4j.ood.srp.erroneous;

/*  Нарушен Single Responsibility Principe (SRP),
 *  так как класс имеет три причины для изменения -
 *  настройка атаки или передвижения или сбора золота
 *
 *  Решение: Создать три класса AttackProperty, MoveProperty, PickupProperty
 *  Общее: Разделение ответственности класса по причинам внесения изменений,
 *  путем выноса кода в отдельные подклассы.
 *  */
public class GameUnit {
    private int health;

    private int gold;

    public void attack() {

    }

    public void move() {

    }

    public void pickGold() {

    }

}
