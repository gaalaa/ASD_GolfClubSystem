<%@ page import="com.golfclub.golfclubsystem.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Product product = (Product) request.getAttribute("product");
%>
<html>
<head>
    <title><%= product.getName() %></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
<%@include file="jspf/header.jspf"%>
</body>
</html>
