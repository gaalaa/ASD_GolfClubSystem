<html>
<head>
    <title>Edit Details</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userRegistration.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
</head>
<body>
<%@ include file="jspf/header.jspf" %>
<h1 class="heading">Update Personal Details</h1>
<form id="detailsForm" action="${pageContext.request.contextPath}/member/editPersonalDetails" method="post">
    <div class="form-row">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" value="${sessionScope.user.firstName}" required>
    </div>
    <div class="form-row">
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" value="${sessionScope.user.lastName}" required>
    </div>
    <span id="emptyFieldError"></span>
    <div class="form-row">
        <input id="submitForm" type="submit" value="Update Details">
    </div>
</form>
<form id="cancelMembershipForm" action="${pageContext.request.contextPath}/member/cancelMembership" method="post">
    <input id="cancelMembership" type="submit" value="Cancel Membership">
</form>


</body>
</html>
