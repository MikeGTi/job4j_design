package ru.job4j.algo.greedy;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.*;

class GasStationTest {
    @Test
    void whenThan3() {
        GasStation gasStation = new GasStation();
        int[] gas = {1, 2, 3, 4, 5};
        int[] cost = {3, 4, 5, 1, 2};
        int result = gasStation.canCompleteCircuit(gas, cost);
        assertThat(result).isEqualTo(3);
    }

    @Test
    void whenNonResultThanMinusOne() {
        GasStation gasStation = new GasStation();
        int[] gas = {2, 3, 4};
        int[] cost = {3, 4, 3};
        int result = gasStation.canCompleteCircuit(gas, cost);
        assertThat(result).isEqualTo(-1);
    }

    @Test
    void whenThan4() {
        GasStation gasStation = new GasStation();
        int[] gas = {5, 1, 2, 3, 4};
        int[] cost = {4, 4, 1, 5, 1};
        int result = gasStation.canCompleteCircuit(gas, cost);
        assertThat(result).isEqualTo(4);
    }

    @Test
    void whenThan0() {
        GasStation gasStation = new GasStation();
        int[] gas = {3, 1, 1};
        int[] cost = {1, 2, 2};
        int result = gasStation.canCompleteCircuit(gas, cost);
        assertThat(result).isEqualTo(0);
    }
}