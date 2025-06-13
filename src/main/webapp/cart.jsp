<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Giỏ Hàng - Nguyễn Đức Auto</title>
  <link rel="icon" type="image/png" href="https://xeotogiadinh.com/wp-content/uploads/2019/02/45326-Sticker-Porsche-Logo.png">
  <link rel="apple-touch-icon" href="https://1000logos.net/wp-content/uploads/2018/02/Porsche-Logo.png?v=1">
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.min.css">
  <style>
    .navbar {
      transition: background-color 0.3s ease;
    }
    .navbar.scrolled {
      background-color: rgba(0, 0, 0, 0.9);
    }
    .cart-item {
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .cart-item:hover {
      transform: translateY(-5px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
    .cart-item img {
      height: 100px;
      object-fit: cover;
      border-radius: 8px;
    }
  </style>
</head>
<body class="bg-gray-100 font-sans">
<!-- Navbar -->
<nav class="navbar fixed top-0 w-full bg-black bg-opacity-80 text-white z-50">
  <div class="container mx-auto px-4 py-3 flex justify-between items-center">
    <a href="#" class="text-2xl font-bold">Nguyễn Đức Auto</a>
    <div class="space-x-6">
      <a href="home" class="hover:text-blue-400 transition">Vehicle list</a>
      <a href="configure.jsp" class="hover:text-blue-400 transition">Configure your car</a>
      <a href="cart" class="hover:text-blue-400 transition">Cart</a>
      <a href="#contact" class="hover:text-blue-400 transition">Contact</a>
      <a href="logout" class="hover:text-blue-400 transition">Sign Out</a>
    </div>
  </div>
</nav>

<!-- Cart Section -->
<div class="container mx-auto px-4 py-8 mt-20">
  <h1 class="text-3xl font-bold mb-6">Your Cart</h1>
  <c:if test="${empty cartItems}">
    <p class="text-gray-600">Your cart is empty.</p>
  </c:if>
  <c:if test="${not empty cartItems}">
    <div class="grid grid-cols-1 gap-6">
      <c:set var="totalPrice" value="0" />
      <c:forEach var="item" items="${cartItems}">
        <div class="cart-item bg-white rounded-lg shadow-lg p-4 flex items-center">
          <img src="${item.imageUrl}" alt="${item.carName}" class="mr-4">
          <div class="flex-1">
            <h3 class="text-xl font-semibold">${item.carName}</h3>
            <p class="text-gray-600">Brand: ${item.company}</p>
            <p class="text-gray-600">Price: $${item.price}</p>
          </div>
          <form action="remove-from-cart" method="post">
            <input type="hidden" name="cartItemId" value="${item.id}">
            <button type="submit" class="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700 transition">Remove</button>
          </form>
        </div>
        <c:set var="totalPrice" value="${totalPrice + item.price}" />
      </c:forEach>
      <div class="flex justify-end mt-6">
        <div class="text-xl font-bold">Total: $${totalPrice}</div>
      </div>
      <div class="flex justify-end mt-4">
        <form action="checkout" method="post">
          <button type="submit" class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition">Checkout</button>
        </form>
      </div>
    </div>
  </c:if>
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