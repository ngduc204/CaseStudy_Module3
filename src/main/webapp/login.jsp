<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - Luxury Car Sale</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background-color: #f8f9fa;
    }
    .navbar {
      background-color: #343a40;
      z-index: 10;
      position: relative;
    }
    .navbar-brand, .nav-link {
      color: #ffffff !important;
    }
    .form-container {
      background-color: #ffffff;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
      max-width: 500px;
      margin: 50px auto;
    }
    .form-group label {
      font-weight: 500;
    }
    .btn-primary {
      width: 100%;
      border-radius: 5px;
      padding: 10px;
      font-size: 1.1rem;
    }
    .caption {
      font-size: 1.8rem;
      font-weight: 600;
      color: #343a40;
      text-align: center;
      margin-bottom: 20px;
    }
    .alert {
      margin-bottom: 20px;
    }
    .footer {
      background-color: #343a40;
      color: white;
      padding: 20px 0;
      text-align: center;
      position: fixed;
      bottom: 0;
      width: 100%;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
  <a class="navbar-brand" href="#">Luxury Car Sale</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="register">Register</a>
      </li>
    </ul>
  </div>
</nav>

<div class="form-container">
  <div class="caption">Login</div>
  <c:if test="${not empty errorMessage}">
    <div class="alert alert-danger">${errorMessage}</div>
  </c:if>
  <form method="post" action="login">
    <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" class="form-control" name="username" id="username" placeholder="Enter username" required>
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" class="form-control" name="password" id="password" placeholder="Enter password" required>
    </div>
    <div class="text-center">
      <input type="submit" class="btn btn-primary" value="Login">
    </div>
  </form>
  <div class="text-center mt-3">
    <a href="register">Don't have an account? Register here</a>
  </div>
</div>

<div class="footer">
  <p>© 2025 Luxury Car Sale. All Rights Reserved.</p>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>