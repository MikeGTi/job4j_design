package ru.job4j.map;

import java.util.Calendar;
import java.util.HashMap;

public class User {
    private final String name;
    private final int children;
    private final Calendar birthday;

    public User(String name, int children, Calendar birthday) {
        this.name = name;
        this.children = children;
        this.birthday = birthday;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof User user)) {
            return false;
        }
        if (children != user.children) {
            return false;
        }
        if (!name.equals(user.name)) {
            return false;
        }
        return birthday.equals(user.birthday);
    }

    @Override
    public int hashCode() {
        int result = name.hashCode();
        result = 31 * result + children;
        result = 31 * result + birthday.hashCode();
        return result;
    }

    public static void main(String[] args) {
        Calendar birthday = Calendar.getInstance();
        birthday.set(2010, Calendar.OCTOBER, 20);

        User userTest1 = new User("NameTest", 2, birthday);
        User userTest2 = new User("NameTest", 2, birthday);

        HashMap<User, Object> usersMap = new HashMap<>();
        usersMap.put(userTest1, new Object());
        usersMap.put(userTest2, new Object());

        System.out.print("User1: ");
        printUserProps(userTest1);
        System.out.print("User2: ");
        printUserProps(userTest2);

        usersMap.forEach((u, o)  -> System.out.println(u));
    }

    private static void printUserProps(User user) {
        int hashCode = user.hashCode();
        int hash = hashCode ^ (hashCode >>> 16);
        int bucket = hash & 15;

        System.out.printf("hashCode: %s, hash: %s, bucket: %s\n", hashCode, hash, bucket);
    }
}
