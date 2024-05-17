package ru.job4j.ood.srp.report;

import org.junit.jupiter.api.Test;
import ru.job4j.ood.srp.currency.Currency;
import ru.job4j.ood.srp.currency.InMemoryCurrencyConverter;
import ru.job4j.ood.srp.formatter.DateTimeParser;
import ru.job4j.ood.srp.formatter.ReportDateTimeParser;
import ru.job4j.ood.srp.model.Employee;
import ru.job4j.ood.srp.store.MemoryStore;

import java.util.Calendar;

import static org.assertj.core.api.Assertions.*;

class ReportAccountingTest {

    @Test
    void whenOneEmployeeReportGenerated() {
        MemoryStore store = new MemoryStore();
        Calendar now = Calendar.getInstance();
        Employee worker = new Employee("TestUser1", now, now, 101);
        DateTimeParser<Calendar> parser = new ReportDateTimeParser();
        InMemoryCurrencyConverter converter = new InMemoryCurrencyConverter();
        store.add(worker);
        Report accounting = new ReportAccounting(store, parser, converter);
        StringBuilder expected = new StringBuilder()
                .append("Name; Hired; Fired; Salary ($);")
                .append(System.lineSeparator())
                .append(worker.getName()).append(" ")
                .append(parser.parse(worker.getHired())).append(" ")
                .append(parser.parse(worker.getFired())).append(" ")
                .append(converter.convert(Currency.RUB, worker.getSalary(), Currency.USD))
                .append(System.lineSeparator());
        assertThat(accounting.generate(employee -> true)).isEqualTo(expected.toString());
    }

    @Test
    void whenSeveralEmployeesReportGenerated() {
        MemoryStore store = new MemoryStore();
        Calendar now = Calendar.getInstance();
        Employee worker1 = new Employee("TestUser1", now, now, 101);
        Employee worker2 = new Employee("TestUser2", now, now, 102);
        Employee worker3 = new Employee("TestUser3", now, now, 103);
        DateTimeParser<Calendar> parser = new ReportDateTimeParser();
        InMemoryCurrencyConverter converter = new InMemoryCurrencyConverter();
        store.add(worker1);
        store.add(worker3);
        store.add(worker2);
        Report accounting = new ReportAccounting(store, parser, converter);
        StringBuilder expected = new StringBuilder()
                .append("Name; Hired; Fired; Salary ($);")
                .append(System.lineSeparator())
                .append(worker1.getName()).append(" ")
                .append(parser.parse(worker1.getHired())).append(" ")
                .append(parser.parse(worker1.getFired())).append(" ")
                .append(converter.convert(Currency.RUB, worker1.getSalary(), Currency.USD))
                .append(System.lineSeparator())
                .append(worker3.getName()).append(" ")
                .append(parser.parse(worker3.getHired())).append(" ")
                .append(parser.parse(worker3.getFired())).append(" ")
                .append(converter.convert(Currency.RUB, worker3.getSalary(), Currency.USD))
                .append(System.lineSeparator())
                .append(worker2.getName()).append(" ")
                .append(parser.parse(worker2.getHired())).append(" ")
                .append(parser.parse(worker2.getFired())).append(" ")
                .append(converter.convert(Currency.RUB, worker2.getSalary(), Currency.USD))
                .append(System.lineSeparator());
        assertThat(accounting.generate(employee -> true)).isEqualTo(expected.toString());
    }
}