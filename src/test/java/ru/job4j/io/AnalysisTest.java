package ru.job4j.io;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.io.*;
import java.nio.file.Path;

import static org.assertj.core.api.Assertions.*;

class AnalysisTest {

    @Test
    void getDowntimeOnePeriod(@TempDir Path tempDir) throws IOException {
        File target  = tempDir.resolve("test1_target.txt").toFile();
        Analysis analysis = new Analysis();
        analysis.unavailable("./src/data/io/server_availability_analysis/test1_server.log", target.getAbsolutePath());
        StringBuilder result = new StringBuilder();
        try (BufferedReader input = new BufferedReader(new FileReader(target))) {
            input.lines().forEach(result::append);
        }
        assertThat("10:57:01;11:02:02;").hasToString(result.toString());
    }

    @Test
    void getDowntimeTwoPeriods(@TempDir Path tempDir) throws IOException {
        File target  = tempDir.resolve("test2_target.txt").toFile();
        Analysis analysis = new Analysis();
        analysis.unavailable("./src/data/io/server_availability_analysis/test2_server.log", target.getAbsolutePath());
        StringBuilder result = new StringBuilder();
        try (BufferedReader input = new BufferedReader(new FileReader(target))) {
            input.lines().forEach(result::append);
        }
        assertThat("10:57:01;10:59:01;11:01:02;11:02:02;").hasToString(result.toString());
    }

    @Test
    void getDowntimeManyPeriods(@TempDir Path tempDir) throws IOException {
        File target  = tempDir.resolve("test3_target.txt").toFile();
        Analysis analysis = new Analysis();
        analysis.unavailable("./src/data/io/server_availability_analysis/test3_server.log", target.getAbsolutePath());
        StringBuilder result = new StringBuilder();
        try (BufferedReader input = new BufferedReader(new FileReader(target))) {
            input.lines().forEach(result::append);
        }
        assertThat("10:57:01;10:57:41;10:58:01;10:58:41;10:59:01;10:59:41;11:01:02;11:02:02;").hasToString(result.toString());
    }

    @Test
    void getDowntimeOneBigPeriod(@TempDir Path tempDir) throws IOException {
        File target  = tempDir.resolve("test4_target.txt").toFile();
        Analysis analysis = new Analysis();
        analysis.unavailable("./src/data/io/server_availability_analysis/test4_server.log", target.getAbsolutePath());
        StringBuilder result = new StringBuilder();
        try (BufferedReader input = new BufferedReader(new FileReader(target))) {
            input.lines().forEach(result::append);
        }
        assertThat("10:57:01;11:02:02;").hasToString(result.toString());
    }
}