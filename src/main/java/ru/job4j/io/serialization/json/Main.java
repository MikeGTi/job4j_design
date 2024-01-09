package ru.job4j.io.serialization.json;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        printPersonByJsonJavaLib();
        System.out.println();
        printDogByJsonJavaLib();
        System.out.println();

        final Gson gson = new GsonBuilder().create();
        printPersonByGsonBuilder(gson);
        System.out.println();
        printDogByGsonBuilder(gson);
    }

    private static void printDogByJsonJavaLib() {
        JSONObject jsonOwnerContact = new JSONObject("{\"phone\":\"+7(924)111-11-11\"}");

        List<String> list = new ArrayList<>();
        list.add("meat");
        list.add("water");
        JSONArray jsonFoods = new JSONArray(list);

        final Dog  dog = new Dog(false, (byte) 30, "Bobik", new String[] {"meat", "water"}, new ContactJson("+7(924)111-11-11"));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("gender", dog.getGender());
        jsonObject.put("name", dog.getName());
        jsonObject.put("age", dog.getAge());
        jsonObject.put("foodTypes", jsonFoods);
        jsonObject.put("owner", jsonOwnerContact);

        System.out.printf("JsonJavaLib dog: %s", jsonObject);
        System.out.printf("%nJsonJavaLib dog: %s%n", new JSONObject(dog));
    }

    private static void printPersonByJsonJavaLib() {
        /* JSONObject from json-string */
        JSONObject jsonContact = new JSONObject("{\"phone\":\"+7(924)111-11-11\"}");

        /* JSONArray from ArrayList */
        List<String> list = new ArrayList<>();
        list.add("Student");
        list.add("Free");
        JSONArray jsonStatuses = new JSONArray(list);

        /* JSONObject direct by methods put */
        final Person  person = new Person(false, 30, new ContactJson("111-11-11"), new String[] {"Worker", "Married"});
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("sex", person.getSex());
        jsonObject.put("age", person.getAge());
        jsonObject.put("contact", jsonContact);
        jsonObject.put("statuses", jsonStatuses);

        System.out.printf("JsonJavaLib person: %s", jsonObject);

        /* Convert person into json-string */
        System.out.printf("%nJsonJavaLib person: %s%n", new JSONObject(person));
    }

    private static void printPersonByGsonBuilder(Gson gson) {
        final Person person = new Person(false, 30, new ContactJson("111-11-11"),
                new String[] {"Worker", "Married"});

        /* Convert Object person into json-string */
        System.out.printf("JsonBuilder person: %s%n", gson.toJson(person));

        /* Create new json-string with modified data */
        final String personJson =
                "{"
                        + "\"sex\":false,"
                        + "\"age\":35,"
                        + "\"contact\":"
                        + "{"
                        + "\"phone\":\"222-22-22\""
                        + "},"
                        + "\"statuses\":"
                        + "[\"Student\",\"Free\"]"
                        + "}";
        /* Convert json-string into person Object */
        final Person personMod = gson.fromJson(personJson, Person.class);
        System.out.printf("JsonBuilder person: %s, from json string%n", personMod);
    }

    private static void printDogByGsonBuilder(Gson gson) {
        final Dog dog = new Dog(false, (byte) 3, "Jack", new String[] {"meat", "water", "carrot"}, new ContactJson("111-11-11"));

        /* Convert Object dog into json-string */
        System.out.printf("JsonBuilder dog: %s%n", gson.toJson(dog));

        /* Create new json-string with modified data */
        final String dogJson =
                "{"
                        + "\"gender\":true,"
                        + "\"age\":5,"
                        + "\"name\":\"Bob\","
                        + "\"foodTypes\":"
                        + "[\"meat\",\"water\"],"
                        + "\"owner\":"
                        + "{"
                        + "\"phone\":\"+7(924)111-11-11\""
                        + "}"
                        + "}";
        /* Convert json-string into dog Object */
        final Dog dogMod = gson.fromJson(dogJson, Dog.class);
        System.out.printf("JsonBuilder dog: %s, from json string%n", dogMod);
    }
}