<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Xe - Nguyễn Đức Auto</title>
    <link rel="icon" type="image/png" href="https://xeotogiadinh.com/wp-content/uploads/2019/02/45326-Sticker-Porsche-Logo.png">
    <link rel="apple-touch-icon" href="https://1000logos.net/wp-content/uploads/2018/02/Porsche-Logo.png?v=1">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.min.css">
    <style>
        .car-image {
            max-height: 400px;
            object-fit: cover;
            border-radius: 8px;
        }
        .detail-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .detail-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
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
        <a href="home" class="text-2xl font-bold">Nguyễn Đức Auto</a>
        <div class="space-x-6">
            <a href="home#cars-section" class="hover:text-blue-400 transition">Danh sách xe</a>
            <a href="configure.jsp" class="hover:text-blue-400 transition">Tùy chỉnh xe</a>
            <a href="cart" class="hover:text-blue-400 transition">Giỏ hàng</a>
            <a href="home#contact" class="hover:text-blue-400 transition">Liên hệ</a>
            <a href="logout" class="hover:text-blue-400 transition">Đăng xuất</a>
        </div>
    </div>
</nav>

<!-- Car Details Section -->
<div class="container mx-auto px-4 py-16">
    <div class="detail-card bg-white rounded-lg shadow-lg p-6">
        <h1 class="text-3xl font-bold mb-4">${car.name}</h1>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Car Image -->
            <div>
                <img src="${car.imageUrl}" alt="${car.name}" class="w-full car-image">
            </div>
            <!-- Car Details -->
            <div>
                <h2 class="text-xl font-semibold mb-4">Thông tin chi tiết</h2>
                <p class="text-gray-600 mb-2"><strong>Hãng:</strong> ${car.company}</p>
                <p class="text-gray-600 mb-2"><strong>Giá:</strong> $${car.price}</p>
                <p class="text-gray-600 mb-2"><strong>Màu sắc:</strong> ${car.color}</p>
                <p class="text-gray-600 mb-2"><strong>Tốc độ tối đa:</strong> ${car.topSpeed} km/h</p>
                <p class="text-gray-600 mb-2"><strong>Mã lực:</strong> ${car.horsepower} HP</p>
                <p class="text-gray-600 mb-2"><strong>Loại nhiên liệu:</strong> ${car.fuelType}</p>
                <p class="text-gray-600 mb-2"><strong>Hộp số:</strong> ${car.transmission}</p>
                <p class="text-gray-600 mb-4"><strong>Mô tả:</strong> ${car.description}</p>
                <div class="flex space-x-4">
                    <form action="add-to-cart" method="post">
                        <input type="hidden" name="carId" value="${car.id}">
                        <input type="hidden" name="carName" value="${car.name}">
                        <input type="hidden" name="company" value="${car.company}">
                        <input type="hidden" name="price" value="${car.price}">
                        <input type="hidden" name="imageUrl" value="${car.imageUrl}">
                        <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">Thêm vào giỏ hàng</button>
                    </form>
                    <a href="home#cars-section" class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">Quay lại danh sách xe</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-black text-white py-8" id="contact">
    <div class="container mx-auto px-4 text-center">
        <h3 class="text-2xl font-bold mb-4">Liên hệ với chúng tôi!</h3>
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