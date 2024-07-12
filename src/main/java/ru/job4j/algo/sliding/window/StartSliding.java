package ru.job4j.algo.sliding.window;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StartSliding {
    public static int[] findMaxOverlapInterval(List<Interval> intervals) {
        if (intervals.size() == 0) {
            return new int[]{-1, -1};
        } else if (intervals.size() == 1) {
            return new int[]{intervals.get(0).start, intervals.get(0).end};
        }

        Event[] events = collectEvents(intervals);
        Arrays.sort(events, Event::compareTo);

        return getMaxIntersectionsCount(events);
    }

    /**
     * Метод выполняет обход массива событий и подсчитывает пересечение по времени
     * @param events отсортированный по времени массив
     * @return массив с минимальным диапазоном, с наибольшим количеством пересечений,
     *         если пересечений нет, возвращает int[-1, -1]
     */
    private static int[] getMaxIntersectionsCount(Event[] events) {
        int start = events[0].time;
        int end = events[events.length - 1].time;
        int intersCount;
        int maxInters = 0;
        int minSize = 1000;
        int[] rsl = new int[]{-1, -1};
        for (int i = start; i < end; i++) {
            if (events[i].isStart) {
                start = events[i].time;
                end = 0;
                intersCount = 0;
                for (int j = i + 1; j < events[events.length - 1].time; j++) {
                    if (!events[j].isStart && events[j].time > start) {
                        end = events[j].time;
                        break;
                    }
                    intersCount++;
                }
                if (maxInters <= intersCount && minSize >= end - start) {
                    maxInters = intersCount;
                    minSize = end - start;
                    rsl[0] = start;
                    rsl[1] = end;
                }
            }
        }
        return rsl;
    }

    /**
     * Метод выполняет обход массива интервалов и преобразует их в события начала и конца интервала
     * @param intervals массив объектов Interval
     * @return не отсортированный массив событий
     */
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
        System.out.printf("Minimal size interval that overlaps the maximum number of intervals: [%s, %s]%n", result[0], result[1]);
    }
}
