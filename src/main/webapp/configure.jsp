<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Porsche Model Series - Nguyễn Đức Auto</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background-color: #f5f5f5;
    }
    header {
      background-color: #eaeaea;
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
      background-color: #000;
      color: white;
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
  </style>
</head>
<body>
<header>
  <!--    <h1>Porsche</h1>-->
  <a href="home.jsp"><img src="https://s3.cloud.cmctelecom.vn/tinhte2/2020/06/5050141_porsche-logo.png" alt="Logo" style="width: 210px; height: 110px"></a>
  <button class="config-button">Do you already have a configuration?</button>
</header>
<h2 style="text-align: center; margin: 20px 0;">Select a Model Series</h2>
<div class="model-series">
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/718/extcam03.webp" alt="718">
    <div class="model-title">718</div>
    <div class="model-description">Petrol</div>
    <div>Two-seater sports car with mid-engine layout for optimum driving dynamics</div>
    <button class="compare-button">Configure your 718</button>
  </div>
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/911/extcam03.webp" alt="911">
    <div class="model-title">911</div>
    <div class="model-description">Petrol</div>
    <div>Iconic rear-engine sports car delivering the ultimate driving experience</div>
    <button class="compare-button">Configure your 911</button>
  </div>
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/taycan/extcam03.webp" alt="Taycan">
    <div class="model-title">Taycan</div>
    <div class="model-description">Electric</div>
    <div>High performance all-electric sports sedan</div>
    <button class="compare-button">Configure your Taycan</button>
  </div>
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/panamera/extcam03.webp" alt="Panamera">
    <div class="model-title">Panamera</div>
    <div class="model-description">Petrol / Hybrid</div>
    <div>The luxury sports limousine for four</div>
    <button class="compare-button">Configure your Panamera</button>
  </div>
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/macan/extcam03.webp" alt="Macan">
    <div class="model-title">Macan</div>
    <div class="model-description">Petrol / Electric</div>
    <div>The most dynamic compact SUV</div>
    <button class="compare-button">Configure your Macan</button>
  </div>
  <div class="model-card">
    <img src="https://configurator.porsche.com/model-start/pictures/cayenne/extcam03.webp" alt="Cayenne">
    <div class="model-title">Cayenne</div>
    <div class="model-description">Petrol / Hybrid</div>
    <div>Versatile SUV with sports car performance</div>
    <button class="compare-button">Configure your Cayenne</button>
  </div>
</div>
<div style="text-align: center; margin: 20px;">
  <p>Do you need support choosing a model?</p>
  <button class="compare-button">Compare Models</button>
</div>
<footer class="footer">
  <p>Current Region / Language: Vietnam / English</p>
  <p>Newsletter | Locations & Contacts | Social Media</p>
  <p>&copy; 2025 Porsche Asia Pacific Pte Ltd</p>
  <p><a href="#">Legal Notice</a> | <a href="#">Privacy Policy</a> | <a href="#">Open Source Software Notice</a></p>
</footer>
</body>
</html>