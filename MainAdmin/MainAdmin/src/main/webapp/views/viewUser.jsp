<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Users / Admin List</title>
</head>
<body>
    <section>
        <div class="container-fluid mt-5 p-5">

            <div class="card card-sh">
                <div class="card-header text-center">
                    <!-- UserType Display -->
                    <c:choose>
                        <c:when test="${userType == 1}">
                            <p class="fs-4">Users</p>
                        </c:when>
                        <c:when test="${userType == 2}">
                            <p class="fs-4">Admin</p>
                        </c:when>
                    </c:choose>

                    <!-- Success Message -->
                    <c:if test="${not empty sessionScope.succMsg}">
                        <p class="text-success fw-bold">${sessionScope.succMsg}</p>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty sessionScope.errorMsg}">
                        <p class="text-danger fw-bold">${sessionScope.errorMsg}</p>
                        <c:remove var="errorMsg" scope="session"/>
                    </c:if>
                </div>

                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Sl No</th>
                                <th scope="col">Profile</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mobile No</th>
                                <th scope="col">Address</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="u" items="${users}" varStatus="status">
                                <tr>
                                    <th scope="row">${status.count}</th>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/img/profile_img/${u.profileImage}" 
                                             width="70px" height="70px" alt="Profile Image">
                                    </td>
                                    <td>${u.name}</td>
                                    <td>${u.email}</td>
                                    <td>${u.mobileNumber}</td>
                                    <td>${u.address}, ${u.city}, ${u.state}, ${u.pincode}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${u.isEnable}">
                                                Active
                                            </c:when>
                                            <c:otherwise>
                                                Inactive
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/updateSts?status=true&id=${u.id}&type=${userType}" 
                                           class="btn btn-sm btn-primary">Active</a>
                                        <a href="${pageContext.request.contextPath}/admin/updateSts?status=false&id=${u.id}&type=${userType}" 
                                           class="btn btn-sm btn-danger">Inactive</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </section>
</body>
</html>
