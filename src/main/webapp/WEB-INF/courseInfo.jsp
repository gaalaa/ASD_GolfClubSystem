<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <%@ include file="jspf/header.jspf" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slideshow.css">
    <title>Course Information Page</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/courseInfo.css">
<h1 class="h1"><%= "COURSE INFO" %>
</h1>
<body>


<div class="w3-content w3-display-container">
    <img class="mySlides" src="${pageContext.request.contextPath}/img/golf_course_1.jpg" alt="Golf" height="100%" width="100%">
    <img class="mySlides" src="${pageContext.request.contextPath}/img/golf_course_2.jpg" alt="Golf" height="100%" width="100%">
    <img class="mySlides" src="${pageContext.request.contextPath}/img/golf_course_3.jpg" alt="Golf" height="100%" width="100%">
    <img class="mySlides" src="${pageContext.request.contextPath}/img/golf_course_4.jpg" alt="Golf" height="100%" width="100%">

    <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
    <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
</div>

<script>
    var slideIndex = 1;
    showDivs(slideIndex);

    function plusDivs(n) {
        showDivs(slideIndex += n);
    }

    function showDivs(n) {
        var i;
        var x = document.getElementsByClassName("mySlides");
        if (n > x.length) {slideIndex = 1}
        if (n < 1) {slideIndex = x.length}
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        x[slideIndex-1].style.display = "block";
    }
</script>

<h3 class="h3">ASD Golf Club</h3>
<h5 class="h5">81 Broadway, Ultimo NSW 2007</h5>




</body>
</html>