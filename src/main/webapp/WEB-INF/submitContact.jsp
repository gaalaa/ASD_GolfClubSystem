<%--
  Created by IntelliJ IDEA.
  User: stevenzhang
  Date: 13/10/2023
  Time: 5:29 pm
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
    <meta charset="UTF-8">
    <title>Golf Course Contact System</title>
    <style>
        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 70vh;
        }

        .response-text {
            text-align: center;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .image-container {
            display: flex;
            justify-content: center;
            width: 100%;
        }
    </style>
</head>

<body>
<%@ include file="jspf/header.jspf" %>

<div class="center-content">
    <header>
        <div class="image-container">
            <img src="${pageContext.request.contextPath}/img/thank you.jpeg" alt="Thank you" width="400">
        </div>
        <h1>Thank you for your response!</h1>
    </header>
    <div class="response-text">
        <p>We appreciate you reaching out to us. Our team will get back to you as soon as possible.</p>
        <p>If you have immediate concerns, please contact our hotline at (123) 456-7890.</p>
        <p>Have a great day!</p>
    </div>
</div>

</body>
</html>

