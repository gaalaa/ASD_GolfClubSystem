<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.golfclub.golfclubsystem.models.Menu" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3_slideshow.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/courseInfo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/diningPage.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dining | ASD Golf Club</title>
</head>

<body>
<%@ include file="jspf/header.jspf" %>
<h1 class="heading1">Dine With Us</h1>

    <%
        List<Menu> menus = (List<Menu>) request.getAttribute("menus");
        List<Menu> foods = new ArrayList<>();
        List<Menu> beverages = new ArrayList<>();

        //Check if the item is beverage, if it is, put it into the beverages. If it is not, put it into foods.
        //Then put all the items in the beverages into foods. And display foods.
        //This way foods display first then beverages.
        if (menus != null) {
            for (Menu menu : menus) {
                if (menu.isBeverage()) {
                    beverages.add(menu);
                } else {
                    foods.add(menu);
                }
            }
        }
        foods.addAll(beverages);
        for (Menu menu: foods) {
    %>

        <%--        <p>Menu ID: <%= menu.getMenuID() %></p>--%>
        <%--        <p>Menu Name: <%= menu.getMenuName() %></p>--%>
        <%--        <p>Menu Price: <%= menu.getMenuPrice() %></p>--%>
        <%--        <p>Menu Description: <%= menu.getMenuDescription() %></p>--%>
        <%--        <p>Is Beverage: <%= menu.isBeverage() %></p>--%>
        <%--        <hr/>--%>

        <div class="div_menu">
            <div class="div_menu_name"><%= menu.getMenuName()%></div>
            <div class="div_menu_price">$<%= menu.getMenuPrice()%></div>
            <div class="div_menu_description"><%= menu.getMenuDescription()%></div>
            <hr>
        </div>

    <%
        }
    %>


</body>
</html>