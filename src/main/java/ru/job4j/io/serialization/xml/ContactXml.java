package ru.job4j.io.serialization.xml;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "contact")
public class ContactXml {

    @XmlAttribute
    private String phone;

    public ContactXml() {

    }

    public ContactXml(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "ContactXml{"
                + "phone='" + phone + '\''
                + '}';
    }
}