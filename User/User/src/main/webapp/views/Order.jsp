<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Summary</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f1f3f6;
        }
        .box {
            background: #fff;
            padding: 18px;
            border-radius: 12px;
            box-shadow: 0 0 10px #ddd;
            margin-bottom: 20px;
        }
        .item {
            display: flex;
            justify-content: space-between;
            padding-bottom: 10px;
            margin-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .label-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 8px;
        }
    </style>
</head>

<body>

<div class="container mt-4 mb-5">

    <h3 class="mb-3">📦 Order Summary</h3>


    <!-- ################ ORDER ID + DATE ############### -->
    <div class="box">
        <p><b>Order ID:</b> #ORD-${System.currentTimeMillis()}</p>
        <p><b>Date:</b> <%= new java.util.Date() %></p>
    </div>


    <!-- ################ CUSTOMER DETAILS ################ -->
    <div class="box">
        <p class="label-title"> Customer Details</p>

        <p><b>Name:</b> ${requestScope.customer.fullname}</p>
        <p><b>Mobile:</b> ${requestScope.customer.mobile}</p>
    </div>


    <!-- ################ DELIVERY ADDRESS ################ -->
    <div class="box">
        <p class="label-title">📍 Delivery Address</p>

        <p>
            ${requestScope.address.house}, ${requestScope.address.area},  
            ${requestScope.address.landmark}<br>
            ${requestScope.address.city}, ${requestScope.address.state} - ${requestScope.address.pincode}
        </p>

        <p class="text-success mt-1"> Delivery in 10 minutes</p>
    </div>


    <!-- ################ PAYMENT METHOD ################ -->
    <div class="box">
        <p class="label-title">💳 Payment Method</p>
        <p><b>${requestScope.paymentMode}</b></p>
    </div>


    <!-- ################ ORDERED ITEMS ################ -->
    <div class="box">
        <p class="label-title">🛍 Ordered Items</p>

        <c:set var="subTotal" value="0" />

        <c:forEach items="${requestScope.cartItems}" var="item">
            <div class="item">
                <div>
                    <b>${item.productName}</b><br>
                    Qty: ${item.quantity}
                </div>
                <div>
                    ₹${item.price * item.quantity}
                </div>
            </div>

            <c:set var="subTotal" value="${subTotal + (item.price * item.quantity)}" />
        </c:forEach>

        <!-- Subtotal -->
        <p class="d-flex justify-content-between">
            <span>Subtotal</span>
            <b>₹${subTotal}</b>
        </p>

        <!-- Delivery Charges -->
        <p class="d-flex justify-content-between">
            <span>Delivery Charge</span>
            <b>
                <c:choose>
                    <c:when test="${subTotal >= 500}">FREE</c:when>
                    <c:otherwise>₹40</c:otherwise>
                </c:choose>
            </b>
        </p>

        <hr>

        <!-- Final Amount -->
        <h5 class="d-flex justify-content-between">
            <span>Total Amount</span>
            <b>
                <c:choose>
                    <c:when test="${subTotal >= 500}">₹${subTotal}</c:when>
                    <c:otherwise>₹${subTotal + 40}</c:otherwise>
                </c:choose>
            </b>
        </h5>

    </div>


    <!-- ############ PLACE ORDER BUTTON ############ -->
    <form action="ConfirmOrder" method="post">
        <input type="hidden" name="paymentMode" value="${requestScope.paymentMode}">
        <button class="btn btn-success w-100 py-2">Place Order</button>
    </form>

</div>

</body>
</html>
