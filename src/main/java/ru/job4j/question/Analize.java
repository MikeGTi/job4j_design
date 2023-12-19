package ru.job4j.question;

import ru.job4j.generic.User;

import java.util.HashMap;
import java.util.Set;

public class Analize {

    public static Info diff(Set<User> previous, Set<User> current) {
        int added = 0;
        int changed = 0;
        int deleted = 0;
        HashMap<String, User> prev = new HashMap<>();
        HashMap<String, User> curr = new HashMap<>();
        previous.forEach(u -> prev.put(u.getId(), u));
        current.forEach(u -> curr.put(u.getId(), u));
        for (User user: previous) {
            if (!curr.containsKey(user.getId())) {
                deleted++;
            }
        }
        for (User user: current) {
            if (!prev.containsKey(user.getId())) {
                added++;
            } else {
                if (!user.getUsername().equals(prev.get(user.getId()).getUsername())) {
                    changed++;
                }
            }
        }
        return new Info(added, changed, deleted);
    }

}