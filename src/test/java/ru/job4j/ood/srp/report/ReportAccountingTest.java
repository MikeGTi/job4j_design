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
        IReport accounting = new ReportAccounting(store, parser, converter);
        String expected = "Name; Hired; Fired; Salary ($);" + System.lineSeparator()
                + worker.getName() + " "
                + parser.parse(worker.getHired()) + " "
                + parser.parse(worker.getFired()) + " "
                + converter.convert(Currency.RUB, worker.getSalary(), Currency.USD) + System.lineSeparator();
        assertThat(accounting.generate(employee -> true)).isEqualTo(expected);
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
        IReport accounting = new ReportAccounting(store, parser, converter);
        String expected = "Name; Hired; Fired; Salary ($);" + System.lineSeparator()
                + worker1.getName() + " "
                + parser.parse(worker1.getHired()) + " "
                + parser.parse(worker1.getFired()) + " "
                + converter.convert(Currency.RUB, worker1.getSalary(), Currency.USD) + System.lineSeparator()
                + worker3.getName() + " "
                + parser.parse(worker3.getHired()) + " "
                + parser.parse(worker3.getFired()) + " "
                + converter.convert(Currency.RUB, worker3.getSalary(), Currency.USD) + System.lineSeparator()
                + worker2.getName() + " "
                + parser.parse(worker2.getHired()) + " "
                + parser.parse(worker2.getFired()) + " "
                + converter.convert(Currency.RUB, worker2.getSalary(), Currency.USD) + System.lineSeparator();
        assertThat(accounting.generate(employee -> true)).isEqualTo(expected);
    }
}