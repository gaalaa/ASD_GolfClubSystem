<%--
  Created by IntelliJ IDEA.
  User: stevenzhang
  Date: 13/9/2023
  Time: 7:57 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3_slideshow.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/courseInfo.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body {
      text-align: center; /* Center-align the content horizontally */
      font-family: Arial, sans-serif;
    }

    header {
      padding: 20px;
    }

    h1 {
      font-size: 36px;
    }

    /* Additional elements that might go on a homepage */
    section {
      margin: 20px;
    }

    h2 {
      font-size: 24px;
    }

    p {
      font-size: 18px;
    }

    ul {
      list-style: none;
      padding: 0;
    }

    li {
      margin: 10px 0;
    }
  </style>
  <meta charset="UTF-8">
  <title>Golf Course Booking System</title>
</head>
<body>
<%@ include file="jspf/header.jspf" %>
<header>
  <h1>Welcome to the Golf Course Booking System</h1>
</header>

<section>
  <h2>To book a course</h2>
  <p>Please sign in or sign up</p>
  <img src="${pageContext.request.contextPath}/img/homepagegolf.png" alt="Booking Image" width="300">
</section>

</body>
</html>
