package ru.job4j.iterator;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Balancer {
    public static void split(List<ArrayList<Integer>> nodes, Iterator<Integer> source) {

        Integer item;
        int nodeIndex = 0;
        ArrayList<Integer> node;

        while (source.hasNext()) {
            item = source.next();
            node = nodes.get(nodeIndex);

            if (item != null) {
                node.add(item);
                nodeIndex++;
                if (nodeIndex == nodes.size()) {
                    nodeIndex = 0;
                }
            }
        }
    }
}
