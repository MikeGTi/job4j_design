package ru.job4j.service;

import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.*;

import java.io.InputStream;

class SettingsTest {
    @Test
    public void whenKeyDriverThenValueOrgPostgresqlDriver() throws Exception {
        Settings settings = new Settings();
        ClassLoader classLoader = Settings.class.getClassLoader();
        try (InputStream io = classLoader.getResourceAsStream("app.properties")) {
            settings.load(io);
        }
        String value = settings.getValue("driver");
        assertThat(value).isEqualTo("org.postgresql.Driver");
    }

    @Test
    public void whenKeyUrlThenValueDbUrl() throws Exception {
        Settings settings = new Settings();
        ClassLoader classLoader = Settings.class.getClassLoader();
        try (InputStream io = classLoader.getResourceAsStream("app.properties")) {
            settings.load(io);
        }
        String value = settings.getValue("url");
        assertThat(value).isEqualTo("jdbc:postgresql://localhost:5432/jdbc_tasks_db");
    }

    @Test
    public void whenKeyLoginThenValueUserLogin() throws Exception {
        Settings settings = new Settings();
        ClassLoader classLoader = Settings.class.getClassLoader();
        try (InputStream io = classLoader.getResourceAsStream("app.properties")) {
            settings.load(io);
        }
        String value = settings.getValue("login");
        assertThat(value).isEqualTo("postgres");
    }

    @Test
    public void whenKeyUserThenValueUserLogin() throws Exception {
        Settings settings = new Settings();
        ClassLoader classLoader = Settings.class.getClassLoader();
        try (InputStream io = classLoader.getResourceAsStream("app.properties")) {
            settings.load(io);
        }
        String value = settings.getValue("user");
        assertThat(value).isNull();
    }

}