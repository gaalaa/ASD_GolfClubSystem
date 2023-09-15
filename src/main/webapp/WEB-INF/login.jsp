<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
</head>
<body>
    <%@ include file="jspf/header.jspf" %>
    <h1>Login</h1>
    <form action="${pageContext.request.contextPath}/member/login" method="post">
        <label for="username">Username: </label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password: </label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
    <%
        String loginError = (String) request.getAttribute("loginError");
        if(loginError != null && !loginError.isEmpty()){
    %>
            <p class="error-message"><%=loginError%></p>
    <%
            request.removeAttribute("loginError");
        }
    %>
</body>
</html>
