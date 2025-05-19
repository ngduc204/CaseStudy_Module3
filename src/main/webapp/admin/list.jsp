<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Management Application</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #f0f4f8, #d9e2ec);
        }
        .card {
            transition: transform 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Car Management</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/car?action=create">Add New Car</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-5">
    <div class="mb-4">
        <input type="text" class="form-control" placeholder="Search for cars..." id="searchInput">
    </div>

    <div class="row" id="carList">
        <c:forEach var="car" items="${listCars}">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="${car.imageUrl}" class="card-img-top" alt="${car.name}">
                    <div class="card-body">
                        <h5 class="card-title">${car.name}</h5>
                        <p class="card-text">Company: ${car.company}</p>
                        <p class="card-text">Price: $${car.price}</p>
                        <a href="/car?action=update&id=${car.id}" class="btn btn-warning">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <button class="btn btn-danger" data-toggle="modal" data-target="#confirmDeleteModal-${car.id}">
                            <i class="fas fa-trash"></i> Delete
                        </button>
                    </div>
                </div>

                <!-- Modal for delete confirmation -->
                <div class="modal fade" id="confirmDeleteModal-${car.id}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Are you sure you want to delete ${car.name}?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <a href="/car?action=delete&id=${car.id}" class="btn btn-danger">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $('#searchInput').on('keyup', function() {
        var value = $(this).val().toLowerCase();
        $('#carList .col-md-4').filter(function() {
            $(this).toggle($(this).find('.card-title').text().toLowerCase().indexOf(value) > -1);
        });
    });
</script>
</body>
</html>