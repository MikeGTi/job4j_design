package ru.job4j.io;

import org.junit.jupiter.api.Test;
import java.util.List;

import static org.assertj.core.api.Assertions.*;

class AnalysisTest {

    @Test
    void getDowntimeOnePeriod() {
        Analysis analysis = new Analysis();
        String[] list = {"200 10:56:01", "500 10:57:01", "400 10:58:01", "500 10:59:01", "400 11:01:02", "300 11:02:02"};
        assertThat(analysis.getDowntime(list)).isEqualTo(List.of("10:57:01;11:02:02;"));
    }

    @Test
    void getDowntimeTwoPeriods() {
        Analysis analysis = new Analysis();
        String[] list = {"200 10:56:01", "500 10:57:01", "400 10:58:01", "300 10:59:01", "500 11:01:02", "200 11:02:02"};
        assertThat(analysis.getDowntime(list)).isEqualTo(List.of("10:57:01;10:59:01;11:01:02;11:02:02;"));
    }

    @Test
    void getDowntimeManyPeriods() {
        Analysis analysis = new Analysis();
        String[] list = {"200 10:56:01", "500 10:57:01", "200 10:57:41", "400 10:58:01", "200 10:58:41", "500 10:59:01", "300 10:59:41", "400 11:01:02", "300 11:02:02"};
        assertThat(analysis.getDowntime(list)).isEqualTo(List.of("10:57:01;10:57:41;10:58:01;10:58:41;10:59:01;10:59:41;11:01:02;11:02:02;"));
    }
}