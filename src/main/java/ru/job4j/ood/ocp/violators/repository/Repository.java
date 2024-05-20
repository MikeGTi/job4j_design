package ru.job4j.ood.ocp.violators.repository;

/*  Нарушен Open-Closed Principle (OCP),
 *  так как поведение метода save класса зависит от конкретного приходящего в него объекта,
 *  проблемы возникают каждый раз при добавлении наследников класса AbstractEntity.
 *
 *  Решение: Создать интерфейс IRepository и создать хранилища AccountRepository, RoleRepository
 *           - каждое со своей реализацией метода save
 *  Общее: Типы полей класса должны представлять собой абстракции или примитивные типы,
 *         делается для снижения связности кода.
 *  */
public class Repository {
    public void save(AbstractEntity entity) {
        /*
        * if (entity instanceof AccountEntity){
        *     специфические действия для AccountEntity
        * } else if (entity instanceof RoleEntity){
        *     специфические действия для RoleEntity
        */
        }
    }

