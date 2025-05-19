package com.casestudy_module3.service;

import com.casestudy_module3.model.Car;

import java.sql.SQLException;
import java.util.List;

public interface ICarDAO {
    void insertCar(Car car) throws SQLException;

    Car selectCar(int id) throws SQLException;

    List<Car> selectAllCar() throws SQLException;

    boolean updateCar(Car car) throws SQLException;

    boolean deleteCar(int id) throws SQLException;
}