package com.casestudy_module3.service;

import com.casestudy_module3.model.User;

import java.sql.SQLException;

public interface IUserDAO {
    void registerUser(User user) throws SQLException;
    User loginUser(String username, String password) throws SQLException;
}