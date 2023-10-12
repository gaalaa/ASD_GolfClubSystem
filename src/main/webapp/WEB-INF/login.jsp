<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
</head>
<body>
    <%@ include file="jspf/header.jspf" %>
    <h1 class="heading">Login</h1>
    <form action="${pageContext.request.contextPath}/member/login" method="post">
        <label for="email">Email: </label>
        <input type="text" id="email" name="email" required><br><br>
        <label for="password">Password: </label>
        <input type="password" id="password" name="password" required><br><br>
        <%
            String loginError = (String) request.getAttribute("loginError");
            if(loginError != null && !loginError.isEmpty()){
        %>
        <p class="error-message"><%=loginError%></p>
        <%
                request.removeAttribute("loginError");
            }
        %>
        <input type="submit" value="Login">

    </form>

</body>
</html>
