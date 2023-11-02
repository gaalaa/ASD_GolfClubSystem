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

    section {
      margin: 20px;
    }

    h2 {
      font-size: 24px;
    }

    p {
      font-size: 14px;
      margin-right: 40px;
    }

    ul {
      list-style: none;
      padding: 0;
    }

    li {
      margin: 10px 0;
    }
    .small-table {
      font-size: 12px; /* Reduce the font size */
      max-width: 300px; /* Set a max width */
      margin: auto; /* This will center the table if its width is less than its container */
    }

    .small-table th,
    .small-table td {
      padding: 5px; /* Reduce padding */
    }

    .horizontal-columns {
      display: flex;
      justify-content: space-between; /* This will give equal space between the h2 elements */
      align-items: baseline; /* This will vertically align the h2 elements in case they have different heights */
      max-width: 70%; /* adjust this value as needed */
      margin: 0 auto;
    }

    .horizontal-columns > div img { /* This targets each div inside the horizontal-columns container */
      flex: 1; /* This ensures each div takes equal width */
      max-width: 100%; /* Ensures the image doesn't overflow its container */
      display: block;  /* Makes the image a block element so it takes up the full width */
      margin: 0 auto 10px;
    }

  </style>
  <meta charset="UTF-8">
  <title>Golf Course Booking System</title>
</head>
<body>
<%@ include file="jspf/header.jspf" %>

<section>
  <img src="${pageContext.request.contextPath}/img/golfhome.jpg" alt="Booking Image" width="1400">
</section>

<header>
  <h1>EXPLORE ASD GOLF CLUB</h1>
</header>

<div class="horizontal-columns">
  <div>
    <img src="${pageContext.request.contextPath}/img/homepagegolf.png" alt="Driving Range" width="300">
    <h2>Download the ASD App </h2>
    <p>Discover in-depth programs and on demand group exercises to help you stay motivated and feel confident in your golfing journey. Work your way to a stronger drive, as you generate power through from your stance through your legs into your swing.</p>
  </div>
  <div>
    <img src="${pageContext.request.contextPath}/img/golf.jpeg" alt="Driving Range" width="300" height="200">
    <h2>Updated Driving Range</h2>
    <p>Try the newly renovated Driving Range, our custom-built facility features state-of-the-art equipment. Automated Golf Ball Teeing Systems take the hassle off setting up the perfect shot in no time. So you can focus on perfecting your swing. </p>
  </div>
  <div>
    <img src="${pageContext.request.contextPath}/img/golftraining.jpeg" alt="Driving Range" width="300" height="200">
    <h2>Small Group Training </h2>
    <p>Push yourself further with small group training, led by our dedicated Trainers. These 30-minute classes, strike the perfect balance of technique and power, along with the motivation of training in a group, you can stay committed to your golfing goals.</p>
  </div>
</div>

<section>
  <h2>Operating Hours</h2>
  <table class="table table-bordered small-table">
    <thead>
    <tr>
      <th>Day</th>
      <th>Opening Time</th>
      <th>Closing Time</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>Monday - Thursday</td>
      <td>6:00 AM</td>
      <td>8:00 PM</td>
    </tr>
    <tr>
      <td>Friday</td>
      <td>6:00 AM</td>
      <td>6:00 PM</td>
    </tr>
    <tr>
      <td>Saturday - Sunday</td>
      <td>6:00 AM</td>
      <td>5:00 PM</td>
    </tr>
    </tbody>
  </table>
</section>

</body>
</html>
