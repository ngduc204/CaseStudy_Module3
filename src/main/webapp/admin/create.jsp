<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.user or sessionScope.user.role != 'admin'}">
    <c:redirect url="/login"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Management Application</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <style>
        body {
            background: linear-gradient(to right, #ffffff, #f2f2f2);
            font-family: 'Roboto', sans-serif;
        }
        h1, h2 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .nav-link {
            color: #ffffff !important;
        }
        .form-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            margin: 30px auto;
        }
        .form-group label {
            font-weight: 500;
        }
        .btn-primary, .btn-success {
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
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #777;
        }
        .alert {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">Car Management</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/car">List All Cars</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<div class="form-container">
    <div class="caption">Add New Car</div>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    <form method="post" action="/car?action=create">
        <div class="form-group">
            <label for="name">Car Name:</label>
            <input type="text" class="form-control" name="name" id="name" placeholder="Enter car name" required>
        </div>
        <div class="form-group">
            <label for="company">Company:</label>
            <input type="text" class="form-control" name="company" id="company" placeholder="Enter company name" required>
        </div>
        <div class="form-group">
            <label for="imageUrl">Image URL:</label>
            <input type="text" class="form-control" name="imageUrl" id="imageUrl" placeholder="Enter image URL" required>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" step="0.01" class="form-control" name="price" id="price" placeholder Gomez: "Enter price" required>
        </div>
        <div class="text-center">
            <input type="submit" class="btn btn-success btn-lg" value="Save">
        </div>
    </form>
</div>

<div class="footer">
    © 2025 Car Management. All Rights Reserved.
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>