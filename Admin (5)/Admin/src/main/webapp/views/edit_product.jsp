<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product | Premium Store</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --danger-color: #f72585;
            --warning-color: #f8961e;
            --info-color: #4895ef;
            --border-radius: 12px;
            --box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            --transition: all 0.3s ease;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .card-premium {
            border: none;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            transition: var(--transition);
            background: white;
        }
        
        .card-premium:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }
        
        .card-header-premium {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1.5rem;
            border-bottom: none;
        }
        
        .card-header-premium h3 {
            margin: 0;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        .form-control-premium {
            border: 2px solid #e9ecef;
            border-radius: 8px;
            padding: 0.75rem 1rem;
            transition: var(--transition);
        }
        
        .form-control-premium:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
        }
        
        .btn-premium {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 8px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: var(--transition);
            color: white;
        }
        
        .btn-premium:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 14px rgba(67, 97, 238, 0.3);
            color: white;
        }
        
        .status-badge {
            display: inline-block;
            padding: 0.35rem 0.65rem;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        .status-active {
            background-color: rgba(76, 201, 240, 0.2);
            color: #4cc9f0;
        }
        
        .status-inactive {
            background-color: rgba(247, 37, 133, 0.2);
            color: #f72585;
        }
        
        .image-preview {
            border-radius: 8px;
            overflow: hidden;
            border: 2px dashed #dee2e6;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
            height: 150px;
        }
        
        .image-preview:hover {
            border-color: var(--accent-color);
        }
        
        .image-preview img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        
        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .alert-premium {
            border-radius: 8px;
            border: none;
            font-weight: 500;
        }
        
        .alert-success-premium {
            background-color: rgba(76, 201, 240, 0.15);
            color: #4cc9f0;
        }
        
        .alert-danger-premium {
            background-color: rgba(247, 37, 133, 0.15);
            color: #f72585;
        }
        
        .section-title {
            position: relative;
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <section>
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card card-premium">
                        <div class="card-header-premium text-center">
                            <h3><i class="fas fa-edit me-2"></i>Edit Product</h3>
                            
                            <c:if test="${not empty sessionScope.succMsg}">
                                <div class="alert alert-success-premium alert-premium mt-3">
                                    <i class="fas fa-check-circle me-2"></i>${sessionScope.succMsg}
                                </div>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>
                            
                            <c:if test="${not empty sessionScope.errorMsg}">
                                <div class="alert alert-danger-premium alert-premium mt-3">
                                    <i class="fas fa-exclamation-circle me-2"></i>${sessionScope.errorMsg}
                                </div>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                        </div>
                        <div class="card-body p-4">
                            <form action="/updateProduct" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${product.id}">
                                
                                <div class="mb-4">
                                    <h5 class="section-title">Basic Information</h5>
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <label class="form-label">Product Title</label>
                                            <input type="text" name="title" value="${product.title}" class="form-control form-control-premium" placeholder="Enter product title">
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label class="form-label">Description</label>
                                        <textarea rows="4" class="form-control form-control-premium" name="description" placeholder="Enter product description">${product.description}</textarea>
                                    </div>
                                </div>
                                
                                <div class="mb-4">
                                    <h5 class="section-title">Product Details</h5>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Category</label>
                                            <select class="form-control form-control-premium" name="category">
                                                <option value="${product.category}">${product.category}</option>
                                                <c:forEach var="c" items="${categories}">
                                                    <option value="${c.name}">${c.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Price ($)</label>
                                            <input type="number" name="price" value="${product.price}" class="form-control form-control-premium" placeholder="0.00" step="0.01">
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Discount (%)</label>
                                            <input type="number" name="discount" value="${product.discount}" class="form-control form-control-premium" placeholder="0" min="0" max="100">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Discounted Price ($)</label>
                                            <input type="number" readonly value="${product.discountPrice}" class="form-control form-control-premium">
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <%-- <div class="col-md-6 mb-3">
                                            <label class="form-label">Stock Quantity</label>
                                            <input type="text" name="stock" value="${product.stock}" class="form-control form-control-premium" placeholder="Enter stock quantity">
                                        </div>
                                        
 --%>  
 <div class="col-md-6 mb-3">
    <label class="form-label">Stock Quantity</label>
    <input type="number" name="stockQty"
           value="${product.stockQty}"
           class="form-control form-control-premium"
           placeholder="Enter stock quantity">
</div>                                      <div class="col-md-6 mb-3">
                                            <label class="form-label">Product Status</label>
                                            <div class="d-flex mt-2">
                                                <div class="form-check me-4">
                                                    <input class="form-check-input" type="radio" ${product.isActive ? 'checked' : ''} value="true" name="isActive" id="activeStatus">
                                                    <label class="form-check-label" for="activeStatus">
                                                        <span class="status-badge status-active">Active</span>
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" ${not product.isActive ? 'checked' : ''} value="false" name="isActive" id="inactiveStatus">
                                                    <label class="form-check-label" for="inactiveStatus">
                                                        <span class="status-badge status-inactive">Inactive</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="mb-4">
                                    <h5 class="section-title">Product Image</h5>
                                    <div class="row align-items-center">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Upload New Image</label>
                                            <input type="file" name="file" class="form-control form-control-premium" accept="image/*">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <div class="image-preview">
                                                <c:choose>
                                                    <c:when test="${not empty product.image}">
                                                        <img src="/img/product_img/${product.image}" alt="Product Image">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="text-center text-muted">
                                                            <i class="fas fa-image fa-3x mb-2"></i>
                                                            <p>No Image Available</p>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="d-grid gap-2 mt-4">
                                    <button class="btn btn-premium btn-lg"><i class="fas fa-save me-2"></i>Update Product</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS for dynamic discount price calculation -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const priceInput = document.querySelector('input[name="price"]');
            const discountInput = document.querySelector('input[name="discount"]');
            const discountPriceInput = document.querySelector('input[readonly]');
            
            function calculateDiscountPrice() {
                const price = parseFloat(priceInput.value) || 0;
                const discount = parseFloat(discountInput.value) || 0;
                
                if (discount > 0) {
                    const discountAmount = price * (discount / 100);
                    const finalPrice = price - discountAmount;
                    discountPriceInput.value = finalPrice.toFixed(2);
                } else {
                    discountPriceInput.value = price.toFixed(2);
                }
            }
            
            priceInput.addEventListener('input', calculateDiscountPrice);
            discountInput.addEventListener('input', calculateDiscountPrice);
            
            // Initialize discount price on page load
            calculateDiscountPrice();
        });
    </script>
</body>
</html>