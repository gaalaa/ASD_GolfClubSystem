<%@ page import="com.golfclub.golfclubsystem.models.Member" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3_slideshow.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/courseInfo.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course Information Page</title>
</head>

<body>
    <%@ include file="jspf/header.jspf" %>
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

<div class="div_container">
    <div class="div_sidebar">
        <h3>In This Section</h3>
        <a href="#play" class="active, underline2">Play</a>
        <a href="#green-fees" class="active, underline2">Green Fees</a>
        <a href="#hire-fees" class="active, underline2">Hire Fees</a>
        <a href="#estimate-cost" class="active, underline2">Estimate Cost</a>
    </div>


    <div class="div_one">
        <h1 class="underline1" id="play">Play</h1>
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

        <br />

        <h1 class="underline1" id="green-fees">Green Fees</h1>
        <p><span class="bolded">Domestic Saturday, Sunday and Holiday Rates</span></p>
        <table class="URLTable">
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
        <br />
        <p><span class="bolded">Domestic Weekday (Monday-Friday) Rates</span></p>
        <table>
            <tr>
                <th>Category</th>
                <th>Times</th>
                <th>Fees</th>
            </tr>
            <tr>
                <td>Weekday Peak</td>
                <td>Sunrise - 1pm</td>
                <td>$55</td>
            </tr>
            <tr>
                <td>Weekday Off Peak</td>
                <td>1pm - 3pm</td>
                <td>$50</td>
            </tr>
            <tr>
                <td>Weekday Twilight</td>
                <td>After 3pm</td>
                <td>$45</td>
            </tr>
        </table>

        <br />

        <h1 class="underline1" id="hire-fees">Hire Fees</h1>
        <table>
            <tr>
                <th>Category</th>
                <th>9 Holes</th>
                <th>18 Holes</th>
            </tr>
            <tr>
                <td>Electric Cart</td>
                <td>$22</td>
                <td>$32</td>
            </tr>
            <tr>
                <td>Standard Hire Set</td>
                <td>$25</td>
                <td>$35</td>
            </tr>
            <tr>
                <td>Pull Buggy</td>
                <td>$5 + $5 deposit</td>
                <td>$10 + $5 deposit</td>
            </tr>
        </table>
    </div>

    <br />

    <div class="div_one">
        <h1 class="underline1" id="estimate-cost">Estimate Cost</h1>

        <h4>
            <% if (currentUser == null) { %>
            <span>You are not logged in as a Member, so Member discount will NOT be applied.</span>
            <% } else { %>
            <span>You are a member <%= currentUser.getFullName() %>! 15% discount will be applied.</span>
            <% } %>
        </h4>

        <div>
            <table>
                <tr>
                    <th><label for="day">Select a Day: </label></th>
                    <th>
                        <select name="day" id="day" required>
                            <option value="notSelected">Not Selected</option>
                            <option value="weekend">Weekend</option>
                            <option value="weekday">Weekday</option>
                        </select>
                    </th>
                </tr>
                <tr>
                    <th><label for="time">Select a Time: </label></th>
                    <th>
                        <select name="time" id="time" required>
                            <option value="notSelected">Not Selected</option>
                            <option value="peak">Sunrise - 1pm</option>
                            <option value="offPeak">1pm - 3pm</option>
                            <option value="twilight">After 3pm</option>
                        </select>
                    </th>
                </tr>
                <tr>
                    <th><label for="hireOption">Select a Hire Option (Optional): </label></th>
                    <th>
                        <select name="hireOption" id="hireOption" required>
                            <option value="notSelected">Not Selected</option>
                            <optgroup label="9 Holes">
                                    <option value="electricCart9">Electric Cart for 9 holes</option>
                                    <option value="standard9">Standard Hire Set</option>
                                    <option value="pullBuggy9">Pull Buggy for 9 holes</option>
                            <optgroup label="18 Holes">
                                    <option value="electricCart18">Electric Cart for 18 holes</option>
                                    <option value="standard18">Standard Hire Set</option>
                                    <option value="pullBuggy18">Pull Buggy for 18 holes</option>
                    </th>
                </tr>
            </table>
            <button onclick="calculateCost()">Calculate</button>
            <div id="costDisplay"></div>
        </div>
    </div>

</div>


    <script>
        var cost = 0;
        var estimatedCost = document.getElementById("costDisplay");

        function calculateCost() {
            var day = document.getElementById("day").value;
            var time = document.getElementById("time").value;

            // Day and Time
                if (day==="weekend" && time==="peak") {
                    cost = 70;
                    ifHiring();
                }
                if (day==="weekend" && time==="offPeak") {
                    cost = 60;
                    ifHiring();
                }
                if (day==="weekend" && time==="twilight") {
                    cost = 50;
                    ifHiring();
                }
                if (day==="weekday" && time==="peak") {
                    cost = 55;
                    ifHiring();
                }
                if (day==="weekday" && time==="offPeak") {
                    cost = 50;
                    ifHiring();
                }
                if (day==="weekday" && time==="twilight") {
                    cost = 45;
                    ifHiring();
                }
            //If day or time is not selected
            if (day==="notSelected" && time!=="notSelected") {
                notSelected("day");
            }
            else if (time==="notSelected" && day!=="notSelected") {
                notSelected("time");
            }
            //If both day and time is not selected
            else if (day==="notSelected" && time==="notSelected") {
                notSelectedBoth();
            }
            else
                checkMember(cost);
        }

        //Additional cost if the user hires something
        function ifHiring() {
            var hireOption = document.getElementById("hireOption").value;
                if (hireOption==="electricCart9") { cost += 22; }
                if (hireOption==="standard9") { cost += 25; }
                if (hireOption==="pullBuggy9") { cost += 10; }
                if (hireOption==="electricCart18") { cost += 32; }
                if (hireOption==="standard18") { cost += 35; }
                if (hireOption==="pullBuggy18") { cost += 15; }
        }

        //Check if the user is logged in or not
        function checkMember(cost) {
            <% if (currentUser == null) { %>
            displayCost(cost);
            <% } else { %>
            displayCostMember(cost);
            <% } %>
        }

        function displayCost(cost) {
            estimatedCost.innerHTML = "The estimated cost is: <b>$" + cost + "</b>";
        }

        function displayCostMember(cost) {
            estimatedCost.innerHTML = "The estimated cost is: <b>$" + cost*0.85 + "</b>, 15% discount has been applied!";
        }

        //If the user does not select either day or time
        function notSelected(item) {
            if (item==="day") {
               estimatedCost.innerHTML = "Please select a day";
            }
            else if (item==="time") {
                estimatedCost.innerHTML = "Please select a time";
            }
        }

        //If the user does not select both day and time
        function notSelectedBoth() {
            estimatedCost.innerHTML = "Please select a day and time";
        }
    </script>

<%--    <% if (currentUser == null) { %>--%>
<%--    <% } else { %>--%>
<%--    <% } %>--%>

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