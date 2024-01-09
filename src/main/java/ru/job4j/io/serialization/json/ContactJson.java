package ru.job4j.io.serialization.json;

public class ContactJson {
    private final String phone;

    public ContactJson(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "ContactXml{"
                + "phone='" + phone + '\''
                + '}';
    }
}