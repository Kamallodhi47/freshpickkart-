<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Offers</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <style>
        :root {
            --primary-color: #0d6efd;
            --danger-color: #dc3545;
            --shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }
        
        .bg-section {
            background: #f8f9fa;
            padding: 30px 15px;
            min-height: 100vh;
        }
        
        .section-title {
            text-align: center;
            font-weight: 700;
            margin-bottom: 30px;
            color: #333;
            font-size: 2rem;
        }
        
        .offer-row {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        
        .offer-card {
            border-radius: 12px;
            padding: 20px 15px;
            background: white;
            width: 250px;
            transition: all 0.3s ease;
            box-shadow: var(--shadow);
            display: flex;
            flex-direction: column;
            position: relative;
            overflow: hidden;
            border: 1px solid #eee;
        }
        
        .offer-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
        }
        
        .discount-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: var(--danger-color);
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: 600;
            font-size: 0.85rem;
            z-index: 2;
        }
        
        .offer-img-container {
            width: 100%;
            height: 180px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }
        
        .offer-img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            transition: transform 0.3s ease;
        }
        
        .offer-card:hover .offer-img {
            transform: scale(1.05);
        }
        
        .product-title {
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
            font-size: 1rem;
            line-height: 1.4;
            height: 42px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        
        .price-container {
            margin-bottom: 15px;
        }
        
        .discount-price {
            color: var(--danger-color);
            font-weight: 700;
            font-size: 1.3rem;
            margin-right: 8px;
        }
        
        .original-price {
            color: #888;
            text-decoration: line-through;
            font-size: 0.95rem;
        }
        
        .add-to-cart-btn {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: auto;
        }
        
        .add-to-cart-btn:hover {
            background: #0b5ed7;
            transform: scale(1.02);
        }
        
        .add-to-cart-btn i {
            margin-right: 6px;
        }
        
        /* Responsive adjustments - Desktop first approach */
        
        /* Large tablets and small laptops */
        @media (max-width: 1200px) {
            .offer-card {
                width: 230px;
            }
            
            .offer-img-container {
                height: 170px;
            }
        }
        
        /* Tablets */
        @media (max-width: 992px) {
            .offer-card {
                width: 200px;
                padding: 18px 12px;
            }
            
            .offer-img-container {
                height: 160px;
            }
            
            .section-title {
                font-size: 1.8rem;
                margin-bottom: 25px;
            }
            
            .product-title {
                font-size: 0.95rem;
                height: 40px;
            }
            
            .discount-price {
                font-size: 1.2rem;
            }
            
            .original-price {
                font-size: 0.9rem;
            }
        }
        
        /* Mobile Landscape and Small Tablets */
        @media (max-width: 768px) {
            .offer-card {
                width: calc(50% - 15px);
                min-width: 170px;
                padding: 16px 10px;
            }
            
            .bg-section {
                padding: 25px 10px;
            }
            
            .section-title {
                font-size: 1.6rem;
                margin-bottom: 20px;
            }
            
            .offer-img-container {
                height: 150px;
                margin-bottom: 12px;
            }
            
            .discount-badge {
                font-size: 0.8rem;
                padding: 4px 8px;
                top: 10px;
                left: 10px;
            }
            
            .product-title {
                font-size: 0.9rem;
                height: 38px;
                margin-bottom: 8px;
            }
            
            .discount-price {
                font-size: 1.1rem;
            }
            
            .original-price {
                font-size: 0.85rem;
            }
            
            .price-container {
                margin-bottom: 12px;
            }
            
            .add-to-cart-btn {
                padding: 7px 12px;
                font-size: 0.9rem;
            }
            
            .add-to-cart-btn i {
                margin-right: 4px;
            }
        }
        
        /* Mobile Portrait */
        @media (max-width: 576px) {
            .offer-card {
                width: calc(50% - 10px);
                min-width: 155px;
                padding: 14px 8px;
            }
            
            .offer-row {
                gap: 10px;
            }
            
            .section-title {
                font-size: 1.5rem;
                margin-bottom: 20px;
            }
            
            .offer-img-container {
                height: 140px;
            }
            
            .discount-badge {
                font-size: 0.75rem;
                padding: 3px 7px;
                top: 8px;
                left: 8px;
            }
            
            .product-title {
                font-size: 0.85rem;
                height: 36px;
                line-height: 1.3;
            }
            
            .discount-price {
                font-size: 1rem;
            }
            
            .original-price {
                font-size: 0.8rem;
            }
            
            .add-to-cart-btn {
                padding: 6px 10px;
                font-size: 0.85rem;
            }
            
            .add-to-cart-btn i {
                font-size: 0.8rem;
            }
        }
        
        /* Small Mobile Devices */
        @media (max-width: 480px) {
            .offer-card {
                width: 100%;
                max-width: 250px;
                margin: 0 auto;
                padding: 14px 10px;
            }
            
            .offer-row {
                gap: 12px;
            }
            
            .section-title {
                font-size: 1.4rem;
            }
            
            .offer-img-container {
                height: 140px;
            }
            
            .product-title {
                font-size: 0.9rem;
            }
            
            .discount-price {
                font-size: 1.1rem;
            }
        }
        
        /* Very Small Mobile Devices */
        @media (max-width: 360px) {
            .offer-card {
                padding: 12px 8px;
                max-width: 220px;
            }
            
            .section-title {
                font-size: 1.3rem;
            }
            
            .offer-img-container {
                height: 130px;
            }
            
            .discount-badge {
                font-size: 0.7rem;
                padding: 3px 6px;
            }
            
            .product-title {
                font-size: 0.8rem;
                height: 34px;
            }
            
            .discount-price {
                font-size: 0.95rem;
            }
            
            .original-price {
                font-size: 0.75rem;
            }
            
            .add-to-cart-btn {
                padding: 5px 8px;
                font-size: 0.8rem;
            }
            
            .add-to-cart-btn i {
                font-size: 0.75rem;
            }
        }
        
        /* No products message */
        .no-offers {
            text-align: center;
            padding: 40px 20px;
            color: #666;
            font-size: 1.2rem;
        }
        
        .no-offers i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #ddd;
        }
        
        /* Mobile adjustments for no offers message */
        @media (max-width: 768px) {
            .no-offers {
                padding: 30px 15px;
                font-size: 1rem;
            }
            
            .no-offers i {
                font-size: 2.5rem;
                margin-bottom: 12px;
            }
        }
        
        @media (max-width: 480px) {
            .no-offers {
                padding: 25px 10px;
                font-size: 0.95rem;
            }
            
            .no-offers i {
                font-size: 2rem;
            }
        }
    </style>
