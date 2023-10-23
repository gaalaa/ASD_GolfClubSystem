<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.golfclub.golfclubsystem.models.Menu" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3_slideshow.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/courseInfo.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dining | ASD Golf Club</title>
</head>

<body>
<%@ include file="jspf/header.jspf" %>
<h1 class="heading1">Dine With Us</h1>

<%
List<Menu> menus = (List<Menu>) request.getAttribute("menus");
    if (menus != null) {
    for (Menu menu : menus) {
    %>
    <p>Menu ID: <%= menu.getMenuID() %></p>
    <p>Menu Name: <%= menu.getMenuName() %></p>
    <p>Menu Price: <%= menu.getMenuPrice() %></p>
    <p>Menu Description: <%= menu.getMenuDescription() %></p>
    <p>Is Beverage: <%= menu.isBeverage() %></p>
    <hr/>
        <%
            }
        }
    %>


</body>
</html>