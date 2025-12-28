<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Seller Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header1.jsp"%>
<div class="container mt-5">

    <h2 class="mb-4">Seller Management</h2>

    <!-- Success/Error Messages -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
<form method="get" action="admin/sellers" class="mb-3"></form>
    <!-- Statistics -->
    <div class="row mb-4">
        <div class="col">
            <div class="card p-2 text-center bg-light">
                Total Sellers: <strong>${totalSellers}</strong>
            </div>
        </div>
        <div class="col">
            <div class="card p-2 text-center bg-success text-white">
                Active: <strong>${activeSellers}</strong>
            </div>
        </div>
        <div class="col">
            <div class="card p-2 text-center bg-danger text-white">
                Inactive: <strong>${inactiveSellers}</strong>
            </div>
        </div>
        <div class="col">
            <div class="card p-2 text-center bg-warning text-dark">
                Pending: <strong>${pendingSellers}</strong>
            </div>
        </div>
    </div>

    <!-- Sellers Table -->
    <table class="table table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="s" items="${sellers}">
            <tr>
                <td>${s.id}</td>
                <td>${s.name}</td>
                <td>${s.email}</td>
                <td>
                    <c:choose>
                        <c:when test="${s.isEnable}">Active</c:when>
                        <c:otherwise>Pending</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:if test="${!s.isEnable}">
                        <a href="/admin/activateSeller/${s.id}" class="btn btn-success btn-sm">Activate</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
