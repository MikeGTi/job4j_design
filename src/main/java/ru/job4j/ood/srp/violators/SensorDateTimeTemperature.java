package ru.job4j.ood.srp.violators;

import java.util.Date;


/* Нарушен Single Responsibility Principe (SRP), т.к. класс отвечает за две сущности:
*  работа с температурными данными датчика и
*  работа с датой/временем
*
*  Решение: Создать подклассы DateTime (время) и Temperature (температура),
*  и композитный объединяющий класс SensorDateTimeTemperature (c полями классов DateTime и Temperature)
*  */
public class SensorDateTimeTemperature {
    Date datetime;
    Integer temperature;
}
