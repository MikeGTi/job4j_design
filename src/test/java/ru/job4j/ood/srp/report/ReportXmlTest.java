package ru.job4j.ood.srp.report;

import ru.job4j.ood.srp.model.Employee;
import ru.job4j.ood.srp.model.Employees;
import ru.job4j.ood.srp.store.IStore;
import ru.job4j.ood.srp.store.MemoryStore;

import javax.xml.bind.*;
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.*;

class ReportXmlTest {

    @Test
    void whenOneEmployeeReportGenerated() throws JAXBException {
        IStore store = new MemoryStore();
        Employee employee1 = new Employee("John Doe",
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                5000.0);
        store.add(employee1);
        IReport xmlRep = new ReportXml(store, JAXBContext.newInstance(Employees.class));
        String expected = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n"
                        + "<employees>\n"
                        + "    <employee>\n"
                        + "        <name>John Doe</name>\n"
                        + "        <hired>08:06:2023 17:41</hired>\n"
                        + "        <fired>08:06:2023 17:41</fired>\n"
                        + "        <salary>5000.0</salary>\n"
                        + "    </employee>\n"
                        + "</employees>\n";
        assertThat(xmlRep.generate(employee -> true)).isEqualTo(expected);
    }

    @Test
    void whenSeveralEmployeesReportGenerated() throws JAXBException {
        IStore store = new MemoryStore();
        Employee employee1 = new Employee("John Doe",
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                5000.0);
        Employee employee2 = new Employee("Jane Smith",
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                6000.0);
        Employee employee3 = new Employee("Vasiliy Pupkin",
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                new GregorianCalendar(2023, Calendar.JUNE, 8, 17, 41),
                12000.0);
        store.add(employee1);
        store.add(employee2);
        store.add(employee3);
        IReport xmlRep = new ReportXml(store, JAXBContext.newInstance(Employees.class));
        String expected = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n"
                        + "<employees>\n"
                        + "    <employee>\n"
                        + "        <name>John Doe</name>\n"
                        + "        <hired>08:06:2023 17:41</hired>\n"
                        + "        <fired>08:06:2023 17:41</fired>\n"
                        + "        <salary>5000.0</salary>\n"
                        + "    </employee>\n"
                        + "    <employee>\n"
                        + "        <name>Jane Smith</name>\n"
                        + "        <hired>08:06:2023 17:41</hired>\n"
                        + "        <fired>08:06:2023 17:41</fired>\n"
                        + "        <salary>6000.0</salary>\n"
                        + "    </employee>\n"
                        + "    <employee>\n"
                        + "        <name>Vasiliy Pupkin</name>\n"
                        + "        <hired>08:06:2023 17:41</hired>\n"
                        + "        <fired>08:06:2023 17:41</fired>\n"
                        + "        <salary>12000.0</salary>\n"
                        + "    </employee>\n"
                        + "</employees>\n";
        assertThat(xmlRep.generate(em -> true)).isEqualTo(expected);
    }
}