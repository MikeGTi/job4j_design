package ru.job4j.ood.srp.report;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonParseException;
import org.junit.jupiter.api.Test;
import ru.job4j.ood.srp.formatter.DateTimeParser;
import ru.job4j.ood.srp.formatter.ReportDateTimeParser;
import ru.job4j.ood.srp.model.Employee;
import ru.job4j.ood.srp.store.IStore;
import ru.job4j.ood.srp.store.MemoryStore;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import static org.assertj.core.api.Assertions.*;

class ReportJsonTest {
    @Test
    void whenOneEmployeeReportGenerated() {
        IStore store = new MemoryStore();
        Calendar now = Calendar.getInstance();
        Employee worker = new Employee("TestUser1", now, now, 101);
        DateTimeParser<Calendar> parser = new ReportDateTimeParser();
        store.add(worker);
        IReport itRep = new ReportJson(store, new GsonBuilder());
        String expected = "[{"
                + "\"name\":\"" + worker.getName() + "\","
                + "\"hired\":\"" + parser.parse(worker.getHired()) + "\","
                + "\"fired\":\"" + parser.parse(worker.getFired()) + "\","
                + "\"salary\":" + worker.getSalary()
                + "}]";
        assertThat(itRep.generate(employee -> true)).isEqualTo(expected);
    }

    @Test
    void whenTwoEmployeesReportGenerated() throws JsonParseException {
        IStore store = new MemoryStore();
        Employee employee = new Employee("John Doe",
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                5000.0);
        Employee employee1 = new Employee("Jane Smith",
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                6000.0);
        store.add(employee);
        store.add(employee1);
        IReport engine = new ReportJson(store, new GsonBuilder());
        String expected = """
        [{"name":"John Doe","hired":"08:06:2023 17:41","fired":"08:06:2023 17:41","salary":5000.0},{"name":"Jane Smith","hired":"08:06:2023 17:41","fired":"08:06:2023 17:41","salary":6000.0}]""";
        assertThat(engine.generate(em -> true)).isEqualTo(expected);
    }

    @Test
    void whenSeveralEmployeesReportGenerated() {
        IStore store = new MemoryStore();
        Calendar now = Calendar.getInstance();
        Employee worker1 = new Employee("TestUser1", now, now, 101);
        Employee worker2 = new Employee("TestUser2", now, now, 102);
        Employee worker3 = new Employee("TestUser3", now, now, 103);
        DateTimeParser<Calendar> parser = new ReportDateTimeParser();
        store.add(worker1);
        store.add(worker2);
        store.add(worker3);
        IReport itRep = new ReportJson(store, new GsonBuilder());
        List<Employee> employees = List.of(worker1, worker2, worker3);
        StringBuilder expected = new StringBuilder();
        expected.append("[");
        for (Employee e : employees) {
            expected
                .append("{")
                .append("\"name\":\"").append(e.getName()).append("\",")
                .append("\"hired\":\"").append(parser.parse(e.getHired())).append("\",")
                .append("\"fired\":\"").append(parser.parse(e.getFired())).append("\",")
                .append("\"salary\":").append(e.getSalary())
                .append("},");
        }
        int last = expected.lastIndexOf(",");
        expected.replace(last, last + 1, "]");
        assertThat(itRep.generate(employee -> true)).isEqualTo(expected.toString());
    }
}