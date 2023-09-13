<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3_slideshow.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/courseInfo.css">
<%@ include file="jspf/header.jspf" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
    <title>Course Information Page</title>
</head>


<body>
    <h1 class="heading1">Our Course</h1>

    <div class="w3-content w3-display-container">
        <img class="Slides" src="${pageContext.request.contextPath}/img/golf_1.jpg" alt="Golf" width="100%">
        <img class="Slides" src="${pageContext.request.contextPath}/img/golf_2.jpg" alt="Golf" width="100%">
        <img class="Slides" src="${pageContext.request.contextPath}/img/golf_3.jpg" alt="Golf" width="100%">
        <img class="Slides" src="${pageContext.request.contextPath}/img/golf_4.jpg" alt="Golf" width="100%">

        <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
        <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
    </div>

    <h3 class="heading3">ASD Golf Club</h3>
    <h5 class="heading5">81 Broadway, Ultimo NSW 2007</h5>

    <div class="myDiv">
        <h1 class="underline">Play</h1>
        <p>
        ASD Golf Club is an 18 hole course in 81 Broadway, Ultimo NSW 2007, with a driving range and practice green
        tucked inside the oldest residential community in Ultimo. The course opened in 1974 and features 6,014 yards
        of golf from the longest tees for a par of 72. The course rating is 70.1, and it has a slope rating of 124.
        </p>
        <p></p>
        <p>
        The intimate course is open to the public at affordable prices and boasts challenging fairways and numerous
        water hazards to test players of all skill levels. Visit ASD Golf Club in Ultimo for golf lessons or come and
        work on your swing at the best driving range in Ultimo and take aim at our targets!
        </p>
        <p></p>
        <p>
        We have a full service pro shop with a complete section of golf merchandise. Clubs are available to rent in the
        pro shop.
        </p>
    </div>

    <div class="myDiv">
        <h1 class="underline">Green Fees</h1>
        <p><span class="bolded">Domestic Saturday, Sunday and Holiday Rates</span></p>
        <table>
            <tr>
                <th>Category</th>
                <th>Times</th>
                <th>Fees</th>
            </tr>
            <tr>
                <td>Weekend Peak</td>
                <td>Sunrise - 1pm</td>
                <td>$70</td>
            </tr>
            <tr>
                <td>Weekend Off Peak</td>
                <td>1pm - 3pm</td>
                <td>$60</td>
            </tr>
            <tr>
                <td>Weekend Twilight</td>
                <td>After 3pm</td>
                <td>$50</td>
            </tr>
        </table>
        <p></p>
        <p><span class="bolded">Domestic Weekday (Monday-Friday) Rates</span></p>
        <table>
            <tr>
                <th>Category</th>
                <th>Times</th>
                <th>Fees</th>
            </tr>
            <tr>
                <td>Weekend Peak</td>
                <td>Sunrise - 1pm</td>
                <td>$55</td>
            </tr>
            <tr>
                <td>Weekend Off Peak</td>
                <td>1pm - 3pm</td>
                <td>$50</td>
            </tr>
            <tr>
                <td>Weekend Twilight</td>
                <td>After 3pm</td>
                <td>$45</td>
            </tr>
        </table>
    </div>




    <script>
        var slideIndex = 1;
        showDivs(slideIndex);

        function plusDivs(n) {
            showDivs(slideIndex += n);
        }

        function showDivs(n) {
            var i;
            var x = document.getElementsByClassName("Slides");
            if (n > x.length) {slideIndex = 1}
            if (n < 1) {slideIndex = x.length}
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            x[slideIndex-1].style.display = "block";
        }
    </script>
</body>
</html>