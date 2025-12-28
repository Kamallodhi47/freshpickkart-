<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
:root {
	--primary: #4361ee;
	--secondary: #3a0ca3;
	--success: #4cc9f0;
	--warning: #f8961e;
	--info: #4895ef;
	--light: #f8f9fa;
	--dark: #212529;
	--gradient-primary: linear-gradient(135deg, #4361ee, #3a0ca3);
	--gradient-success: linear-gradient(135deg, #4cc9f0, #4895ef);
	--gradient-warning: linear-gradient(135deg, #f8961e, #f3722c);
	--gradient-danger: linear-gradient(135deg, #e63946, #f72585);
	--shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	--shadow-hover: 0 20px 40px rgba(0, 0, 0, 0.15);
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
	min-height: 100vh;
	color: var(--dark);
	/* Header ke liye space */
	padding-top: 80px;
}

/* Header ko fix karenge */
.navbar-fixed {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1030;
	background: rgba(255, 255, 255, 0.95);
	backdrop-filter: blur(10px);
	box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
}

.dashboard-container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 30px 20px;
}

.dashboard-header {
	text-align: center;
	margin-bottom: 50px;
	padding-top: 20px;
}

.dashboard-title {
	font-size: 2.8rem;
	font-weight: 700;
	background: var(--gradient-primary);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	margin-bottom: 15px;
	position: relative;
	display: inline-block;
}

.dashboard-title::after {
	content: '';
	position: absolute;
	bottom: -15px;
	left: 50%;
	transform: translateX(-50%);
	width: 120px;
	height: 4px;
	background: var(--gradient-primary);
	border-radius: 2px;
}

.dashboard-subtitle {
	color: #6c757d;
	font-size: 1.2rem;
	font-weight: 400;
	margin-top: 25px;
}

.card-dashboard {
	background: white;
	border-radius: 20px;
	box-shadow: var(--shadow);
	transition: all 0.4s ease;
	border: none;
	overflow: hidden;
	height: 100%;
	position: relative;
	min-height: 220px;
}

.card-dashboard::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 6px;
	background: var(--gradient-primary);
}

.card-dashboard:hover {
	transform: translateY(-12px) scale(1.02);
	box-shadow: var(--shadow-hover);
}

.card-dashboard-success::before {
	background: var(--gradient-success);
}

.card-dashboard-warning::before {
	background: var(--gradient-warning);
}

.card-dashboard-info::before {
	background: var(--gradient-primary);
}

.card-dashboard-danger::before {
	background: var(--gradient-danger);
}

.card-body-dashboard {
	padding: 35px 25px;
	text-align: center;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100%;
}

.dashboard-icon {
	font-size: 3.8rem;
	margin-bottom: 20px;
	background: var(--gradient-primary);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	transition: all 0.4s ease;
	filter: drop-shadow(0 5px 15px rgba(0, 0, 0, 0.1));
}

.card-dashboard:hover .dashboard-icon {
	transform: scale(1.15) rotate(5deg);
	filter: drop-shadow(0 8px 20px rgba(0, 0, 0, 0.2));
}

.card-dashboard-success .dashboard-icon {
	background: var(--gradient-success);
	-webkit-background-clip: text;
}

.card-dashboard-warning .dashboard-icon {
	background: var(--gradient-warning);
	-webkit-background-clip: text;
}

.card-dashboard-info .dashboard-icon {
	background: var(--gradient-primary);
	-webkit-background-clip: text;
}

.card-dashboard-danger .dashboard-icon {
	background: var(--gradient-danger);
	-webkit-background-clip: text;
}

.dashboard-card-title {
	font-size: 1.5rem;
	font-weight: 700;
	margin-bottom: 12px;
	color: var(--dark);
	line-height: 1.3;
}

.dashboard-card-desc {
	color: #6c757d;
	font-size: 1rem;
	line-height: 1.5;
	margin-bottom: 0;
}

.dashboard-link {
	text-decoration: none;
	display: block;
	height: 100%;
	transition: all 0.3s ease;
}

.dashboard-link:hover {
	text-decoration: none;
	transform: translateY(-5px);
}

.stats-badge {
	position: absolute;
	top: 20px;
	right: 20px;
	background: var(--primary);
	color: white;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 0.9rem;
	font-weight: 700;
	box-shadow: 0 4px 10px rgba(67, 97, 238, 0.3);
	transition: all 0.3s ease;
}

.card-dashboard:hover .stats-badge {
	transform: scale(1.1);
	box-shadow: 0 6px 15px rgba(67, 97, 238, 0.4);
}

/* Animation for cards */
@keyframes fadeInUp {
	from {
		opacity: 0;
		transform: translateY(40px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

.dashboard-card-animate {
	animation: fadeInUp 0.8s ease forwards;
	opacity: 0;
}

/* Row spacing */
.dashboard-row {
	margin: 0 -15px;
}

/* Center align for 2 cards */
.dashboard-center {
	display: flex;
	justify-content: center;
}

/* Responsive adjustments */
@media (max-width: 768px) {
	body {
		padding-top: 70px;
	}
	
	.dashboard-container {
		padding: 20px 15px;
	}
	
	.dashboard-title {
		font-size: 2.2rem;
	}
	
	.dashboard-subtitle {
		font-size: 1.1rem;
	}
	
	.card-body-dashboard {
		padding: 25px 20px;
	}
	
	.dashboard-icon {
		font-size: 3rem;
	}
	
	.dashboard-card-title {
		font-size: 1.3rem;
	}
	
	.stats-badge {
		width: 35px;
		height: 35px;
		top: 15px;
		right: 15px;
	}
}

@media (max-width: 576px) {
	.dashboard-title {
		font-size: 1.8rem;
	}
	
	.card-body-dashboard {
		padding: 20px 15px;
	}
	
	.dashboard-icon {
		font-size: 2.5rem;
	}
	
	.dashboard-card-title {
		font-size: 1.2rem;
	}
}

/* Loading animation */
@keyframes pulse {
	0% { transform: scale(1); }
	50% { transform: scale(1.05); }
	100% { transform: scale(1); }
}

.loading {
	animation: pulse 1.5s ease-in-out infinite;
}
</style>
</head>
<body>
<section class="container-fluid p-4" style="margin-top: 50px;">
	<!-- Header with fixed positioning -->
	<div class="navbar-fixed">
		<%@ include file="header1.jsp"%>
	</div>
	
	<div class="dashboard-container">
		<div class="dashboard-header">
			<h1 class="dashboard-title">Admin Dashboard</h1>
			<p class="dashboard-subtitle">Manage your e-commerce platform efficiently</p>
		</div>

		<div class="row g-4 justify-content-center dashboard-row">
			<!-- User Management Card -->
			<div class="col-xl-4 col-lg-5 col-md-6 col-sm-8">
				<a href="/admin/users?type=1" class="dashboard-link">
					<div class="card-dashboard card-dashboard-info dashboard-card-animate"
						style="animation-delay: 0.1s;">
						<div class="card-body-dashboard">
							<i class="fas fa-users dashboard-icon"></i>
							<h3 class="dashboard-card-title">User Management</h3>
							<p class="dashboard-card-desc">Manage customer accounts, profiles and permissions</p>
							<c:if test="${not empty userCount}">
								<div class="stats-badge">${userCount}</div>
							</c:if>
							<c:if test="${empty userCount}">
								<div class="stats-badge">0</div>
							</c:if>
						</div>
					</div>
				</a>
			</div>

			<!-- Seller Management Card -->
			<div class="col-xl-4 col-lg-5 col-md-6 col-sm-8">
				<a href="admin/sellers" class="dashboard-link">
					<div class="card-dashboard card-dashboard-success dashboard-card-animate"
						style="animation-delay: 0.3s;">
						<div class="card-body-dashboard">
							<i class="fas fa-user-tie dashboard-icon"></i>
							<h3 class="dashboard-card-title">Seller Management</h3>
							<p class="dashboard-card-desc">Manage seller accounts, products and approvals</p>
							<c:if test="${not empty sellerCount}">
								<div class="stats-badge">${sellerCount}</div>
							</c:if>
							<c:if test="${empty sellerCount}">
								<div class="stats-badge">0</div>
							</c:if>
						</div>
					</div>
				</a>
			</div>
		</div>
		
		<!-- Additional Info Section -->
		<div class="row mt-5">
			<div class="col-12">
				<div class="text-center">
					<p class="text-muted mb-0">
						<i class="fas fa-info-circle me-2"></i>
						Select a management option above to get started
					</p>
				</div>
			</div>
		</div>
	</div>
	</section>
	<%@ include file="Footar.jsp"%>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
        // Add interactive effects
        document.addEventListener('DOMContentLoaded', function() {
            // Add hover effects to cards
            const cards = document.querySelectorAll('.card-dashboard');
            
            cards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-12px) scale(1.02)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });
            
            // Add click effect
            const links = document.querySelectorAll('.dashboard-link');
            
            links.forEach(link => {
                link.addEventListener('click', function(e) {
                    const card = this.querySelector('.card-dashboard');
                    card.style.transform = 'scale(0.95)';
                    card.classList.add('loading');
                    
                    setTimeout(() => {
                        card.style.transform = '';
                        card.classList.remove('loading');
                    }, 300);
                });
            });
            
            // Animate cards on scroll with better performance
            const animateOnScroll = function() {
                const cards = document.querySelectorAll('.dashboard-card-animate');
                
                cards.forEach(card => {
                    const cardPosition = card.getBoundingClientRect().top;
                    const screenPosition = window.innerHeight / 1.3;
                    
                    if (cardPosition < screenPosition) {
                        card.style.opacity = '1';
                        card.style.animationPlayState = 'running';
                    }
                });
            };
            
            // Use requestAnimationFrame for smoother scrolling
            let ticking = false;
            window.addEventListener('scroll', function() {
                if (!ticking) {
                    requestAnimationFrame(function() {
                        animateOnScroll();
                        ticking = false;
                    });
                    ticking = true;
                }
            });
            
            // Initial check in case cards are already in view
            animateOnScroll();
            
            // Add loaded class to body for any additional animations
            document.body.classList.add('loaded');
        });
    </script>
</body>
</html>