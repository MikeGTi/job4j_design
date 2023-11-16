package ru.job4j.generics;

import java.util.*;

public class GenericUsage {

    public void addAll(List<? super Integer> list) {
        for (int i = 1; i <= 5; i++) {
            list.add(i);
        }
        for (Object line : list) {
            System.out.println("Текущий элемент: " + line);
        }
    }

    public void printInfo(Collection<? extends Person> col) {
        for (Iterator<? extends Person> iterator = col.iterator(); iterator.hasNext();) {
            Person next = iterator.next();
            System.out.println(next);
        }
    }

    public void printRsl(Collection<?> col) {
        for (Iterator<?> iterator = col.iterator(); iterator.hasNext();) {
            Object next = iterator.next();
            System.out.println("Текущий элемент: " + next);
        }
    }

    public static void main(String[] args) {
        List list = new ArrayList();
        list.add("first");
        list.add("second");
        list.add("third");
        list.add(new Person("name", 21, new Date(913716000000L)));

        /*for (int i = 0; i < list.size(); i++) {
            String line = (String) list.get(i);
            System.out.println("Текущий элемент: " + line);
        }*/

        List<Integer> list2 = List.of(1, 2, 3, 4, 5);
        new GenericUsage().printRsl(list2);

        List<Person> per = List.of(new Person("Person's name", 21, new Date(913716000000L)));
        new GenericUsage().printInfo(per);

        List<Programmer> pro = List.of(new Programmer("Programmer's name", 23, new Date(913716000000L)));
        new GenericUsage().printInfo(pro);

        List<? super Integer> list3 = new ArrayList<>();
        new GenericUsage().addAll(list3);
    }
}