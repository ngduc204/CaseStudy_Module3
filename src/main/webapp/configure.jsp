<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Porsche Model Series - Nguyễn Đức Auto</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background-color: #f5f5f5;
    }
    header {
      background-color: #000;
      color: white;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    h1 {
      font-size: 36px;
      font-weight: bold;
      margin: 0;
    }
    .config-button {
      background-color: #fff;
      color: #000;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .model-series {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
      margin: 20px;
    }
    .model-card {
      background: white;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin: 10px;
      width: calc(45% - 40px);
      text-align: center;
    }
    .model-card img {
      max-width: 100%;
      border-radius: 8px;
    }
    .model-title {
      font-size: 24px;
      margin: 10px 0;
    }
    .model-description {
      color: #666;
    }
    .compare-button {
      margin-top: 20px;
      padding: 10px 20px;
      background: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 5px;
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
    .navbar {
      transition: background-color 0.3s ease;
    }
    .navbar.scrolled {
      background-color: rgba(0, 0, 0, 0.9);
    }
  </style>
</head>
<body class="bg-gray-100 font-sans">
<header class="navbar fixed top-0 w-full bg-black bg-opacity-80 text-white z-50">
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
</header>
<h2 style="text-align: center; margin: 80px 0 20px 0;">Select a Model Series</h2>
<div class="model-series">
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/718/extcam03.webp" alt="718">
    <div class="model-title">718</div>
    <div class="model-description">Petrol</div>
    <div>Two-seater sports car with mid-engine layout for optimum driving dynamics</div>
    <a href="car_details.jsp?model=718" class="compare-button">Configure your 718</a>
  </div>
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/911/extcam03.webp" alt="911">
    <div class="model-title">911</div>
    <div class="model-description">Petrol</div>
    <div>Iconic rear-engine sports car delivering the ultimate driving experience</div>
    <a href="car_details.jsp?model=911" class="compare-button">Configure your 911</a>
  </div>
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/taycan/extcam03.webp" alt="Taycan">
    <div class="model-title">Taycan</div>
    <div class="model-description">Electric</div>
    <div>High performance all-electric sports sedan</div>
    <a href="car_details.jsp?model=taycan" class="compare-button">Configure your Taycan</a>
  </div>
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/panamera/extcam03.webp" alt="Panamera">
    <div class="model-title">Panamera</div>
    <div class="model-description">Petrol / Hybrid</div>
    <div>The luxury sports limousine for four</div>
    <a href="car_details.jsp?model=panamera" class="compare-button">Configure your Panamera</a>
  </div>
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/macan/extcam03.webp" alt="Macan">
    <div class="model-title">Macan</div>
    <div class="model-description">Petrol / Electric</div>
    <div>The most dynamic compact SUV</div>
    <a href="car_details.jsp?model=macan" class="compare-button">Configure your Macan</a>
  </div>
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/cayenne/extcam03.webp" alt="Cayenne">
    <div class="model-title">Cayenne</div>
    <div class="model-description">Petrol / Hybrid</div>
    <div>Versatile SUV with sports car performance</div>
    <a href="car_details.jsp?model=cayenne" class="compare-button">Configure your Cayenne</a>
  </div>
</div>
<div style="text-align: center; margin: 20px;">
  <p>Do you need support choosing a model?</p>
  <button class="compare-button">Compare Models</button>
</div>
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