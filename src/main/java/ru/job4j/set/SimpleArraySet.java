package ru.job4j.set;

import ru.job4j.collection.SimpleArrayList;

import java.util.Iterator;
import java.util.Objects;

public class SimpleArraySet<T> implements SimpleSet<T> {

    private SimpleArrayList<T> set = new SimpleArrayList<>(0);

    @Override
    public boolean add(T value) {
        boolean notContainsSet = !contains(value);
        if (notContainsSet) {
            set.add(value);
        }
        return notContainsSet;
    }

    @Override
    public boolean contains(T value) {
        boolean containsSet = false;
        for (int i = 0; i < set.size(); i++) {
            if (Objects.equals(set.get(i), value)) {
                containsSet = true;
                break;
            }
        }
        return containsSet;
    }

    @Override
    public Iterator<T> iterator() {
        return set.iterator();
    }
}