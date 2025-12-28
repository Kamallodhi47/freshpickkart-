<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Raise Complaint | FreshPick Kart</title>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>

<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-header bg-danger text-white text-center">
                    <h4>Raise a Complaint</h4>
                </div>

                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/saveComplaint"
                          method="post">

                        <!-- Order ID (hidden) -->
        <input type="hidden" name="productId" value="${productId}">
                        <!-- Subject -->
                        <div class="mb-3">
                            <label class="form-label">Subject</label>
                            <input type="text" name="subject"
                                   class="form-control"
                                   placeholder="Enter complaint subject"
                                   required>
                        </div>

                        <!-- Message -->
                        <div class="mb-3">
                            <label class="form-label">Complaint Message</label>
                            <textarea name="message"
                                      class="form-control"
                                      rows="4"
                                      placeholder="Describe your issue"
                                      required></textarea>
                        </div>

                        <!-- Submit -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-danger">
                                Submit Complaint
                            </button>
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
