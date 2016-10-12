package com.goit.popov.ee07.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;

/**
 * Created by Andrey on 10/9/2016.
 */
public class TestJDBC {

        private static final Logger LOGGER = LoggerFactory.getLogger(TestJDBC.class);
        public static void main(String[] args) {
                loadDriver();
                LOGGER.info("Connecting to database....");
                String url = "jdbc:postgresql://localhost:5432/company";
                String user = "postgres";
                String password = "dT09Rx06";
                try (Connection connection = DriverManager.getConnection(url, user, password);
                        Statement statement = connection.createStatement()){
                        String sql = "SELECT * from employee";
                        ResultSet resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                                System.out.println("id: "+resultSet.getInt("ID"));
                        }
                       LOGGER.info("Connected successfully!");
                } catch (SQLException e) {
                        LOGGER.error("Exception occurred!");
                }
        }

        private static void loadDriver() {
                try {
                        LOGGER.info("...loading jdbc driver");
                        Class.forName("org.postgresql.Driver");
                        LOGGER.info("Successfully loaded!");
                } catch (ClassNotFoundException e) {
                        LOGGER.error("Cannot find driver");
                        throw new RuntimeException(e);
                }
        }
}
