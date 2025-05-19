package com.casestudy_module3.controller;

import com.casestudy_module3.model.Car;
import com.casestudy_module3.model.User;
import com.casestudy_module3.service.CarDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/car", "/showCars"})
public class CarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CarDAO carDAO;

    @Override
    public void init() {
        carDAO = new CarDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;
        if (user == null || !"admin".equals(user.getRole())) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "";
        try {
            switch (action) {
                case "create":
                    insertCar(request, response);
                    break;
                case "update":
                    updateCar(request, response);
                    break;
                default:
                    listCars(request, response);
                    break;
            }
        } catch (Exception ex) {
            log("Error processing POST request", ex);
            request.setAttribute("errorMessage", "An error occurred: " + ex.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;
        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "";
        try {
            switch (action) {
                case "create":
                    if (!"admin".equals(user.getRole())) {
                        response.sendRedirect("showCars");
                        return;
                    }
                    showNewForm(request, response);
                    break;
                case "update":
                    if (!"admin".equals(user.getRole())) {
                        response.sendRedirect("showCars");
                        return;
                    }
                    showUpdateForm(request, response);
                    break;
                case "delete":
                    if (!"admin".equals(user.getRole())) {
                        response.sendRedirect("showCars");
                        return;
                    }
                    deleteCar(request, response);
                    break;
                default:
                    listCars(request, response);
                    break;
            }
        } catch (Exception ex) {
            log("Error processing GET request", ex);
            request.setAttribute("errorMessage", "An error occurred: " + ex.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void listCars(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;
        List<Car> listCars = carDAO.selectAllCar();
        request.setAttribute("listCars", listCars);
        if ("admin".equals(user.getRole())) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/list.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/showCars.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void insertCar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String company = request.getParameter("company");
        String imageUrl = request.getParameter("imageUrl");
        String priceStr = request.getParameter("price");

        if (name == null || name.trim().isEmpty() || company == null || company.trim().isEmpty() ||
                imageUrl == null || imageUrl.trim().isEmpty() || priceStr == null || priceStr.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/create.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            double price = Double.parseDouble(priceStr);
            Car newCar = new Car(name, company, imageUrl, price);
            carDAO.insertCar(newCar);
            response.sendRedirect("car");
        } catch (NumberFormatException ex) {
            request.setAttribute("errorMessage", "Invalid price format.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/create.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Car existingCar = carDAO.selectCar(id);
            if (existingCar == null) {
                request.setAttribute("errorMessage", "Car not found.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("admin/error.jsp");
                dispatcher.forward(request, response);
                return;
            }
            request.setAttribute("car", existingCar);
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/update.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException ex) {
            request.setAttribute("errorMessage", "Invalid car ID.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void updateCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String company = request.getParameter("company");
        String imageUrl = request.getParameter("imageUrl");
        String priceStr = request.getParameter("price");

        if (idStr == null || name == null || name.trim().isEmpty() || company == null || company.trim().isEmpty() ||
                imageUrl == null || imageUrl.trim().isEmpty() || priceStr == null || priceStr.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/update.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            double price = Double.parseDouble(priceStr);
            Car car = new Car(id, name, company, imageUrl, price);
            boolean updated = carDAO.updateCar(car);
            if (!updated) {
                request.setAttribute("errorMessage", "Failed to update car.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("admin/update.jsp");
                dispatcher.forward(request, response);
                return;
            }
            response.sendRedirect("car");
        } catch (NumberFormatException ex) {
            request.setAttribute("errorMessage", "Invalid ID or price format.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/update.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void deleteCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean deleted = carDAO.deleteCar(id);
            if (!deleted) {
                request.setAttribute("errorMessage", "Failed to delete car.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("admin/error.jsp");
                dispatcher.forward(request, response);
                return;
            }
            response.sendRedirect("car");
        } catch (NumberFormatException ex) {
            request.setAttribute("errorMessage", "Invalid car ID.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}