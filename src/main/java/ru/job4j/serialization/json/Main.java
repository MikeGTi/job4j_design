package ru.job4j.serialization.json;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Main {
    public static void main(String[] args) {
        final Person person = new Person(false, 30, new Contact("11-111"),
                new String[] {"Worker", "Married"});

        /* Convert Object person into json-string. */
        final Gson gson = new GsonBuilder().create();
        System.out.printf("Json person: %s%n", gson.toJson(person));

        /* Create new json-string with modified data*/
        final String personJson =
                "{"
                        + "\"sex\":false,"
                        + "\"age\":35,"
                        + "\"contact\":"
                        + "{"
                        + "\"phone\":\"+7(924)111-111-11-11\""
                        + "},"
                        + "\"statuses\":"
                        + "[\"Student\",\"Free\"]"
                        + "}";
        /* Convert json-string into person Object */
        final Person personMod = gson.fromJson(personJson, Person.class);
        System.out.printf("Modified Json person: %s%n", personMod);

        final Dog dog = new Dog(false, (byte) 3, "Jack", new String[] {"meat", "water", "carrot"}, new Contact("111-11-11"));

        /* Convert Object dog into json-string. */
        System.out.printf("%nJson dog: %s%n", gson.toJson(dog));

        /* Create new json-string with modified data*/
        final String dogJson =
                "{"
                    + "\"gender\":true,"
                    + "\"age\":5,"
                    + "\"name\":\"Bob\","
                    + "\"foodTypes\":"
                    + "[\"meat\",\"water\"],"
                    + "\"owner\":"
                    + "{"
                    + "\"phone\":\"+7(924)111-111-11-11\""
                    + "}"
                + "}";
        /* Convert json-string into dog Object */
        final Dog dogMod = gson.fromJson(dogJson, Dog.class);
        System.out.printf("Modified Json dog: %s%n", dogMod);
    }
}