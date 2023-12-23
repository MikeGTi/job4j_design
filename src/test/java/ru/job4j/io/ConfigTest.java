package ru.job4j.io;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.*;

class ConfigTest {
    @Test
    void whenCommentRightPairAndEqualSignMoreThanOne() {
        String path = "./data/test1_config.properties";
        Config config = new Config(path);
        config.load();
        assertThat(config.value("# test comment")).isEqualTo("");
        assertThat(config.value("test1key")).isEqualTo("test1value");
        assertThat(config.value("test2key")).isEqualTo("test2value");
        assertThat(config.value("test3key")).isEqualTo("test3value");
        assertThat(config.value("test4key")).isEqualTo("test4value=");
    }

    @Test
    void checkEmptyKey() {
        String path = "./data/test2_config.properties";
        Config config = new Config(path);
        assertThatThrownBy(config::load)
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("this line: '=test2value' does not contain a key");
    }

    @Test
    void checkEmptyValue() {
        String path = "./data/test3_config.properties";
        Config config = new Config(path);
        assertThatThrownBy(config::load)
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("this line: 'test3key=' does not contain a value");
    }

    @Test
    void checkEmptyKeyValue() {
        String path = "./data/test4_config.properties";
        Config config = new Config(path);
        assertThatThrownBy(config::load)
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("this line: '=' does not contain key, value");
    }

    @Test
    void checkEmptyFile() {
        String path = "./data/test5_config.properties";
        Config config = new Config(path);
        assertThatThrownBy(config::load)
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("file is empty");
    }

    @Test
    void checkWithoutEqualSign() {
        String path = "./data/test6_config.properties";
        Config config = new Config(path);
        assertThatThrownBy(config::load)
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("this line: 'test1Key test1Value' does not contain the symbol '='");
    }
}