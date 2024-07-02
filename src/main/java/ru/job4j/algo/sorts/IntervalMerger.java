package ru.job4j.algo.sorts;

import java.util.Arrays;
import java.util.Stack;

class IntervalMerger {
    public int[][] merge(int[][] intervals) {
        Interval[] intervalsArr = collectIntervalsObj(intervals);
        Arrays.sort(intervalsArr, Interval::compareTo);

        Stack<Interval> stack = new Stack<>();
        stack.push(intervalsArr[0]);
        for (int i = 1; i < intervalsArr.length; i++) {
            Interval top = stack.peek();
            if (top.end < intervalsArr[i].start) {
                stack.push(intervalsArr[i]);
            } else if (top.end < intervalsArr[i].end) {
                top.end = intervalsArr[i].end;
                stack.pop();
                stack.push(top);
            }
        }
        return getIntervals(stack);
    }

    private int[][] getIntervals(Stack<Interval> stack) {
        int[][] rsl = new int[stack.size()][2];
        for (int i = stack.size() - 1; i >= 0; i--) {
            Interval top = stack.pop();
            rsl[i][0] = top.start;
            rsl[i][1] = top.end;
        }
        return rsl;
    }

    private Interval[] collectIntervalsObj(int[][] intervals) {
        Interval[] rsl = new Interval[intervals.length];
        for (int i = 0; i < intervals.length; i++) {
            rsl[i] = new Interval(intervals[i][0], intervals[i][1]);
        }
        return rsl;
    }

    static class Interval implements Comparable<Interval> {
        int start;
        int end;

        public Interval(int start, int end) {
            this.start = start;
            this.end = end;
        }

        @Override
        public int compareTo(Interval o) {
            return this.start - o.start;
        }
    }
}
