<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thank you!</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
<%@include file="jspf/header.jspf"%>

<div class="container">
    <h4>Thank you for your purchase!</h4>
    <p>Return <a href="${pageContext.request.contextPath}/">Home</a> or <a href="${pageContext.request.contextPath}/store">keep shopping</a>.</p>
</div>

</body>
</html>
