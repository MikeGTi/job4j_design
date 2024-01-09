package ru.job4j.io.serialization.xml;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.StringReader;
import java.io.StringWriter;

public class Main {
    public static void main(String[] args) throws Exception {
        Person person = new Person(false, 30, new ContactXml("11-111"), "Worker", "Married");
        /* Get context for API */
        JAXBContext context = JAXBContext.newInstance(Person.class);
        /* Create serializer */
        Marshaller marshaller = context.createMarshaller();
        /* Setup */
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
        String xml;
        try (StringWriter writer = new StringWriter()) {
            /* Serializing */
            marshaller.marshal(person, writer);
            xml = writer.getBuffer().toString();
            System.out.println(xml);
        }
        /* Create de-serializer */
        Unmarshaller unmarshaller = context.createUnmarshaller();
        try (StringReader reader = new StringReader(xml)) {
            /* De-serializing */
            Person result = (Person) unmarshaller.unmarshal(reader);
            System.out.println(result);
        }

    }
}