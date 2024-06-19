package ru.job4j.ood.dip.violators;

/*  Нарушен Dependency Inversion Principle (DIP),
 *  Класс Reporter нарушает принцип инверсии зависимостей,
 *  так как зависит от конкретных классов, а не от абстракций.
 *  Также такой класс трудно протестировать, например случай с пустым списком Reports
 *
 *  Решение: Создать интерфейсы и реализовать их через классы.
 *  В класс Reporter внедрять зависимости через конструктор (IReportBuilder и IReportSender).
 *  Инициализацию зависимостей можно вынести в отдельный класс, для еще большей гибкости
 *  (например инициализацию через файл *.properties)
 */
public class Reporter {

    public void sendReports() {
        /* Пример не корректной реализации метода класса
        var reportBuilder = new ReportBuilder();
        IList<Report> reports = reportBuilder.CreateReports();

        if (reports.Count == 0) {
            throw new NoReportsException();
        }

        var reportSender = new EmailReportSender();
        for (Report report : reports) {
            reportSender.Send(report);
        }*/
    }
}
