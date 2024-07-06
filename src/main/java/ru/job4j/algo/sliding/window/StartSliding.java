package ru.job4j.algo.sliding.window;

import java.util.*;

public class StartSliding {
    public static int[] findMaxOverlapInterval(List<Interval> intervals) {
        if (intervals.size() == 0) {
            return new int[]{-1, -1};
        } else if (intervals.size() == 1) {
            return new int[]{intervals.get(0).start, intervals.get(0).end};
        }

        Event[] events = collectEvents(intervals);
        Arrays.sort(events, Event::compareTo);

        HashMap<Interval, Integer> countMap = new HashMap<>();
        int started = events[0].time;
        int ends = events[events.length - 1].time;
        int intersCount = 0;
        for (int i = started; i < ends; i++) {
            if (events[i].isStart) {
                started = events[i].time;
                for (int j = started - 1; j < events.length; j++) {
                    intersCount++;
                    if (!events[j].isStart && events[j].time > started) {
                        ends = events[j].time;
                        break;
                    }
                }
                countMap.putIfAbsent(new Interval(started, ends), intersCount);
                intersCount = 0;
            }
        }

        int[] rsl = new int[]{-1, -1};
        int maxCount = 0;
        for (Map.Entry<Interval, Integer> entry : countMap.entrySet()) {
            if (maxCount <= entry.getValue()) {
                maxCount = entry.getValue();
                rsl[0] = entry.getKey().start;
                rsl[1] = entry.getKey().end;
            }
        }
        return rsl;
    }

    private static Event[] collectEvents(List<Interval> intervals) {
        Event[] events = new Event[intervals.size() * 2];
        int j = 0;
        for (int i = 0; i < events.length; i = i + 2) {
            Event eventStart = new Event(intervals.get(j).start, true);
            Event eventEnd = new Event(intervals.get(j++).end, false);
            events[i] = eventStart;
            events[i + 1] = eventEnd;
        }
        return events;
    }

    public static void main(String[] args) {
        List<Interval> intervals = new ArrayList<>();
        intervals.add(new Interval(1, 4));
        intervals.add(new Interval(2, 6));
        intervals.add(new Interval(3, 5));
        intervals.add(new Interval(7, 8));

        int[] result = findMaxOverlapInterval(intervals);
        System.out.printf("Interval that overlaps the maximum number of intervals: [%s, %s%n]", result[0], result[1]);
    }
}
