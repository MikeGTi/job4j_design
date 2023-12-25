package ru.job4j.io;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.*;

class AnalysisTest {

    @Test
    void getDowntimeOnePeriod() {
        Analysis analysis = new Analysis();
        analysis.unavailable("data/io/server_availability_analysis/test1_server.log", "data/io/server_availability_analysis/test1_target.csv");
        /*assertThat(analysis.getUnavailable()).isEqualTo("10:57:01;11:02:02;\n");
         * recode on file
         */
    }

    @Test
    void getDowntimeTwoPeriods() {
        Analysis analysis = new Analysis();
        analysis.unavailable("data/io/server_availability_analysis/test2_server.log", "data/io/server_availability_analysis/test2_target.csv");
        /*assertThat(analysis.getUnavailable()).isEqualTo("10:57:01;10:59:01;\n11:01:02;11:02:02;\n");
        * recode on file
        */
    }

    @Test
    void getDowntimeManyPeriods() {
        Analysis analysis = new Analysis();
        analysis.unavailable("data/io/server_availability_analysis/test3_server.log", "data/io/server_availability_analysis/test3_target.csv");
        /*assertThat(analysis.getUnavailable()).isEqualTo("10:57:01;10:57:41;\n10:58:01;10:58:41;\n10:59:01;10:59:41;\n11:01:02;11:02:02;\n");
        * recode on file
         */
    }
}