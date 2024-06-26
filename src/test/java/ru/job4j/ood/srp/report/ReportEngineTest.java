package ru.job4j.ood.srp.report;

import org.junit.jupiter.api.Test;
import ru.job4j.ood.srp.formatter.DateTimeParser;
import ru.job4j.ood.srp.formatter.ReportDateTimeParser;
import ru.job4j.ood.srp.model.Employee;
import ru.job4j.ood.srp.store.MemoryStore;

import java.util.Calendar;

import static org.assertj.core.api.Assertions.assertThat;

public class ReportEngineTest {

    @Test
    public void whenOldGenerated() {
        MemoryStore store = new MemoryStore();
        Calendar now = Calendar.getInstance();
        Employee worker = new Employee("Ivan", now, now, 100);
        DateTimeParser<Calendar> parser = new ReportDateTimeParser();
        store.add(worker);
        IReport engine = new ReportEngine(store, parser);
        String expected = "Name; Hired; Fired; Salary;" + System.lineSeparator()
                + worker.getName() + " "
                + parser.parse(worker.getHired()) + " "
                + parser.parse(worker.getFired()) + " "
                + worker.getSalary() + System.lineSeparator();
        assertThat(engine.generate(employee -> true)).isEqualTo(expected);
    }
}