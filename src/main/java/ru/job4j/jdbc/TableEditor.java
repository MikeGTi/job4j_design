package ru.job4j.jdbc;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.StringJoiner;

public class TableEditor implements AutoCloseable {

    private Connection connection;

    private final Properties properties;

    public TableEditor(Properties properties) throws SQLException, ClassNotFoundException {
        this.properties = properties;
        initConnection();
    }

    private void initConnection() throws SQLException, ClassNotFoundException {
        Class.forName(properties.getProperty("driver"));
        String url = properties.getProperty("url");
        String login = properties.getProperty("login");
        String password = properties.getProperty("password");
        connection = DriverManager.getConnection(url, login, password);
    }

    public void createTable(String tableName) throws SQLException {
        try (Statement statement = connection.createStatement()) {
            String sql = String.format("CREATE TABLE IF NOT EXISTS %s ();", tableName);
            statement.executeUpdate(sql);
            System.out.println(getTableScheme(tableName));
        }
    }

    public void dropTable(String tableName) throws SQLException {
        try (Statement statement = connection.createStatement()) {
            String sql = String.format("DROP TABLE IF EXISTS %s;", tableName);
            statement.executeUpdate(sql);
        }
    }

    public void addColumn(String tableName, String columnName, String type) throws SQLException {
        try (Statement statement = connection.createStatement()) {
            String sql = String.format("ALTER TABLE %s ADD COLUMN IF NOT EXISTS %s %s;", tableName, columnName, type);
            statement.executeUpdate(sql);
        }
    }

    public void dropColumn(String tableName, String columnName) throws SQLException {
        try (Statement statement = connection.createStatement()) {
            String sql = String.format("ALTER TABLE %s DROP COLUMN IF EXISTS %s;", tableName, columnName);
            statement.executeUpdate(sql);
        }
    }

    public void renameColumn(String tableName, String columnName, String newColumnName) throws SQLException {
        try (Statement statement = connection.createStatement()) {
            String sql = String.format("ALTER TABLE %s RENAME COLUMN %s TO %s;", tableName, columnName, newColumnName);
            statement.executeUpdate(sql);
        }
    }

    public String getTableScheme(String tableName) throws SQLException {
        var rowSeparator = "-".repeat(30).concat(System.lineSeparator());
        var header = String.format("%-15s|%-15s%n", "NAME", "TYPE");
        var buffer = new StringJoiner(rowSeparator, rowSeparator, rowSeparator);
        buffer.add(header);
        try (var statement = connection.createStatement()) {
            var selection = statement.executeQuery(String.format("SELECT * FROM %s LIMIT 1", tableName));
            var metaData = selection.getMetaData();
            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                buffer.add(String.format("%-15s|%-15s%n",
                        metaData.getColumnName(i), metaData.getColumnTypeName(i))
                );
            }
        }
        return buffer.toString();
    }

    @Override
    public void close() throws Exception {
        if (connection != null) {
            connection.close();
        }
    }

    public static void main(String[] args) throws Exception {
        Properties appProperties = new Properties();
        try (InputStream in = TableEditor.class.getClassLoader().getResourceAsStream("app.properties")) {
            appProperties.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }

        try (TableEditor tableEditor = new TableEditor(appProperties)) {
            final String testTableName = "test1_table";

            tableEditor.createTable(testTableName);
            System.out.println(tableEditor.getTableScheme(testTableName));

            tableEditor.addColumn(testTableName, "test1_column", "integer");
            System.out.println(tableEditor.getTableScheme(testTableName));

            tableEditor.addColumn(testTableName, "test2_column", "varchar(255)");
            System.out.println(tableEditor.getTableScheme(testTableName));

            tableEditor.renameColumn(testTableName, "test1_column", "test1_column_renamed");
            System.out.println(tableEditor.getTableScheme(testTableName));

            tableEditor.renameColumn(testTableName, "test2_column", "test2_column_renamed");
            System.out.println(tableEditor.getTableScheme(testTableName));

            tableEditor.dropColumn(testTableName, "test1_column_renamed");
            System.out.println(tableEditor.getTableScheme(testTableName));

            tableEditor.dropColumn(testTableName, "test2_column_renamed");
            System.out.println(tableEditor.getTableScheme(testTableName));

            tableEditor.dropTable(testTableName);
        }
    }
}