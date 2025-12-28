<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - Apna Shop</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .checkout-box {
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ddd;
        }
        .title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
        }
    </style>
</head>

<body style="background:#f5f5f5;">

<div class="container mt-4 mb-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="checkout-box">

                <h3 class="mb-3">Checkout</h3>

                <form action="/user/save-order" method="post">

                    <!-- Customer Details -->
                    <p class="title">Customer Details</p>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Full Name</label>
                            <input type="text" name="fullname" class="form-control" required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Mobile</label>
                            <input type="text" name="mobile" class="form-control" required>
                        </div>
                    </div>

                    <!-- Delivery Address -->
                    <p class="title">Delivery Address</p>

                    <div class="row">

                        <div class="col-md-4 mb-3">
                            <label>Pincode</label>
                            <input type="text" name="pincode" class="form-control" required>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label>State</label>
                            <input type="text" name="state" class="form-control" required>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label>City</label>
                            <input type="text" name="city" class="form-control" required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>House No / Building</label>
                            <input type="text" name="house" class="form-control" required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Area / Street</label>
                            <input type="text" name="area" class="form-control" required>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label>Landmark (Optional)</label>
                            <input type="text" name="landmark" class="form-control">
                        </div>

                        <!-- ⭐ LOCATION ADDED HERE -->
                        <div class="col-md-6 mb-3">
                            <label>Latitude</label>
                            <input type="text" name="latitude" id="latitude" class="form-control" readonly>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Longitude</label>
                            <input type="text" name="longitude" id="longitude" class="form-control" readonly>
                        </div>

                        <div class="col-md-12 mb-3">
                            <button type="button" onclick="getLocation()" class="btn btn-success w-100">
                                📍 Get My Location
                            </button>
                        </div>

                    </div>

                    <!-- Payment -->
                    <p class="title">Payment Mode</p>

                    <div class="mb-3">
                        <input type="radio" name="paymentType" value="COD" required> Cash On Delivery <br>
                        <input type="radio" name="paymentType" value="UPI"> UPI <br>
                        <input type="radio" name="paymentType" value="Razorpay"> Razorpay
                    </div>

                    <button class="btn btn-primary w-100 mt-3">Place Order</button>

                </form>

            </div>
        </div>
    </div>
</div>


<!-- ⭐ Automatic GPS Location Script -->
<script>
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        alert("Your browser does not support location.");
    }
}

function showPosition(position) {
    document.getElementById("latitude").value = position.coords.latitude;
    document.getElementById("longitude").value = position.coords.longitude;
}

function showError(error) {
    alert("Location permission denied or not available.");
}
</script>

</body>
</html>
