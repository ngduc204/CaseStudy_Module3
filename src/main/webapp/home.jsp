<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nguyễn Đức Auto</title>
    <link rel="icon" type="image/png" href="https://xeotogiadinh.com/wp-content/uploads/2019/02/45326-Sticker-Porsche-Logo.png">
    <link rel="apple-touch-icon" href="https://1000logos.net/wp-content/uploads/2018/02/Porsche-Logo.png?v=1">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.min.css">
    <style>
        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://static.automotor.vn/images/upload/2022/08/28/bugatti-chay-hang-autonews.jpeg') no-repeat center center/cover;
            height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }
        .car-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .car-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .car-card img {
            height: 200px;
            object-fit: cover;
            border-radius: 8px 8px 0 0;
        }
        .filter-btn:hover {
            background-color: #1d4ed8;
        }
        .navbar {
            transition: background-color 0.3s ease;
        }
        .navbar.scrolled {
            background-color: rgba(0, 0, 0, 0.9);
        }
    </style>
</head>
<body class="bg-gray-100 font-sans">
<!-- Navbar -->
<nav class="navbar fixed top-0 w-full bg-black bg-opacity-80 text-white z-50">
    <div class="container mx-auto px-4 py-3 flex justify-between items-center">
        <a href="#" class="text-2xl font-bold">Nguyễn Đức Auto</a>
        <div class="space-x-6">
            <a href="#cars-section" class="hover:text-blue-400 transition">Vehicle list</a>
            <a href="configure.jsp" class="hover:text-blue-400 transition">Configure your car</a>
            <a href="cart" class="hover:text-blue-400 transition">Cart</a>
            <a href="#contact" class="hover:text-blue-400 transition">Contact</a>
            <a href="logout" class="hover:text-blue-400 transition">Sign Out</a>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<div class="hero">
    <div>
        <h1 class="text-5xl font-bold mb-4">Find Your Dream Car</h1>
        <p class="text-lg mb-6">Explore a collection of luxury cars with classy design and outstanding performance.</p>
        <a href="#cars-section" class="bg-blue-600 text-white px-6 py-3 rounded-full hover:bg-blue-700 transition">View Car Now</a>
    </div>
</div>

<!-- Search and Filter Section -->
<div class="container mx-auto px-4 py-8">
    <div class="flex flex-col md:flex-row justify-between items-center mb-8">
        <div class="w-full md:w-1/3 mb-4 md:mb-0">
            <input type="text" id="searchInput" placeholder="Tìm kiếm theo tên xe hoặc hãng..."
                   class="w-full p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600">
        </div>
        <div class="flex space-x-4">
            <select id="companyFilter"
                    class="p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600">
                <option value="">All brands</option>
                <option value="Bugatti">Bugatti</option>
                <option value="Porsche">Porsche</option>
                <option value="Maserati">Maserati</option>
                <option value="BMW">BMW</option>
                <option value="Lamborghini">Lamborghini</option>
                <option value="Ferrari">Ferrari</option>
            </select>
            <select id="priceFilter" class="p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600">
                <option value="">All prices</option>
                <option value="low">Under $500,000</option>
                <option value="medium">$500,000 - $1,000,000</option>
                <option value="high">Over $1,000,000</option>
            </select>
        </div>
    </div>

    <!-- Cars Section -->
    <div id="cars-section" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <c:forEach var="car" items="${listCars}">
            <div class="car-card bg-white rounded-lg shadow-lg overflow-hidden" data-company="${car.company}"
                 data-price="${car.price}">
                <img src="${car.imageUrl}" alt="${car.name}" class="w-full">
                <div class="p-4">
                    <h3 class="text-xl font-semibold mb-2">${car.name}</h3>
                    <p class="text-gray-600 mb-1">Hãng: ${car.company}</p>
                    <p class="text-gray-600 mb-3">Giá: $${car.price}</p>
                    <div class="flex space-x-2">
                        <a href="#" class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">Xem Chi Tiết</a>
                        <form action="add-to-cart" method="post">
                            <input type="hidden" name="carId" value="${car.id}">
                            <input type="hidden" name="carName" value="${car.name}">
                            <input type="hidden" name="company" value="${car.company}">
                            <input type="hidden" name="price" value="${car.price}">
                            <input type="hidden" name="imageUrl" value="${car.imageUrl}">
                            <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Footer -->
<footer class="bg-black text-white py-8" id="contact">
    <div class="container mx-auto px-4 text-center">
        <h3 class="text-2xl font-bold mb-4">Contact us!</h3>
        <p class="mb-4">Email: ngduchd204@gmail.com | Hotline: (+84) 343 883 833</p>
        <div class="flex justify-center space-x-6 mb-4">
            <a href="https://www.facebook.com/nguyen.uc.813846/?locale=vi_VN" target="_blank" class="text-white hover:text-blue-400 transition">
                <i class="fab fa-facebook-f fa-2x"></i>
            </a>
            <a href="https://www.instagram.com/ngduc.04/" target="_blank" class="text-white hover:text-blue-400 transition">
                <i class="fab fa-instagram fa-2x"></i>
            </a>
            <a href="mailto:ngduchd204@gmail.com" class="text-white hover:text-blue-400 transition">
                <i class="fas fa-envelope fa-2x"></i>
            </a>
        </div>
        <p>© 2025 Nguyễn Đức Auto.</p>
    </div>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.min.js"></script>
<script>
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('.navbar').addClass('scrolled');
        } else {
            $('.navbar').removeClass('scrolled');
        }
    });

    $('#searchInput, #companyFilter, #priceFilter').on('input change', function () {
        let search = $('#searchInput').val().toLowerCase();
        let company = $('#companyFilter').val();
        let price = $('#priceFilter').val();

        $('.car-card').each(function () {
            let carName = $(this).find('h3').text().toLowerCase();
            let carCompany = $(this).data('company');
            let carPrice = parseFloat($(this).data('price'));

            let show = true;

            if (search && !carName.includes(search) && !carCompany.toLowerCase().includes(search)) {
                show = false;
            }

            if (company && carCompany !== company) {
                show = false;
            }

            if (price) {
                if (price === 'low' && carPrice >= 500000) show = false;
                else if (price === 'medium' && (carPrice < 500000 || carPrice >= 1000000)) show = false;
                else if (price === 'high' && carPrice <= 1000000) show = false;
            }

            $(this).toggle(show);
        });
    });

    // Hiển thị thông báo nếu có
    <c:if test="${not empty successMessage}">
    Toastify({
        text: "${successMessage}",
        duration: 3000,
        gravity: "top",
        position: "right",
        backgroundColor: "#4CAF50",
        stopOnFocus: true
    }).showToast();
    <% session.removeAttribute("successMessage"); %>
    </c:if>
</script>
</body>
</html>