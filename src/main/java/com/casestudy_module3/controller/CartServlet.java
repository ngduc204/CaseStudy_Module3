package com.casestudy_module3.controller;

import com.casestudy_module3.model.CartItem;
import com.casestudy_module3.model.User;
import com.casestudy_module3.service.CartDAO;

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

@WebServlet(urlPatterns = {"/cart", "/add-to-cart", "/remove-from-cart", "/checkout"})
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/cart":
                    showCart(request, response);
                    break;
                default:
                    response.sendRedirect("login");
                    break;
            }
        } catch (Exception ex) {
            log("Error processing GET request", ex);
            request.setAttribute("errorMessage", "An error occurred: " + ex.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/add-to-cart":
                    addToCart(request, response);
                    break;
                case "/remove-from-cart":
                    removeFromCart(request, response);
                    break;
                case "/checkout":
                    checkout(request, response);
                    break;
                default:
                    response.sendRedirect("login");
                    break;
            }
        } catch (Exception ex) {
            log("Error processing POST request", ex);
            request.setAttribute("errorMessage", "An error occurred: " + ex.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }
        User user = (User) session.getAttribute("user");
        List<CartItem> cartItems = cartDAO.getCartItems(user.getId());
        request.setAttribute("cartItems", cartItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }
        User user = (User) session.getAttribute("user");
        int carId = Integer.parseInt(request.getParameter("carId"));
        String carName = request.getParameter("carName");
        String company = request.getParameter("company");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("imageUrl");

        CartItem cartItem = new CartItem(user.getId(), carId, carName, company, price, imageUrl);
        cartDAO.addToCart(cartItem);
        session.setAttribute("successMessage", "Thêm vào giỏ hàng thành công!");
        response.sendRedirect("home");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        cartDAO.removeFromCart(cartItemId);
        response.sendRedirect("cart");
    }

    private void checkout(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }
        User user = (User) session.getAttribute("user");
        cartDAO.clearCart(user.getId());
        session.setAttribute("successMessage", "Thanh toán thành công!");
        response.sendRedirect("cart");
    }
}