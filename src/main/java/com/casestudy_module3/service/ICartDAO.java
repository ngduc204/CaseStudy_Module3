package com.casestudy_module3.service;

import com.casestudy_module3.model.CartItem;
import java.sql.SQLException;
import java.util.List;

public interface ICartDAO {
    void addToCart(CartItem cartItem) throws SQLException;
    List<CartItem> getCartItems(int userId) throws SQLException;
    void removeFromCart(int cartItemId) throws SQLException;
    void clearCart(int userId) throws SQLException;
}