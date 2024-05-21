package ru.job4j.ood.srp.report;

import ru.job4j.ood.srp.model.Employee;
import ru.job4j.ood.srp.model.Employees;
import ru.job4j.ood.srp.store.IStore;

import javax.xml.bind.*;
import java.io.StringWriter;
import java.util.function.Predicate;

public class ReportXml implements IReport {

    private final IStore store;

    private final JAXBContext context;

    public ReportXml(IStore store, JAXBContext jaxbContext) {
        this.store = store;
        this.context = jaxbContext;
    }

    @Override
    public String generate(Predicate<Employee> filter) {
        final Employees employees = new Employees();
        employees.setEmployees(store.findBy(filter));
        StringWriter writer = new StringWriter();
        try {
            Marshaller marshaller = context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
            marshaller.marshal(employees, writer);
        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return writer.getBuffer().toString();
    }
}
