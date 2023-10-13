<%--Fix password mismatch error message--%>

<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userRegistration.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
</head>
<body>
<%@ include file="jspf/header.jspf" %>
<h1 class="heading">Register</h1>
<form action="${pageContext.request.contextPath}/member/userRegistration" method="post" onsubmit="return validateInput()">
    <div class="form-row">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required>
    </div>
    <div class="form-row">
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required>
    </div>
    <div class="form-row">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
    </div>
    <div class="form-row">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div class="form-row">
        <label for="confirmPassword">Re-type Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>
        <span id="passwordMatch"></span>
    </div>
    <div class="form-row">
        <input type="submit" value="Register">
    </div>
</form>

<script>
    function validateInput(){
        var password = document.getElementById("password").value;
        var confirmPasswordField = document.getElementById("confirmPassword");
        var message = document.getElementById(("passwordMatch"));

        if(password !== confirmPasswordField.value){
            message.textContent = "Passwords didn't match. Try again"
            confirmPasswordField.value = "";
            return false;
        }
        return true;
    }
</script>
</body>
</html>