</head>
<%@ include file="header1.jsp" %>
<body>

<div class="bg-section">
    <div class="container">
        <h2 class="section-title">Top Offers</h2>
        
        <div class="offer-row">
            <c:choose>
                <c:when test="${not empty offerProducts}">
                    <c:forEach var="o" items="${offerProducts}">
                        <div class="offer-card">
                            <c:set var="discountPercent" value="${((o.price - o.discountPrice) / o.price) * 100}" />
                            
                            <div class="discount-badge">
                                ${fn:substringBefore(discountPercent, '.')}% OFF
                            </div>
                            
                            <div class="offer-img-container">
                                <img src="${pageContext.request.contextPath}/assets/img/product_img/${o.image}" 
                                     class="offer-img" 
                                     alt="${o.title}"
                                     onerror="this.onerror=null; this.src='https://via.placeholder.com/200x200?text=Product+Image'">
                            </div>
                            
                            <p class="product-title">${o.title}</p>
                            
                            <div class="price-container">
                                <span class="discount-price">₹${o.discountPrice}</span>
                                <span class="original-price">₹${o.price}</span>
                            </div>
                            
                            <button class="add-to-cart-btn">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="no-offers">
                        <i class="fas fa-tags"></i>
                        <p>No offers available at the moment.</p>
                        <p class="small text-muted">Check back later for exciting deals!</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script>
    // Mobile touch improvements
    document.addEventListener('DOMContentLoaded', function() {
        // Add to cart button functionality
        const addToCartButtons = document.querySelectorAll('.add-to-cart-btn');
        
        addToCartButtons.forEach(button => {
            // Add touch feedback for mobile
            button.addEventListener('touchstart', function() {
                this.style.transform = 'scale(0.98)';
            });
            
            button.addEventListener('touchend', function() {
                this.style.transform = '';
            });
            
            button.addEventListener('click', function() {
                // Visual feedback when button is clicked
                const originalText = this.innerHTML;
                this.innerHTML = '<i class="fas fa-check"></i> Added!';
                this.style.background = '#198754';
                this.style.transform = '';
                
                // Reset button after 1.5 seconds
                setTimeout(() => {
                    this.innerHTML = originalText;
                    this.style.background = '';
                }, 1500);
                
                // In a real application, you would add the product to cart here
                console.log('Product added to cart');
            });
        });
        
        // Better touch handling for cards on mobile
        const offerCards = document.querySelectorAll('.offer-card');
        offerCards.forEach(card => {
            // Prevent hover effects from sticking on touch devices
            card.addEventListener('touchstart', function() {
                this.classList.add('active');
            });
            
            card.addEventListener('touchend', function() {
                this.classList.remove('active');
            });
        });
    });
</script>

</body>
</html>