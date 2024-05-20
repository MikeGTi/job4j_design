package ru.job4j.ood.ocp.violators.mailer;

/*  Нарушен Open-Closed Principle (OCP),
 *  так как класс имеет зависимость от конкретной реализации класса Logger, который пишет лог в файл,
 *  проблема возникнет при необходимости логирования в БД и тп
 *
 *  Решение: Создать интерфейс ILogger и заменить в классе SmtpMailer зависимость Logger - на ILogger
 *  Общее: Типы полей класса должны представлять собой абстракции или примитивные типы,
 *         делается для снижения связности кода.
 *  */
public class SmtpMailer {
    private Logger logger;

    public SmtpMailer() {
        logger = new Logger();
    }

    public void sendMessage(String message) {
        /*
        * send message code
        * */
        logger.log(String.format("Отправлено '{%s}'", message));
    }
}