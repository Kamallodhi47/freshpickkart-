<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <title>Premium Products | Apna Shop</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        /* ========== MOBILE FIRST VARIABLES ========== */
        :root {
            --primary: #4a6cf7;
            --secondary: #6c63ff;
            --accent: #ff6b8b;
            --success: #28a745;
            --warning: #ffcf2b;
            --dark: #2a2d3b;
            --light: #f8fafc;
            --text: #64748b;
            --mobile-bg: #ffffff;
            --card-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            --desktop-shadow: 0 20px 60px rgba(0, 0, 0, 0.12);
        }

        /* ========== MOBILE STYLES ========== */
        * {
            -webkit-tap-highlight-color: transparent;
            -webkit-text-size-adjust: 100%;
        }

        body {
            background: linear-gradient(135deg, #f8fafc 0%, #e4edf5 100%);
            font-family: 'Poppins', sans-serif;
            color: var(--dark);
            min-height: 100vh;
            padding-top: 70px;
            padding-bottom: 70px; /* For mobile bottom nav */
            overflow-x: hidden;
            touch-action: pan-y;
        }

        /* Mobile Header Spacing */
        @media (max-width: 768px) {
            body {
                padding-top: 60px;
                padding-bottom: 60px;
            }
        }

        /* ========== MOBILE WRAPPER ========== */
        .main-wrapper {
            width: 100%;
            padding: 15px;
            margin: 0 auto;
        }

        /* ========== MOBILE CATEGORY SIDEBAR ========== */
        .mobile-category-toggle {
            display: block;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 15px;
            border-radius: 15px;
            margin-bottom: 20px;
            font-weight: 700;
            text-align: center;
            cursor: pointer;
            box-shadow: 0 8px 20px rgba(74, 108, 247, 0.3);
            position: relative;
            z-index: 100;
            border: none;
            width: 100%;
        }

        .mobile-category-toggle i {
            margin-right: 10px;
        }

        /* Mobile Category Sidebar (Hidden by default) */
        .mobile-category-sidebar {
            position: fixed;
            top: 0;
            left: -100%;
            width: 85%;
            height: 100vh;
            background: white;
            z-index: 9999;
            padding: 20px;
            overflow-y: auto;
            transition: left 0.3s ease;
            box-shadow: 5px 0 30px rgba(0, 0, 0, 0.15);
            padding-top: 80px;
        }

        .mobile-category-sidebar.active {
            left: 0;
        }

        .mobile-category-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 9998;
            display: none;
        }

        .mobile-category-overlay.active {
            display: block;
        }

        .mobile-category-close {
            position: absolute;
            top: 20px;
            right: 20px;
            background: var(--accent);
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(255, 107, 139, 0.4);
        }

        /* ========== MOBILE PRODUCTS CONTAINER ========== */
        .mobile-products-container {
            background: white;
            border-radius: 20px;
            padding: 20px;
            box-shadow: var(--card-shadow);
            margin-bottom: 20px;
            width: 100%;
        }

        /* Mobile Section Title */
        .mobile-section-title {
            font-size: 1.4rem;
            font-weight: 800;
            color: var(--dark);
            margin-bottom: 20px;
            text-align: center;
            position: relative;
            padding-bottom: 10px;
        }

        .mobile-section-title::after {
            content: '';
            width: 60px;
            height: 3px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 4px;
        }

        /* Mobile Product Count */
        .mobile-product-count {
            background: rgba(74, 108, 247, 0.1);
            color: var(--primary);
            padding: 8px 15px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 20px;
        }

        /* ========== MOBILE FILTERS ========== */
        .mobile-filters-bar {
            background: white;
            border-radius: 15px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }

        .mobile-filter-btn {
            padding: 10px 15px;
            border-radius: 12px;
            border: 2px solid #e2e8f0;
            background: white;
            font-weight: 600;
            color: var(--dark);
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
            cursor: pointer;
            min-height: 44px; /* Mobile touch target */
        }

        .mobile-filter-btn.active {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            border-color: var(--primary);
        }

        /* Mobile Sort Select */
        .mobile-sort-select {
            width: 100%;
            padding: 12px 15px;
            border-radius: 12px;
            border: 2px solid #e2e8f0;
            background: white;
            font-weight: 600;
            color: var(--dark);
            font-size: 1rem;
            margin-bottom: 15px;
            -webkit-appearance: none;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%234a6cf7' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 16px;
        }

        /* ========== MOBILE PRODUCT CARD ========== */
        .mobile-product-card {
            background: white;
            border-radius: 15px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
            transition: transform 0.3s ease;
            position: relative;
            border: 1px solid rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .mobile-product-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
        }

        .mobile-product-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: linear-gradient(135deg, var(--accent) 0%, #ff8a9e 100%);
            color: white;
            font-size: 12px;
            font-weight: 700;
            padding: 6px 12px;
            border-radius: 20px;
            z-index: 2;
            box-shadow: 0 4px 15px rgba(255, 107, 139, 0.4);
        }

        .mobile-product-image {
            height: 180px;
            width: 100%;
            object-fit: contain;
            margin-bottom: 15px;
            padding: 10px;
            background: linear-gradient(135deg, #f8fafc 0%, #e4edf5 100%);
            border-radius: 12px;
        }

        .mobile-product-title {
            font-size: 1rem;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 10px;
            line-height: 1.3;
            min-height: 42px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .mobile-product-price {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
            margin: 15px 0;
        }

        .mobile-current-price {
            font-size: 1.3rem;
            font-weight: 800;
            color: var(--primary);
        }

        .mobile-original-price {
            font-size: 0.9rem;
            color: var(--text);
            text-decoration: line-through;
            opacity: 0.7;
        }

        .mobile-discount-percent {
            font-size: 0.85rem;
            font-weight: 700;
            color: var(--success);
            background: rgba(40, 167, 69, 0.1);
            padding: 4px 10px;
            border-radius: 15px;
        }

        /* Mobile View Button */
        .mobile-view-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border: none;
            border-radius: 12px;
            color: white;
            font-weight: 700;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 6px 20px rgba(74, 108, 247, 0.3);
            min-height: 48px;
        }

        .mobile-view-btn:hover {
            color: white;
            text-decoration: none;
        }

        /* ========== MOBILE PAGINATION ========== */
        .mobile-pagination {
            display: flex;
            justify-content: center;
            gap: 5px;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        .mobile-page-btn {
            width: 44px;
            height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: white;
            border: 2px solid #e2e8f0;
            color: var(--dark);
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }

        .mobile-page-btn.active {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            border-color: var(--primary);
            box-shadow: 0 5px 15px rgba(74, 108, 247, 0.4);
        }

        /* ========== MOBILE FLOATING BUTTONS ========== */
        .mobile-floating-buttons {
            position: fixed;
            bottom: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            z-index: 1000;
        }

        .mobile-floating-btn {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            box-shadow: 0 10px 25px rgba(74, 108, 247, 0.4);
            border: 3px solid white;
            cursor: pointer;
            animation: float 3s ease-in-out infinite;
        }

        .mobile-floating-btn:nth-child(2) {
            animation-delay: 0.5s;
            background: linear-gradient(135deg, var(--accent) 0%, #ff8a9e 100%);
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }

        /* ========== NO PRODUCTS MOBILE ========== */
        .mobile-no-products {
            text-align: center;
            padding: 40px 20px;
            background: white;
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            margin-top: 20px;
        }

        .mobile-no-products i {
            font-size: 3rem;
            color: var(--primary);
            margin-bottom: 15px;
            opacity: 0.7;
        }

        .mobile-no-products h3 {
            font-size: 1.3rem;
            color: var(--dark);
            margin-bottom: 10px;
        }

        /* ========== DESKTOP STYLES (Overrides) ========== */
        @media (min-width: 768px) {
            body {
                padding-top: 80px;
                padding-bottom: 40px;
            }
            
            .main-wrapper {
                max-width: 1600px;
                padding: 0 40px;
                margin: 40px auto;
            }
            
            /* Hide mobile elements on desktop */
            .mobile-category-toggle,
            .mobile-category-sidebar,
            .mobile-category-overlay,
            .mobile-floating-buttons {
                display: none !important;
            }
            
            /* Show desktop layout */
            .row {
                display: flex !important;
            }
            
            /* Desktop Category Sidebar */
            .category-sidebar {
                display: block !important;
                background: white;
                border-radius: 20px;
                box-shadow: var(--desktop-shadow);
                overflow: hidden;
                border: 1px solid rgba(0, 0, 0, 0.05);
                position: sticky;
                top: 120px;
                height: fit-content;
                margin-right: 30px;
            }
            
            .category-header {
                background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
                color: white;
                padding: 20px;
                font-weight: 700;
                font-size: 1.2rem;
                text-align: center;
                letter-spacing: 0.5px;
            }
            
            .category-list {
                padding: 20px 0;
            }
            
            .category-item {
                padding: 16px 25px;
                border-bottom: 1px solid rgba(0, 0, 0, 0.05);
                font-weight: 600;
                cursor: pointer;
                text-decoration: none;
                display: block;
                color: var(--text);
                transition: all 0.3s ease;
                position: relative;
                font-size: 1rem;
            }
            
            .category-item:hover {
                background: rgba(74, 108, 247, 0.08);
                color: var(--primary);
                padding-left: 35px;
            }
            
            .category-item.active {
                background: linear-gradient(90deg, rgba(74, 108, 247, 0.15) 0%, rgba(74, 108, 247, 0.05) 100%);
                color: var(--primary);
                border-left: 4px solid var(--primary);
                font-weight: 700;
                padding-left: 35px;
            }
            
            /* Desktop Products Container */
            .products-container {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(25px);
                -webkit-backdrop-filter: blur(25px);
                border-radius: 28px;
                padding: 40px;
                margin-top: 0;
                box-shadow: var(--desktop-shadow);
                border: 1px solid rgba(255, 255, 255, 0.25);
            }
            
            .section-title {
                text-align: center;
                font-weight: 800;
                font-size: 2.5rem;
                color: var(--dark);
                margin-bottom: 40px;
                position: relative;
                font-family: 'Montserrat', sans-serif;
            }
            
            .section-title::after {
                content: '';
                width: 80px;
                height: 5px;
                background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
                position: absolute;
                bottom: -15px;
                left: 50%;
                transform: translateX(-50%);
                border-radius: 5px;
                box-shadow: 0 5px 15px rgba(74, 108, 247, 0.4);
            }
            
            /* Desktop Product Cards */
            .product-card {
                background: white;
                border-radius: 20px;
                padding: 25px;
                box-shadow: 0 15px 40px rgba(0, 0, 0, 0.08);
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                position: relative;
                overflow: hidden;
                border: 1px solid rgba(0, 0, 0, 0.05);
                height: 100%;
                display: flex;
                flex-direction: column;
            }
            
            .product-card:hover {
                transform: translateY(-15px) scale(1.02);
                box-shadow: 0 25px 60px rgba(0, 0, 0, 0.15);
            }
            
            .product-badge {
                position: absolute;
                top: 20px;
                right: 20px;
                background: linear-gradient(135deg, var(--accent) 0%, #ff8a9e 100%);
                color: white;
                font-size: 14px;
                font-weight: 700;
                padding: 8px 16px;
                border-radius: 20px;
                z-index: 2;
                box-shadow: 0 8px 20px rgba(255, 107, 139, 0.4);
            }
            
            .product-image-container {
                height: 220px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 20px;
                overflow: hidden;
                border-radius: 15px;
                background: linear-gradient(135deg, #f8fafc 0%, #e4edf5 100%);
                padding: 20px;
            }
            
            .product-img {
                height: 100%;
                width: auto;
                max-width: 100%;
                object-fit: contain;
                transition: transform 0.5s ease;
            }
            
            .product-card:hover .product-img {
                transform: scale(1.15);
            }
            
            /* Desktop Filters */
            .filters-bar {
                background: white;
                border-radius: 15px;
                padding: 20px;
                margin-bottom: 30px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                gap: 15px;
                border: 1px solid rgba(0, 0, 0, 0.05);
            }
            
            /* Desktop Pagination */
            .pagination-custom .page-link {
                border: none;
                color: var(--text);
                font-weight: 600;
                border-radius: 10px;
                margin: 0 5px;
                transition: all 0.3s ease;
            }
            
            .pagination-custom .page-item.active .page-link {
                background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
                color: white;
                box-shadow: 0 5px 15px rgba(74, 108, 247, 0.4);
            }
        }

        /* ========== TABLET OPTIMIZATION ========== */
        @media (min-width: 576px) and (max-width: 991px) {
            .mobile-product-card {
                padding: 20px;
            }
            
            .mobile-product-image {
                height: 200px;
            }
            
            .mobile-filters-bar {
                justify-content: space-between;
            }
        }

        /* ========== ANIMATIONS ========== */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .fade-in {
            animation: fadeIn 0.6s ease forwards;
        }

        /* ========== TOUCH OPTIMIZATIONS ========== */
        @media (hover: none) and (pointer: coarse) {
            .mobile-product-card:hover,
            .mobile-view-btn:hover,
            .mobile-filter-btn:hover {
                transform: none !important;
            }
            
            .mobile-product-card:active,
            .mobile-view-btn:active,
            .mobile-filter-btn:active {
                transform: scale(0.98) !important;
                opacity: 0.9;
            }
            
            /* Prevent text selection on mobile */
            .mobile-filter-btn,
            .mobile-view-btn,
            .mobile-page-btn {
                -webkit-user-select: none;
                user-select: none;
            }
        }

        /* ========== DARK MODE SUPPORT ========== */
        @media (prefers-color-scheme: dark) {
            body {
                background: linear-gradient(135deg, #121212 0%, #1e1e1e 100%);
                color: #e0e0e0;
            }
            
            .mobile-products-container,
            .mobile-product-card,
            .mobile-filters-bar,
            .mobile-no-products {
                background: #2a2a2a;
                color: #e0e0e0;
                border-color: #333;
            }
            
            .mobile-product-title,
            .mobile-section-title {
                color: #e0e0e0;
            }
            
            .mobile-filter-btn {
                background: #333;
                border-color: #444;
                color: #e0e0e0;
            }
            
            .mobile-sort-select {
                background: #333;
                border-color: #444;
                color: #e0e0e0;
            }
            
            @media (min-width: 768px) {
                .products-container,
                .category-sidebar,
                .product-card,
                .filters-bar {
                    background: #2a2a2a;
                    border-color: #333;
                }
                
                .category-item {
                    color: #b0b0b0;
                    border-color: #444;
                }
                
                .product-title {
                    color: #e0e0e0;
                }
            }
        }
    </style>
</head>

<body>

<%@ include file="header1.jsp" %>

<!-- Mobile Category Toggle Button -->
<button class="mobile-category-toggle fade-in" onclick="toggleMobileCategories()">
    <i class="fas fa-filter"></i> Browse Categories
</button>

<!-- Mobile Category Sidebar -->
<div class="mobile-category-overlay" onclick="closeMobileCategories()"></div>
<div class="mobile-category-sidebar">
    <div class="mobile-category-close" onclick="closeMobileCategories()">
        <i class="fas fa-times"></i>
    </div>
    
    <h4 class="mb-4"><i class="fas fa-tags me-2"></i>Categories</h4>
    
    <div class="mobile-category-list">
        <!-- All Products -->
        <a href="/products"
           class="category-item mobile-category-item ${empty param.category ? 'active' : ''}"
           onclick="closeMobileCategories()">
            <i class="fas fa-boxes me-2"></i>All Products
            <span class="badge bg-light text-dark float-end">${fn:length(products)}</span>
        </a>
        
        <!-- Category List -->
        <c:forEach var="c" items="${categories}" varStatus="status">
            <a href="/products?category=${c.name}"
               class="category-item mobile-category-item ${param.category eq c.name ? 'active' : ''}"
               onclick="closeMobileCategories()">
                <i class="fas fa-tag me-2"></i>${c.name}
                <c:set var="categoryCount" value="0" />
                <c:forEach var="p" items="${products}">
                    <c:if test="${p.category eq c.name}">
                        <c:set var="categoryCount" value="${categoryCount + 1}" />
                    </c:if>
                </c:forEach>
                <span class="badge bg-light text-dark float-end">${categoryCount}</span>
            </a>
        </c:forEach>
    </div>
</div>

<!-- Main Container -->
<div class="main-wrapper">
    <div class="row">
        <!-- Desktop Category Sidebar (Hidden on Mobile) -->
        <div class="col-lg-3 col-md-4 d-none d-md-block">
            <div class="category-sidebar fade-in">
                <div class="category-header">
                    <i class="fas fa-filter me-2"></i>Categories
                </div>
                <div class="category-list">
                    <!-- All Products -->
                    <a href="/products"
                       class="category-item ${empty param.category ? 'active' : ''}">
                        <i class="fas fa-boxes me-2"></i>All Products
                        <span class="badge bg-light text-dark float-end">${fn:length(products)}</span>
                    </a>
                    
                    <!-- Category List -->
                    <c:forEach var="c" items="${categories}" varStatus="status">
                        <a href="/products?category=${c.name}"
                           class="category-item ${param.category eq c.name ? 'active' : ''}">
                            <i class="fas fa-tag me-2"></i>${c.name}
                            <c:set var="categoryCount" value="0" />
                            <c:forEach var="p" items="${products}">
                                <c:if test="${p.category eq c.name}">
                                    <c:set var="categoryCount" value="${categoryCount + 1}" />
                                </c:if>
                            </c:forEach>
                            <span class="badge bg-light text-dark float-end">${categoryCount}</span>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- Products Section -->
        <div class="col-lg-9 col-md-8 col-12">
            <!-- Mobile Products Container -->
            <div class="mobile-products-container fade-in">
                <!-- Mobile Header -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h2 class="mobile-section-title mb-2">
                            <c:choose>
                                <c:when test="${not empty param.categories}">
                                    ${param.categories}
                                </c:when>
                                <c:otherwise>
                                    All Products
                                </c:otherwise>
                            </c:choose>
                        </h2>
                        <div class="mobile-product-count">
                            <i class="fas fa-box"></i> ${fn:length(products)} Products
                        </div>
                    </div>
                </div>

<!--                 Mobile Filters
                <div class="mobile-filters-bar fade-in" style="animation-delay: 0.1s">
                    <select class="mobile-sort-select" onchange="handleSortChange(this)">
                        <option value="featured">Featured</option>
                        <option value="price-low">Price: Low to High</option>
                        <option value="price-high">Price: High to Low</option>
                        <option value="newest">Newest First</option>
                        <option value="popular">Most Popular</option>
                    </select>
                    
                    <button class="mobile-filter-btn" onclick="toggleFilter('price')">
                        <i class="fas fa-dollar-sign"></i> Price
                    </button>
                    <button class="mobile-filter-btn" onclick="toggleFilter('discount')">
                        <i class="fas fa-percentage"></i> Discount
                    </button>
                    <button class="mobile-filter-btn" onclick="toggleFilter('availability')">
                        <i class="fas fa-check-circle"></i> In Stock
                    </button>
                </div>
 -->
                <!-- Products Grid -->
                <c:choose>
                    <c:when test="${not empty products}">
                        <div class="row">
                            <c:forEach var="p" items="${products}" varStatus="status">
                                <div class="col-12 col-sm-6 col-md-6 col-lg-4 mb-4 fade-in"
                                     style="animation-delay: ${status.index * 0.1}s">
                                    <div class="mobile-product-card">
                                        <c:if test="${p.discount > 0}">
                                            <span class="mobile-product-badge">${p.discount}% OFF</span>
                                        </c:if>
                                        
                                        <img src="../assets/img/product_img/${p.image}"
                                             class="mobile-product-image"
                                             alt="${p.title}"
                                             onerror="this.src='https://via.placeholder.com/300x300?text=Product+Image'">
                                        
                                        <h3 class="mobile-product-title">${p.title}</h3>
                                        
                                        <div class="mobile-product-price">
                                            <span class="mobile-current-price">₹${p.discountPrice}</span>
                                            <c:if test="${p.discount > 0}">
                                                <span class="mobile-original-price">₹${p.price}</span>
                                                <span class="mobile-discount-percent">Save ${p.discount}%</span>
                                            </c:if>
                                        </div>
                                        
                                        <a href="/view?id=${p.id}" class="mobile-view-btn">
                                            <i class="fas fa-eye me-2"></i> View Details
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <!-- Mobile Pagination -->
                        <c:if test="${fn:length(products) > 12}">
                            <div class="mobile-pagination fade-in">
                                <a href="#" class="mobile-page-btn">
                                    <i class="fas fa-chevron-left"></i>
                                </a>
                                <a href="#" class="mobile-page-btn active">1</a>
                                <a href="#" class="mobile-page-btn">2</a>
                                <a href="#" class="mobile-page-btn">3</a>
                                <span class="mobile-page-btn">...</span>
                                <a href="#" class="mobile-page-btn">5</a>
                                <a href="#" class="mobile-page-btn">
                                    <i class="fas fa-chevron-right"></i>
                                </a>
                            </div>
                        </c:if>
                    </c:when>
                    
                    <c:otherwise>
                        <!-- No Products Mobile -->
                        <div class="mobile-no-products fade-in">
                            <i class="fas fa-box-open"></i>
                            <h3>No Products Found</h3>
                            <p class="mb-4">We couldn't find any products matching your criteria.</p>
                            <a href="/products" class="mobile-view-btn" style="width: auto; padding: 12px 30px;">
                                <i class="fas fa-arrow-left me-2"></i> Browse All Products
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <!-- Desktop Products Container (Hidden on Mobile) -->
<%--             <div class="products-container d-none d-md-block fade-in" style="animation-delay: 0.2s">
                <!-- Desktop content remains same as your original -->
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap">
                    <div class="mb-3 mb-md-0">
                        <h1 class="section-title mb-0">
                            <c:choose>
                                <c:when test="${not empty param.categories}">
                                    ${param.categories}
                                </c:when>
                                <c:otherwise>
                                    All Products
                                </c:otherwise>
                            </c:choose>
                        </h1>
                        <p class="text-muted mt-2">
                            Discover our premium collection of quality products
                        </p>
                    </div>
                    <div class="product-count">
                        <i class="fas fa-box me-2"></i>${fn:length(products)} Products
                    </div>
                </div>

                <!-- Desktop Filters -->
                <div class="filters-bar mb-5 fade-in" style="animation-delay: 0.3s">
                    <div class="d-flex align-items-center flex-wrap">
                        <span class="filter-label"><i class="fas fa-sort me-2"></i>Sort by:</span>
                        <select class="sort-select" onchange="handleDesktopSortChange(this)">
                            <option>Featured</option>
                            <option>Price: Low to High</option>
                            <option>Price: High to Low</option>
                            <option>Newest First</option>
                            <option>Best Selling</option>
                        </select>
                    </div>
                    
                    <div class="d-flex align-items-center flex-wrap">
                        <span class="filter-label me-3"><i class="fas fa-filter me-2"></i>Filters:</span>
                        <button class="btn btn-outline-primary me-2 mb-2 mb-md-0">Price</button>
                        <button class="btn btn-outline-primary me-2 mb-2 mb-md-0">Discount</button>
                        <button class="btn btn-outline-primary mb-2 mb-md-0">Availability</button>
                    </div>
                </div>

                <!-- Desktop Products Grid -->
                <c:if test="${not empty products}">
                    <div class="row g-4">
                        <c:forEach var="p" items="${products}" varStatus="status">
                            <div class="col-xl-4 col-lg-6 col-md-6 fade-in" 
                                 style="animation-delay: ${status.index * 0.1}s">
                                <div class="product-card">
                                    <c:if test="${p.discount > 0}">
                                        <span class="product-badge">${p.discount}% OFF</span>
                                    </c:if>
                                    
                                    <div class="product-image-container">
                                        <img src="../assets/img/product_img/${p.image}"
                                             class="product-img" alt="${p.title}"
                                             onerror="this.src='https://via.placeholder.com/300x300?text=Product+Image'">
                                    </div>
                                    
                                    <h3 class="product-title">${p.title}</h3>
                                    
                                    <div class="product-price-container">
                                        <span class="current-price">₹${p.discountPrice}</span>
                                        <c:if test="${p.discount > 0}">
                                            <span class="original-price">₹${p.price}</span>
                                            <span class="discount-percent">Save ${p.discount}%</span>
                                        </c:if>
                                    </div>
                                    
                                    <div class="mt-auto pt-3">
                                        <a href="/view?id=${p.id}" class="view-details-btn">
                                            <i class="fas fa-eye me-2"></i>View Details
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <!-- Desktop Pagination -->
                    <c:if test="${fn:length(products) > 12}">
                        <div class="d-flex justify-content-center mt-5 fade-in">
                            <nav aria-label="Product pagination">
                                <ul class="pagination pagination-custom">
                                    <li class="page-item"><a class="page-link" href="#"><i class="fas fa-chevron-left"></i></a></li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a></li>
                                </ul>
                            </nav>
                        </div>
                    </c:if>
                </c:if>
            </div>
 --%>        </div>
    </div>
</div>

<!-- Mobile Floating Buttons -->
<div class="mobile-floating-buttons d-md-none">
    <div class="mobile-floating-btn" onclick="toggleMobileCategories()" title="Browse Categories">
        <i class="fas fa-filter"></i>
    </div>
    <div class="mobile-floating-btn" onclick="scrollToTop()" title="Scroll to Top">
        <i class="fas fa-arrow-up"></i>
    </div>
</div>

<%@ include file="Footar.jsp" %>

<script>
    // ========== MOBILE CATEGORY SIDEBAR ==========
    function toggleMobileCategories() {
        const sidebar = document.querySelector('.mobile-category-sidebar');
        const overlay = document.querySelector('.mobile-category-overlay');
        sidebar.classList.toggle('active');
        overlay.classList.toggle('active');
        document.body.style.overflow = sidebar.classList.contains('active') ? 'hidden' : '';
        
        // Mobile vibration
        if (navigator.vibrate) navigator.vibrate(30);
    }

    function closeMobileCategories() {
        const sidebar = document.querySelector('.mobile-category-sidebar');
        const overlay = document.querySelector('.mobile-category-overlay');
        sidebar.classList.remove('active');
        overlay.classList.remove('active');
        document.body.style.overflow = '';
    }

    // ========== MOBILE FILTERS ==========
    let activeFilters = new Set();

    function toggleFilter(filterType) {
        const button = event.target.closest('.mobile-filter-btn');
        button.classList.toggle('active');
        
        if (activeFilters.has(filterType)) {
            activeFilters.delete(filterType);
        } else {
            activeFilters.add(filterType);
        }
        
        // Mobile vibration feedback
        if (navigator.vibrate) navigator.vibrate(20);
        
        // Show filter count
        updateFilterCount();
        
        console.log('Active filters:', Array.from(activeFilters));
    }

    function updateFilterCount() {
        const filterButtons = document.querySelectorAll('.mobile-filter-btn');
        filterButtons.forEach(btn => {
            const icon = btn.querySelector('i');
            const originalIcon = icon.className;
            
            // Remove count badge if exists
            const existingBadge = btn.querySelector('.filter-count');
            if (existingBadge) existingBadge.remove();
            
            // Add count if filter is active
            if (btn.classList.contains('active')) {
                const filterType = btn.textContent.toLowerCase().replace(/[^a-z]/g, '');
                const count = activeFilters.has(filterType) ? 1 : 0;
                
                if (count > 0) {
                    const badge = document.createElement('span');
                    badge.className = 'filter-count';
                    badge.textContent = count;
                    badge.style.cssText = `
                        position: absolute;
                        top: -5px;
                        right: -5px;
                        background: var(--accent);
                        color: white;
                        font-size: 10px;
                        font-weight: bold;
                        width: 18px;
                        height: 18px;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        border: 2px solid white;
                    `;
                    btn.style.position = 'relative';
                    btn.appendChild(badge);
                }
            }
        });
    }

    // ========== SORTING ==========
    function handleSortChange(select) {
        const value = select.value;
        console.log('Sorting by:', value);
        
        // Mobile vibration
        if (navigator.vibrate) navigator.vibrate(10);
        
        // Show loading indicator
        showLoading('Sorting products...');
        
        // In real app, this would trigger AJAX request
        setTimeout(() => hideLoading(), 500);
    }

    function handleDesktopSortChange(select) {
        console.log('Desktop sorting by:', select.value);
        // Desktop sorting logic here
    }

    // ========== LOADING INDICATOR ==========
    function showLoading(message = 'Loading...') {
        // Remove existing loader
        hideLoading();
        
        const loader = document.createElement('div');
        loader.id = 'mobile-loader';
        loader.style.cssText = `
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0, 0, 0, 0.85);
            color: white;
            padding: 20px 30px;
            border-radius: 20px;
            z-index: 99999;
            display: flex;
            align-items: center;
            gap: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
        `;
        
        loader.innerHTML = `
            <i class="fas fa-spinner fa-spin" style="font-size: 1.5rem;"></i>
            <span>${message}</span>
        `;
        
        document.body.appendChild(loader);
    }

    function hideLoading() {
        const loader = document.getElementById('mobile-loader');
        if (loader) loader.remove();
    }

    // ========== SCROLL TO TOP ==========
    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
        
        // Mobile vibration
        if (navigator.vibrate) navigator.vibrate(30);
    }

    // ========== TOUCH OPTIMIZATIONS ==========
    document.addEventListener('DOMContentLoaded', function() {
        // Add touch feedback to all interactive elements
        const touchElements = document.querySelectorAll('.mobile-view-btn, .mobile-filter-btn, .mobile-page-btn');
        touchElements.forEach(el => {
            el.addEventListener('touchstart', function() {
                this.style.opacity = '0.8';
                this.style.transform = 'scale(0.97)';
            });
            
            el.addEventListener('touchend', function() {
                this.style.opacity = '';
                this.style.transform = '';
            });
        });
        
        // Product card touch effects
        const productCards = document.querySelectorAll('.mobile-product-card');
        productCards.forEach(card => {
            card.addEventListener('touchstart', function() {
                this.style.transform = 'scale(0.98)';
                this.style.boxShadow = '0 4px 15px rgba(0, 0, 0, 0.1)';
            });
            
            card.addEventListener('touchend', function() {
                this.style.transform = '';
                this.style.boxShadow = '';
            });
        });
        
        // Prevent zoom on double tap
        let lastTouchEnd = 0;
        document.addEventListener('touchend', function(event) {
            const now = Date.now();
            if (now - lastTouchEnd <= 300) {
                event.preventDefault();
            }
            lastTouchEnd = now;
        }, { passive: false });
        
        // Load initial state
        updateFilterCount();
        
        // Check if mobile
        const isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
        if (isMobile) {
            document.body.classList.add('mobile-device');
        }
    });

    // ========== IMAGE LAZY LOADING ==========
    document.addEventListener('DOMContentLoaded', function() {
        const images = document.querySelectorAll('.mobile-product-image, .product-img');
        
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    img.src = img.dataset.src || img.src;
                    img.classList.add('loaded');
                    observer.unobserve(img);
                }
            });
        }, { rootMargin: '50px' });
        
        images.forEach(img => {
            if (img.dataset.src) {
                imageObserver.observe(img);
            }
        });
    });

    // ========== RESIZE HANDLER ==========
    window.addEventListener('resize', function() {
        // Close mobile sidebar on resize to desktop
        if (window.innerWidth >= 768) {
            closeMobileCategories();
        }
    });

    // ========== KEYBOARD NAVIGATION ==========
    document.addEventListener('keydown', function(e) {
        // Escape key closes mobile sidebar
        if (e.key === 'Escape') {
            closeMobileCategories();
        }
    });
</script>
</body>
</html>