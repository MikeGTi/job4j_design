package ru.job4j.ood.srp.report;

import org.junit.jupiter.api.Test;
import ru.job4j.ood.srp.model.Employee;
import ru.job4j.ood.srp.store.MemoryStore;

import java.util.Calendar;

import static org.assertj.core.api.Assertions.*;
class ReportHRTest {

    @Test
    void whenOneEmployeeReportGenerated() {
        MemoryStore store = new MemoryStore();
        Calendar now = Calendar.getInstance();
        Employee worker1 = new Employee("TestEmployee1", now, now, 101);
        store.add(worker1);
        Report hr = new ReportHR(store);
        StringBuilder expected = new StringBuilder()
                .append("Name; Salary").append(System.lineSeparator())
                .append(worker1.getName()).append(" ")
                .append(worker1.getSalary()).append(System.lineSeparator());
        assertThat(hr.generate(employee -> true)).isEqualTo(expected.toString());
    }

    @Test
    void whenSeveralEmployeesReportGenerated() {
        MemoryStore store = new MemoryStore();
        Calendar now = Calendar.getInstance();
        Employee worker1 = new Employee("TestEmployee1", now, now, 101);
        Employee worker2 = new Employee("TestEmployee2", now, now, 102);
        Employee worker3 = new Employee("TestEmployee3", now, now, 103);
        store.add(worker1);
        store.add(worker3);
        store.add(worker2);
        Report hr = new ReportHR(store);
        StringBuilder expected = new StringBuilder()
                .append("Name; Salary").append(System.lineSeparator())
                .append(worker3.getName()).append(" ")
                .append(worker3.getSalary()).append(System.lineSeparator())
                .append(worker2.getName()).append(" ")
                .append(worker2.getSalary()).append(System.lineSeparator())
                .append(worker1.getName()).append(" ")
                .append(worker1.getSalary()).append(System.lineSeparator());
        assertThat(hr.generate(employee -> true)).isEqualTo(expected.toString());
    }
}