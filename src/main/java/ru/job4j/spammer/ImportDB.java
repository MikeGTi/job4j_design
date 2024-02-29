package ru.job4j.spammer;

import ru.job4j.io.ArgsName;

import java.io.*;
import java.sql.*;
import java.util.*;

public class ImportDB {

    private final Properties config;
    private final String dump;

    public ImportDB(Properties config, String dump) {
        this.config = config;
        this.dump = dump;
    }

    public List<User> load() throws IOException, IllegalArgumentException {
        List<User> users = new ArrayList<>();
        int badDataCount = 0;
        int okDataCount = 0;
        try (BufferedReader reader = new BufferedReader(new FileReader(dump))) {
            String line;
            String[] sublines;
            while ((line = reader.readLine()) != null) {
                try {
                    if (line.endsWith(";")) {
                        line = line.substring(0, line.length() - 1);
                    }
                    sublines = validate(line);
                    users.add(new User(sublines[0], sublines[1]));
                    okDataCount++;
                } catch (IllegalArgumentException e) {
                    /* e.printStackTrace();*/
                    badDataCount++;
                }
            }
        }
        System.out.printf("row: %s, bad row: %s%n", okDataCount, badDataCount);
        return users;
    }

    private String[] validate(String data) throws IllegalArgumentException {
        if (data.length() == 0) {
            throw new IllegalArgumentException("User not found");
        }
        String[] sublines = data.split(";", 2);
        if (sublines[0].isBlank()) {
            throw new IllegalArgumentException("User name not found");
        }
        if (sublines[1].isBlank()) {
            throw new IllegalArgumentException("User e-mail not found");
        }
        return sublines;
    }

    public void save(List<User> users) throws ClassNotFoundException, SQLException {
        Class.forName(config.getProperty("jdbc.driver"));
        try (Connection connection = DriverManager.getConnection(
                config.getProperty("jdbc.url"),
                config.getProperty("jdbc.login"),
                config.getProperty("jdbc.password")
        )) {
            for (User user : users) {
                try (PreparedStatement preparedStatement =
                             connection.prepareStatement("INSERT INTO users(name, e_mail) VALUES (?, ?)")) {
                    preparedStatement.setString(1, user.name);
                    preparedStatement.setString(2, user.email);
                    preparedStatement.execute();
                }
            }
        }
    }

    private static class User {
        String name;
        String email;

        public User(String name, String email) {
            this.name = name;
            this.email = email;
        }
    }

    public static void main(String[] args) throws Exception {
        /* program arguments
        *  -p=app.properties
        *  -f=./src/data/dump.txt
        */
        ArgsName argsName = ArgsName.of(args);
        Properties config = new Properties();
        try (InputStream input = ImportDB.class.getClassLoader().getResourceAsStream(argsName.get("p"))) {
            config.load(input);
        }
        ImportDB dataBase = new ImportDB(config, argsName.get("f"));
        dataBase.save(dataBase.load());
    }
}