package ru.job4j.jdbc;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class PreparedStatementDemo {

    private Connection connection;

    private final Properties properties;

    public PreparedStatementDemo(Properties properties) throws Exception {
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

    public City insert(City city) {
        try (PreparedStatement statement =
                     connection.prepareStatement("INSERT INTO cities(name, population) VALUES (?, ?)",
                             Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, city.getName());
            statement.setInt(2, city.getPopulation());
            statement.execute();
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    city.setId(generatedKeys.getInt(1));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return city;
    }

    public boolean update(City city) {
        boolean result = false;
        try (PreparedStatement statement =
                     connection.prepareStatement("UPDATE cities SET name = ?, population = ? WHERE id = ?")) {
            statement.setString(1, city.getName());
            statement.setInt(2, city.getPopulation());
            statement.setInt(3, city.getId());
            result = statement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public void delete(int id) {
        try (PreparedStatement statement =
                     connection.prepareStatement("DELETE FROM cities WHERE id = ?")) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<City> findAll() {
        List<City> cities = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM cities")) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    cities.add(new City(
                            resultSet.getInt("id"),
                            resultSet.getString("name"),
                            resultSet.getInt("population")
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cities;
    }

    public static void main(String[] args) throws Exception {
        Properties appProperties = new Properties();
        try (InputStream in = PreparedStatementDemo.class.getClassLoader().getResourceAsStream("app.properties")) {
            appProperties.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }

        PreparedStatementDemo preparedStatementDemo = new PreparedStatementDemo(appProperties);

        City ufaCity = new City(1, "Ufa", 1000000);

        preparedStatementDemo.insert(ufaCity);
        preparedStatementDemo.insert(new City(2, "Tokyo", 37500000));
        preparedStatementDemo.insert(new City(3, "Delhi", 29400000));
        preparedStatementDemo.insert(new City(4, "Shanghai", 26400000));

        preparedStatementDemo.findAll().forEach(System.out::println);

        ufaCity.setPopulation(1100000);
        preparedStatementDemo.update(ufaCity);

        List<City> cities = preparedStatementDemo.findAll();
        cities.forEach(System.out::println);

        cities.forEach(c -> preparedStatementDemo.delete(c.getId()));

        preparedStatementDemo.findAll().forEach(System.out::println);
    }

}