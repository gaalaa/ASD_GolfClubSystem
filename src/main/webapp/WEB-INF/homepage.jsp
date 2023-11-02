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
      text-align: center;
      font-family: Arial, sans-serif;
      min-height: 100%;
      margin: 0;
      padding: 0;
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
      font-size: 16px;
      max-width: 500px;
      margin: auto;
    }

    .small-table th,
    .small-table td {
      padding: 5px;
    }

    .horizontal-columns {
      display: flex;
      justify-content: space-between;
      align-items: baseline;
      max-width: 70%;
      margin: 0 auto;
    }

    .horizontal-columns > div img {
      flex: 1;
      max-width: 100%;
      display: block;
      margin: 0 auto 10px;
    }

    .banner {
      width: 100%;
      background-color: #8bd58b;
      color: white;
      text-align: center;
      padding: 10px 0;
      font-size: 30px;
    }

    .faq-section {
      width: 70%;
      margin: 50px auto;
      font-family: Arial, sans-serif;
    }

    .faq-item {
      border: 1px solid #ccc;
      border-radius: 5px;
      margin-bottom: 15px;
      overflow: hidden;
      transition: 0.3s;
    }

    .faq-item:hover {
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .faq-item summary {
      background-color: #f7f7f7;
      cursor: pointer;
      padding: 10px 15px;
      outline: none;
    }

    .faq-item summary::-webkit-details-marker {
      display: none;
    }

    .faq-item summary:before {
      content: '+';
      display: inline-block;
      width: 20px;
      text-align: center;
      margin-right: 10px;
    }

    .faq-item[open] summary:before {
      content: '-';
    }

    .faq-answer {
      padding: 10px 15px;
      background-color: #fff;
      border-top: 1px solid #ccc;
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
    <img src="${pageContext.request.contextPath}/img/homepagegolf.png" alt="app" width="300">
    <h2>Download the ASD App </h2>
    <p>Discover in-depth programs and on demand group exercises to help you stay motivated and feel confident in your golfing journey. Work your way to a stronger drive, as you generate power through from your stance through your legs into your swing.</p>
  </div>
  <div>
    <img src="${pageContext.request.contextPath}/img/golf.jpeg" alt="Driving Range" width="300" height="200">
    <h2>Updated Driving Range</h2>
    <p>Try the newly renovated Driving Range, our custom-built facility features state-of-the-art equipment. Automated Golf Ball Teeing Systems take the hassle off setting up the perfect shot in no time. So you can focus on perfecting your swing. </p>
  </div>
  <div>
    <img src="${pageContext.request.contextPath}/img/golftraining.jpeg" alt="training" width="300" height="200">
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

<div class="faq-section">
  <h2>Common FAQs</h2>

  <div class="faq-item">
    <details>
      <summary>What are the memberships available?</summary>
      <div class="faq-answer">
        We offer one membership tier that is free to join. The membership will grant you access to the Golf Club, Booking System Golf Shop and Restaurant.
      </div>
    </details>
  </div>

  <div class="faq-item">
    <details>
      <summary>Can I book a tee time online?</summary>
      <div class="faq-answer">
        Yes, members can book tee times through our online portal. If you're a visitor, please sign up online.
      </div>
    </details>
  </div>

  <div class="faq-item">
    <details>
      <summary>Do you offer golf lessons?</summary>
      <div class="faq-answer">
        We have a team of professional trainers offering both group and individual lessons.
      </div>
    </details>
  </div>

  <div class="faq-item">
    <details>
      <summary>Can children play on the course?</summary>
      <div class="faq-answer">
        Children are welcome; however, they must be accompanied by an adult at all times.
      </div>
    </details>
  </div>

  <div class="faq-item">
    <details>
      <summary>Is there any dress code?</summary>
      <div class="faq-answer">
        Yes, we maintain a strict dress code to ensure all members and visitors have a pleasant experience. We recommend golf attire such as buttoned shirts , golf shoes, and appropriate trousers or skirts.
      </div>
    </details>
  </div>
</div>

<div class="banner">
  PUT YOUR GOLFING EXPERIENCE FIRST
  <p> Join today and let us show you what you're capable of</p>
</div>

</body>
</html>
