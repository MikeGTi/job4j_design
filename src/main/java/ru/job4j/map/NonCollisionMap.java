package ru.job4j.map;

import java.util.*;

public class NonCollisionMap<K, V> implements SimpleMap<K, V> {

    private static final float LOAD_FACTOR = 0.75f;

    private int capacity = 8;

    private int count = 0;

    private int modCount = 0;

    private MapEntry<K, V>[] table = new MapEntry[capacity];

    @Override
    public boolean put(K key, V value) {
        if (count == (int) (capacity * LOAD_FACTOR)) {
            expand();
        }
        int hk = hash(Objects.hashCode(key));
        int index = indexFor(hk);
        boolean free = (this.table[index] == null);
        if (free) {
            this.table[index] = new MapEntry<>(key, value);
        }
        count++;
        modCount++;
        return free;
    }

    private int hash(int hashCode) {
        return hashCode ^ (hashCode >>> 16);
    }

    private int indexFor(int hash) {
        return hash & capacity - 1;
    }

    private void expand() {
        capacity *= 2;
        MapEntry<K, V>[] newTable = new MapEntry[capacity];
        for (MapEntry<K, V> entry: table) {
            if (entry != null) {
                newTable[indexFor(hash(Objects.hashCode(entry.key)))] = entry;
            }
        }
        table = newTable;
    }

    @Override
    public V get(K key) {
        int keyHashCode = Objects.hashCode(key);
        int keyHash = hash(keyHashCode);
        int index = indexFor(keyHash);
        V value = null;
        if (this.table[index] != null) {
            if (Objects.hashCode(this.table[index].key) == keyHashCode
                    && Objects.equals(this.table[index].key, key)) {
                value = this.table[index].value;
                count++;
            }
        }
        return value;
    }

    @Override
    public boolean remove(K key) {
        int keyHashCode = Objects.hashCode(key);
        int keyHash = hash(keyHashCode);
        int index = indexFor(keyHash);

        boolean removed = false;
        if (table[index] != null) {
            if (Objects.hashCode(table[index].key) == keyHashCode
                    && Objects.equals(table[index].key, key)) {
                table[index] = null;
                removed = true;
                count--;
                modCount++;
            }
        }
        return removed;
    }

    @Override
    public Iterator<K> iterator() {
        return new Iterator<>() {
            private int index = 0;
            private final int expectedModCount = modCount;

            @Override
            public boolean hasNext() {
                if (expectedModCount != modCount) {
                    throw new ConcurrentModificationException();
                }
                while (index != table.length && table[index] == null) {
                    index++;
                }
                return index != table.length;
            }

            @Override
            public K next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                return table[index++].key;
            }

            @Override
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
    }

    private static class MapEntry<K, V> {
        K key;
        V value;

        public MapEntry(K key, V value) {
            this.key = key;
            this.value = value;
        }
    }

    /*
    * testing private methods
    */
    public static void main(String[] args) {
        NonCollisionMap<Integer, String> map = new NonCollisionMap<>();

        int testsPassed = 0;

        testsPassed += (map.hash(0) == 0) ? 1 : 0;
        testsPassed += (map.hash(65535) == 65535) ? 1 : 0;
        testsPassed += (map.hash(65536) == 65537) ? 1 : 0;

        testsPassed += (map.indexFor(0) == 0) ? 1 : 0;
        testsPassed += (map.indexFor(7) == 7) ? 1 : 0;
        testsPassed += (map.indexFor(8) == 0) ? 1 : 0;

        if (testsPassed == 6) {
            System.out.println("Ok");
        } else {
            System.out.println("Error");
        }
    }
}