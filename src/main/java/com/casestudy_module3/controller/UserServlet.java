package com.casestudy_module3.controller;

import com.casestudy_module3.model.User;
import com.casestudy_module3.service.UserDAO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/login", "/register", "/logout"})
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/login":
                    showLoginForm(request, response);
                    break;
                case "/register":
                    showRegisterForm(request, response);
                    break;
                case "/logout":
                    logoutUser(request, response);
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
                case "/login":
                    loginUser(request, response);
                    break;
                case "/register":
                    registerUser(request, response);
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

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Username and password are required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        User user = userDAO.loginUser(username, password);
        if (user == null) {
            request.setAttribute("errorMessage", "Invalid username or password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            if ("admin".equals(user.getRole())) {
                response.sendRedirect("car");
            } else {
                response.sendRedirect("home");
            }
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty() || role == null) {
            request.setAttribute("errorMessage", "All fields are required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt()); //Mã hóa mk
            User user = new User(username, hashedPassword, role);
            userDAO.registerUser(user);
            response.sendRedirect("login");
        } catch (SQLException ex) {
            request.setAttribute("errorMessage", "Username already exists.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login");
    }
}