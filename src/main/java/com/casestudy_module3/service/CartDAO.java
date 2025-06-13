package com.casestudy_module3.service;

import com.casestudy_module3.model.CartItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO implements ICartDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/luxury";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "123456";

    private static final String INSERT_CART_ITEM_SQL = "INSERT INTO cart (user_id, car_id, car_name, company, price, image_url) VALUES (?, ?, ?, ?, ?, ?);";
    private static final String SELECT_CART_ITEMS_BY_USER = "SELECT id, user_id, car_id, car_name, company, price, image_url FROM cart WHERE user_id = ?;";
    private static final String DELETE_CART_ITEM_SQL = "DELETE FROM cart WHERE id = ?;";
    private static final String DELETE_ALL_CART_ITEMS_SQL = "DELETE FROM cart WHERE user_id = ?;";

    public CartDAO() {
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
    public void addToCart(CartItem cartItem) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CART_ITEM_SQL)) {
            preparedStatement.setInt(1, cartItem.getUserId());
            preparedStatement.setInt(2, cartItem.getCarId());
            preparedStatement.setString(3, cartItem.getCarName());
            preparedStatement.setString(4, cartItem.getCompany());
            preparedStatement.setDouble(5, cartItem.getPrice());
            preparedStatement.setString(6, cartItem.getImageUrl());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            printSQLException(ex);
            throw ex;
        }
    }

    @Override
    public List<CartItem> getCartItems(int userId) throws SQLException {
        List<CartItem> cartItems = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CART_ITEMS_BY_USER)) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int carId = rs.getInt("car_id");
                String carName = rs.getString("car_name");
                String company = rs.getString("company");
                double price = rs.getDouble("price");
                String imageUrl = rs.getString("image_url");
                cartItems.add(new CartItem(id, userId, carId, carName, company, price, imageUrl));
            }
        } catch (SQLException ex) {
            printSQLException(ex);
            throw ex;
        }
        return cartItems;
    }

    @Override
    public void removeFromCart(int cartItemId) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART_ITEM_SQL)) {
            preparedStatement.setInt(1, cartItemId);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            printSQLException(ex);
            throw ex;
        }
    }

    public void clearCart(int userId) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ALL_CART_ITEMS_SQL)) {
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            printSQLException(ex);
            throw ex;
        }
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