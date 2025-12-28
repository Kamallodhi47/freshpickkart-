<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Apna Shop - Premium Shopping Experience</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome CDN (for icons) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
      :root {
        --primary-color: #6c63ff;
        --primary-dark: #5a52d5;
        --secondary-color: #ff6584;
        --accent-color: #42b883;
        --dark-color: #2a2d3b;
        --light-color: #f8f9fa;
        --text-color: #333;
        --text-light: #6c757d;
        --gradient: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        --shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
      }
      
      body {
        font-family: 'Poppins', sans-serif;
        padding-top: 80px;
        color: var(--text-color);
      }
      
      /* Custom Navbar Styling */
      .navbar-custom {
        background: var(--gradient);
        box-shadow: var(--shadow);
        padding: 0.8rem 0;
        transition: all 0.3s ease;
      }
      
      .navbar-custom.scrolled {
        padding: 0.5rem 0;
        background: rgba(108, 99, 255, 0.95);
        backdrop-filter: blur(10px);
      }
      
      .navbar-brand {
        font-weight: 700;
        font-size: 1.8rem;
        display: flex;
        align-items: center;
        transition: transform 0.3s ease;
      }
      
      .navbar-brand:hover {
        transform: scale(1.05);
      }
      
      .navbar-brand i {
        color: var(--secondary-color);
        margin-right: 10px;
        font-size: 1.8rem;
        background: white;
        padding: 8px;
        border-radius: 50%;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      }
      
      .nav-link {
        font-weight: 500;
        margin: 0 5px;
        border-radius: 8px;
        transition: all 0.3s ease;
        position: relative;
        display: flex;
        align-items: center;
        padding: 8px 15px !important;
      }
      
      .nav-link i {
        margin-right: 8px;
        font-size: 1.1rem;
      }
      
      .nav-link:hover, .nav-link.active {
        background: rgba(255, 255, 255, 0.2);
        transform: translateY(-2px);
      }
      
      .nav-link::after {
        content: '';
        position: absolute;
        width: 0;
        height: 3px;
        bottom: 0;
        left: 50%;
        background: var(--secondary-color);
        transition: all 0.3s ease;
        border-radius: 10px;
      }
      
      .nav-link:hover::after, .nav-link.active::after {
        width: 70%;
        left: 15%;
      }
      
      .navbar-toggler {
        border: none;
        padding: 4px 8px;
      }
      
      .navbar-toggler:focus {
        box-shadow: none;
      }
      
      .navbar-toggler-icon {
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%28255, 255, 255, 1%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
      }
      
      /* Badge for notifications */
      .badge-custom {
        background: var(--secondary-color);
        color: white;
        border-radius: 50%;
        font-size: 0.7rem;
        padding: 2px 6px;
        position: absolute;
        top: 5px;
        right: 5px;
      }
      
      /* Dropdown styling */
      .dropdown-menu {
        border: none;
        border-radius: 12px;
        box-shadow: var(--shadow);
        padding: 10px 0;
        margin-top: 10px;
      }
      
      .dropdown-item {
        padding: 8px 20px;
        transition: all 0.2s ease;
      }
      
      .dropdown-item:hover {
        background: rgba(108, 99, 255, 0.1);
        padding-left: 25px;
      }
      
      /* Search bar styling */
      .search-container {
        position: relative;
        margin: 0 15px;
      }
      
      .search-input {
        border: none;
        border-radius: 50px;
        padding: 10px 20px 10px 45px;
        width: 300px;
        font-size: 0.9rem;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
      }
      
      .search-input:focus {
        width: 350px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
      }
      
      .search-icon {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-light);
      }
      
      /* Responsive adjustments */
      @media (max-width: 991px) {
        .search-container {
          margin: 15px 0;
          width: 100%;
        }
        
        .search-input {
          width: 100%;
        }
        
        .search-input:focus {
          width: 100%;
        }
        
        .nav-link {
          margin: 2px 0;
        }
      }
      
      /* Demo content */
      .demo-content {
        padding: 40px 20px;
        text-align: center;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        border-radius: 15px;
        margin: 20px;
        box-shadow: var(--shadow);
      }
    </style>
  </head>
  <body>
    
    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          <i class="fa-solid fa-cart-shopping"></i> Apna Shop
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
          aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Left Side Menu -->
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="/Index">
                <i class="fa-solid fa-house"></i> Home
              </a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa-solid fa-tags"></i> Products
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">All Products</a></li>
                <li><a class="dropdown-item" href="#">New Arrivals</a></li>
                <li><a class="dropdown-item" href="#">Best Sellers</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">On Sale</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa-solid fa-list"></i> Categories
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Electronics</a></li>
                <li><a class="dropdown-item" href="#">Fashion</a></li>
                <li><a class="dropdown-item" href="#">Home & Kitchen</a></li>
                <li><a class="dropdown-item" href="#">Beauty & Health</a></li>
                <li><a class="dropdown-item" href="#">Sports</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fa-solid fa-percent"></i> Offers
                <span class="badge-custom">3</span>
              </a>
            </li>
          </ul>
          
          <!-- Search Bar -->
          <div class="search-container">
            <i class="fa-solid fa-magnifying-glass search-icon"></i>
            <input type="text" class="search-input" placeholder="Search products...">
          </div>
          
          <!-- Right Side Menu -->
          <ul class="navbar-nav mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fa-solid fa-heart"></i> Wishlist
                <span class="badge-custom">5</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fa-solid fa-cart-shopping"></i> Cart
                <span class="badge-custom">2</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa-solid fa-user"></i> Account
              </a>
              <ul class="dropdown-menu">
              
                <li><a class="dropdown-item" href="/Login"><i class="fa-solid fa-right-to-bracket"></i> Login</a></li>
                <li><a class="dropdown-item" href="/register"><i class="fa-solid fa-user-plus"></i> Register</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#"><i class="fa-solid fa-user-shield"></i> Admin</a></li>
                <li><a class="dropdown-item" href="#"><i class="fa-solid fa-gear"></i> Settings</a></li>
                <li><a class="dropdown-item" href="#"><i class="fa-solid fa-question-circle"></i> Help</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Navbar End -->

    <!-- Demo Content -->
    <!-- <div class="demo-content">
      <h1>Welcome to Apna Shop</h1>
      <p class="lead">Experience premium shopping with our modern e-commerce platform</p>
      <p>This is a demo page to showcase the enhanced navbar design.</p>
    </div> -->

    <!-- Bootstrap JS (important for navbar toggle) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
      // Navbar scroll effect
      window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar-custom');
        if (window.scrollY > 50) {
          navbar.classList.add('scrolled');
        } else {
          navbar.classList.remove('scrolled');
        }
      });
      
      // Add active class to current page link
      document.addEventListener('DOMContentLoaded', function() {
        const currentLocation = location.pathname;
        const navLinks = document.querySelectorAll('.nav-link');
        
        navLinks.forEach(link => {
          if(link.getAttribute('href') === currentLocation) {
            link.classList.add('active');
          }
        });
      });
    </script>
  </body>
</html>