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
    <%
        String loginError = (String) request.getAttribute("loginError");
        if(loginError != null && !loginError.isEmpty()){
    %>
            <p style="color: red">Invalid Credentials</p>
    <%
            request.removeAttribute("loginError");
        }
    %>
</body>
</html>
