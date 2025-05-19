package com.casestudy_module3.service;

import com.casestudy_module3.model.Car;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDAO implements ICarDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/luxury?useSSL=false&serverTimezone=UTC";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "123456";

    private static final String INSERT_CAR_SQL = "INSERT INTO car (name, company, imageUrl, price) VALUES (?, ?, ?, ?);";
    private static final String SELECT_CAR_BY_ID = "SELECT id, name, company, imageUrl, price FROM car WHERE id = ?";
    private static final String SELECT_ALL_CAR = "SELECT * FROM car";
    private static final String DELETE_CAR_SQL = "DELETE FROM car WHERE id = ?;";
    private static final String UPDATE_CAR_SQL = "UPDATE car SET name = ?, company = ?, imageUrl = ?, price = ? WHERE id = ?;";

    public CarDAO() {
    }

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver not found", e);
        }
    }

    @Override
    public void insertCar(Car car) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CAR_SQL)) {
            preparedStatement.setString(1, car.getName());
            preparedStatement.setString(2, car.getCompany());
            preparedStatement.setString(3, car.getImageUrl());
            preparedStatement.setDouble(4, car.getPrice());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            printSQLException(ex);
            throw ex;
        }
    }

    @Override
    public Car selectCar(int id) throws SQLException {
        Car car = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAR_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String company = rs.getString("company");
                String imageUrl = rs.getString("imageUrl");
                double price = rs.getDouble("price");
                car = new Car(id, name, company, imageUrl, price);
            }
        } catch (SQLException ex) {
            printSQLException(ex);
            throw ex;
        }
        return car;
    }

    @Override
    public List<Car> selectAllCar() throws SQLException {
        List<Car> cars = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CAR);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String company = resultSet.getString("company");
                String imageUrl = resultSet.getString("imageUrl");
                double price = resultSet.getDouble("price");
                cars.add(new Car(id, name, company, imageUrl, price));
            }
        } catch (SQLException ex) {
            printSQLException(ex);
            throw ex;
        }
        return cars;
    }

    @Override
    public boolean updateCar(Car car) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CAR_SQL)) {
            statement.setString(1, car.getName());
            statement.setString(2, car.getCompany());
            statement.setString(3, car.getImageUrl());
            statement.setDouble(4, car.getPrice());
            statement.setInt(5, car.getId());
            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            printSQLException(ex);
            throw ex;
        }
        return rowUpdated;
    }

    @Override
    public boolean deleteCar(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CAR_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            printSQLException(ex);
            throw ex;
        }
        return rowDeleted;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}