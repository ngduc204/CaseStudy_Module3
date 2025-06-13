package com.casestudy_module3.model;

public class CartItem {
    private int id;
    private int userId;
    private int carId;
    private String carName;
    private String company;
    private double price;
    private String imageUrl;

    public CartItem() {
    }

    public CartItem(int userId, int carId, String carName, String company, double price, String imageUrl) {
        this.userId = userId;
        this.carId = carId;
        this.carName = carName;
        this.company = company;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    public CartItem(int id, int userId, int carId, String carName, String company, double price, String imageUrl) {
        this.id = id;
        this.userId = userId;
        this.carId = carId;
        this.carName = carName;
        this.company = company;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}