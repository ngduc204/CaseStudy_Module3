package com.casestudy_module3.model;

public class Car {
    private int id;
    private String name;
    private String company;
    private String imageUrl;
    private double price;

    public Car() {
    }

    public Car(String name, String company, String imageUrl, double price) {
        this.name = name;
        this.company = company;
        this.imageUrl = imageUrl;
        this.price = price;
    }

    public Car(int id, String name, String company, String imageUrl, double price) {
        this.id = id;
        this.name = name;
        this.company = company;
        this.imageUrl = imageUrl;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", company='" + company + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", price=" + price +
                '}';
    }
}