package ru.job4j.jdbc;

import ru.job4j.service.Settings;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.StringJoiner;

public class StatementDemo {

    private static Connection getConnection() throws ClassNotFoundException, SQLException, IOException {
        Settings settings = new Settings();
        ClassLoader classLoader = Settings.class.getClassLoader();
        try (InputStream io = classLoader.getResourceAsStream("app.properties")) {
            settings.load(io);
        }
        Class.forName(settings.getValue("driver"));
        String url = settings.getValue("url");
        String login = settings.getValue("login");
        String password = settings.getValue("password");
        return DriverManager.getConnection(url, login, password);
    }

    public static void main(String[] args) throws Exception {
        try (Connection connection = getConnection()) {
            try (Statement statement = connection.createStatement()) {
                String sql = String.format(
                        "CREATE TABLE IF NOT EXISTS demo_table(%s, %s);",
                        "id SERIAL PRIMARY KEY",
                        "name TEXT"
                );
                statement.execute(sql);
                System.out.println(getTableScheme(connection, "demo_table"));
            }
        }
    }

    public static String getTableScheme(Connection connection, String tableName) throws Exception {
        var rowSeparator = "-".repeat(30).concat(System.lineSeparator());
        var header = String.format("%-15s|%-15s%n", "NAME", "TYPE");
        var buffer = new StringJoiner(rowSeparator, rowSeparator, rowSeparator);
        buffer.add(header);
        try (var statement = connection.createStatement()) {
            var selection = statement.executeQuery(String.format(
                    "SELECT * FROM %s LIMIT 1", tableName
            ));
            var metaData = selection.getMetaData();
            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                buffer.add(String.format("%-15s|%-15s%n",
                        metaData.getColumnName(i), metaData.getColumnTypeName(i))
                );
            }
        }
        return buffer.toString();
    }

}