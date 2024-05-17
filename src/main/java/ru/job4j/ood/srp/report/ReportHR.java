package ru.job4j.ood.srp.report;

import ru.job4j.ood.srp.model.Employee;
import ru.job4j.ood.srp.store.Store;

import java.util.*;
import java.util.function.Predicate;

public class ReportHR implements Report {
    
    private final Store store;

    public ReportHR(Store store) {
        this.store = store;
    }

    @Override
    public String generate(Predicate<Employee> filter) {
        StringBuilder text = new StringBuilder();
        List<Employee> employees = store.findBy(filter);
                       employees.sort((e1, e2) -> (int) (e2.getSalary() - e1.getSalary()));
        text.append("Name; Salary")
            .append(System.lineSeparator());
        for (Employee employee : employees) {
            text.append(employee.getName()).append(" ")
                .append(employee.getSalary())
                .append(System.lineSeparator());
        }
        return text.toString();
    }
}
