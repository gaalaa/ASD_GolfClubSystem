<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
</head>
<body>
<%@ include file="jspf/header.jspf" %>
<h1><%= "Index Page" %>
</h1>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>