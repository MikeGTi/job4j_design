package ru.job4j.ood.srp.report;

import org.junit.jupiter.api.Test;
import ru.job4j.ood.srp.formatter.DateTimeParser;
import ru.job4j.ood.srp.formatter.ReportDateTimeParser;
import ru.job4j.ood.srp.model.Employee;
import ru.job4j.ood.srp.store.MemoryStore;

import java.util.Calendar;

import static org.assertj.core.api.Assertions.*;

class ReportITTest {
    @Test
    void whenOneEmployeeReportGenerated() {
        MemoryStore store = new MemoryStore();
        Calendar now = Calendar.getInstance();
        Employee worker = new Employee("TestUser1", now, now, 101);
        DateTimeParser<Calendar> parser = new ReportDateTimeParser();
        store.add(worker);
        IReport itRep = new ReportIT(store, parser);
        String expected = "Name, Hired, Fired, Salary" + System.lineSeparator()
                + worker.getName() + ", "
                + parser.parse(worker.getHired()) + ", "
                + parser.parse(worker.getFired()) + ", "
                + worker.getSalary() + System.lineSeparator();
        assertThat(itRep.generate(employee -> true)).isEqualTo(expected);
    }

    @Test
    void whenSeveralEmployeesReportGenerated() {
        MemoryStore store = new MemoryStore();
        Calendar now = Calendar.getInstance();
        Employee worker1 = new Employee("TestUser1", now, now, 101);
        Employee worker2 = new Employee("TestUser2", now, now, 103);
        Employee worker3 = new Employee("TestUser3", now, now, 103);
        DateTimeParser<Calendar> parser = new ReportDateTimeParser();
        store.add(worker1);
        store.add(worker2);
        store.add(worker3);
        IReport itRep = new ReportIT(store, parser);
        String expected = "Name, Hired, Fired, Salary" + System.lineSeparator()
                + worker1.getName() + ", "
                + parser.parse(worker1.getHired()) + ", "
                + parser.parse(worker1.getFired()) + ", "
                + worker1.getSalary() + System.lineSeparator()
                + worker2.getName() + ", "
                + parser.parse(worker2.getHired()) + ", "
                + parser.parse(worker2.getFired()) + ", "
                + worker2.getSalary() + System.lineSeparator()
                + worker3.getName() + ", "
                + parser.parse(worker3.getHired()) + ", "
                + parser.parse(worker3.getFired()) + ", "
                + worker3.getSalary() + System.lineSeparator();
        assertThat(itRep.generate(employee -> true)).isEqualTo(expected);
    }
}