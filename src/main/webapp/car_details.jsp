<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Details - Nguyễn Đức Auto</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .navbar {
            transition: background-color 0.3s ease;
        }
        .navbar.scrolled {
            background-color: rgba(0, 0, 0, 0.9);
        }
        .car-details {
            max-width: 800px;
            margin: 100px auto 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }
        .car-details img {
            max-width: 100%;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .car-details h2 {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .car-details p {
            color: #666;
            margin-bottom: 10px;
        }
        .car-details .price {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
            margin: 20px 0;
        }
        .car-details .back-button {
            display: inline-block;
            padding: 10px 20px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        .car-details .add-to-cart {
            display: inline-block;
            padding: 10px 20px;
            background: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            margin-left: 10px;
        }
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 20px;
        }
        .footer a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }
    </style>
</head>
<body class="bg-gray-100 font-sans">
<!-- Navbar -->
<nav class="navbar fixed top-0 w-full bg-black bg-opacity-80 text-white z-50">
    <div class="container mx-auto px-4 py-3 flex justify-between items-center">
        <a href="home.jsp"><img src="https://s3.cloud.cmctelecom.vn/tinhte2/2020/06/5050141_porsche-logo.png" alt="Logo" style="width: 210px; height: 110px"></a>
        <div class="space-x-6">
            <a href="home" class="hover:text-blue-400 transition">Vehicle list</a>
            <a href="configure.jsp" class="hover:text-blue-400 transition">Configure your car</a>
            <a href="cart" class="hover:text-blue-400 transition">Cart</a>
            <a href="#contact" class="hover:text-blue-400 transition">Contact</a>
            <a href="logout" class="hover:text-blue-400 transition">Sign Out</a>
        </div>
    </div>
</nav>

<!-- Car Details -->
<div class="car-details">
    <c:choose>
        <c:when test="${param.model == '718'}">
            <img src="https://configurator.porsche.com/model-start/pictures/718/extcam03.webp" alt="718">
            <h2>Porsche 718</h2>
            <p>Two-seater sports car with mid-engine layout for optimum driving dynamics.</p>
            <p><strong>Fuel Type:</strong> Petrol</p>
            <p><strong>Engine:</strong> 2.0L Turbocharged Flat-4</p>
            <p><strong>Horsepower:</strong> 300 hp</p>
            <p><strong>Top Speed:</strong> 275 km/h</p>
            <p class="price">Price: $60,000</p>
            <form action="add-to-cart" method="post">
                <input type="hidden" name="carId" value="718">
                <input type="hidden" name="carName" value="Porsche 718">
                <input type="hidden" name="company" value="Porsche">
                <input type="hidden" name="price" value="60000">
                <input type="hidden" name="imageUrl" value="https://configurator.porsche.com/model-start/pictures/718/extcam03.webp">
                <button type="submit" class="add-to-cart">Add to Cart</button>
            </form>
        </c:when>
        <c:when test="${param.model == '911'}">
            <img src="https://configurator.porsche.com/model-start/pictures/911/extcam03.webp" alt="911">
            <h2>Porsche 911</h2>
            <p>Iconic rear-engine sports car delivering the ultimate driving experience.</p>
            <p><strong>Fuel Type:</strong> Petrol</p>
            <p><strong>Engine:</strong> 3.0L Twin-Turbo Flat-6</p>
            <p><strong>Horsepower:</strong> 379 hp</p>
            <p><strong>Top Speed:</strong> 308 km/h</p>
            <p class="price">Price: $100,000</p>
            <form action="add-to-cart" method="post">
                <input type="hidden" name="carId" value="911">
                <input type="hidden" name="carName" value="Porsche 911">
                <input type="hidden" name="company" value="Porsche">
                <input type="hidden" name="price" value="100000">
                <input type="hidden" name="imageUrl" value="https://configurator.porsche.com/model-start/pictures/911/extcam03.webp">
                <button type="submit" class="add-to-cart">Add to Cart</button>
            </form>
        </c:when>
        <c:when test="${param.model == 'taycan'}">
            <img src="https://configurator.porsche.com/model-start/pictures/taycan/extcam03.webp" alt="Taycan">
            <h2>Porsche Taycan</h2>
            <p>High performance all-electric sports sedan.</p>
            <p><strong>Fuel Type:</strong> Electric</p>
            <p><strong>Power:</strong> 402 hp</p>
            <p><strong>Range:</strong> 450 km</p>
            <p><strong>Top Speed:</strong> 260 km/h</p>
            <p class="price">Price: $85,000</p>
            <form action="add-to-cart" method="post">
                <input type="hidden" name="carId" value="taycan">
                <input type="hidden" name="carName" value="Porsche Taycan">
                <input type="hidden" name="company" value="Porsche">
                <input type="hidden" name="price" value="85000">
                <input type="hidden" name="imageUrl" value="https://configurator.porsche.com/model-start/pictures/taycan/extcam03.webp">
                <button type="submit" class="add-to-cart">Add to Cart</button>
            </form>
        </c:when>
        <c:when test="${param.model == 'panamera'}">
            <img src="https://configurator.porsche.com/model-start/pictures/panamera/extcam03.webp" alt="Panamera">
            <h2>Porsche Panamera</h2>
            <p>The luxury sports limousine for four.</p>
            <p><strong>Fuel Type:</strong> Petrol / Hybrid</p>
            <p><strong>Engine:</strong> 2.9L Twin-Turbo V6</p>
            <p><strong>Horsepower:</strong> 330 hp</p>
            <p><strong>Top Speed:</strong> 270 km/h</p>
            <p class="price">Price: $90,000</p>
            <form action="add-to-cart" method="post">
                <input type="hidden" name="carId" value="panamera">
                <input type="hidden" name="carName" value="Porsche Panamera">
                <input type="hidden" name="company" value="Porsche">
                <input type="hidden" name="price" value="90000">
                <input type="hidden" name="imageUrl" value="https://configurator.porsche.com/model-start/pictures/panamera/extcam03.webp">
                <button type="submit" class="add-to-cart">Add to Cart</button>
            </form>
        </c:when>
        <c:when test="${param.model == 'macan'}">
            <img src="https://configurator.porsche.com/model-start/pictures/macan/extcam03.webp" alt="Macan">
            <h2>Porsche Macan</h2>
            <p>The most dynamic compact SUV.</p>
            <p><strong>Fuel Type:</strong> Petrol / Electric</p>
            <p><strong>Engine:</strong> 2.0L Turbocharged Inline-4</p>
            <p><strong>Horsepower:</strong> 261 hp</p>
            <p><strong>Top Speed:</strong> 232 km/h</p>
            <p class="price">Price: $55,000</p>
            <form action="add-to-cart" method="post">
                <input type="hidden" name="carId" value="macan">
                <input type="hidden" name="carName" value="Porsche Macan">
                <input type="hidden" name="company" value="Porsche">
                <input type="hidden" name="price" value="55000">
                <input type="hidden" name="imageUrl" value="https://configurator.porsche.com/model-start/pictures/macan/extcam03.webp">
                <button type="submit" class="add-to-cart">Add to Cart</button>
            </form>
        </c:when>
        <c:when test="${param.model == 'cayenne'}">
            <img src="https://configurator.porsche.com/model-start/pictures/cayenne/extcam03.webp" alt="Cayenne">
            <h2>Porsche Cayenne</h2>
            <p>Versatile SUV with sports car performance.</p>
            <p><strong>Fuel Type:</strong> Petrol / Hybrid</p>
            <p><strong>Engine:</strong> 3.0L Turbocharged V6</p>
            <p><strong>Horsepower:</strong> 335 hp</p>
            <p><strong>Top Speed:</strong> 245 km/h</p>
            <p class="price">Price: $70,000</p>
            <form action="add-to-cart" method="post">
                <input type="hidden" name="carId" value="cayenne">
                <input type="hidden" name="carName" value="Porsche Cayenne">
                <input type="hidden" name="company" value="Porsche">
                <input type="hidden" name="price" value="70000">
                <input type="hidden" name="imageUrl" value="https://configurator.porsche.com/model-start/pictures/cayenne/extcam03.webp">
                <button type="submit" class="add-to-cart">Add to Cart</button>
            </form>
        </c:when>
        <c:otherwise>
            <h2>Invalid Model</h2>
            <p>Please select a valid model from the configuration page.</p>
        </c:otherwise>
    </c:choose>
    <a href="configure.jsp" class="back-button">Back to Model Selection</a>
</div>

<!-- Footer -->
<footer class="footer">
    <p>Current Region / Language: Vietnam / English</p>
    <p>Newsletter | Locations & Contacts | Social Media</p>
    <p>© 2025 Porsche Asia Pacific Pte Ltd</p>
    <p><a href="#">Legal Notice</a> | <a href="#">Privacy Policy</a> | <a href="#">Open Source Software Notice</a></p>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('.navbar').addClass('scrolled');
        } else {
            $('.navbar').removeClass('scrolled');
        }
    });
</script>
</body>
</html>