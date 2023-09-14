<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <h1>Login</h1>
    <form action="${pageContext.request.contextPath}/member/login" method="post">
        <label for="username">Username: </label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password: </label>
        <input type="text" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
    <c:if test="${not empty requestScope.loginError}">
        <p style="color: red">${requestScope.loginError}</p>
    </c:if>
    <c:remove var="loginError" scope="request"/>
</body>
</html>
