<%--
  Created by IntelliJ IDEA.
  User: stevenzhang
  Date: 13/9/2023
  Time: 8:02 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Contact Us - Golf Course Management</title>
</head>
<body>
<header>
  <h1>Contact Us</h1>
</header>
<nav>
  <ul>
    <li><a href="index.jsp">Index </a></li>
    <li><a href="courseInfo.jsp">Golf Courses</a></li>
    <li><a href="homepage.jsp">Home </a></li>
  </ul>
</nav>
<section id="contact-section">
  <h2>Contact Information</h2>
  <p>If you have any questions or feedback, please feel free to contact us:</p>
  <ul>
    <li>Email: golf@gmail.com</li>
    <li>Phone: 123 456 789</li>
    <li>Address: 123 Golf, Course, Sydney 2000 </li>
  </ul>

  <h2>Enquiry Form</h2>
    <label for="name">Name:</label>
    <input type="text" name="name" id="name" required>
    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required>
    <label for="message">Message:</label>
    <textarea name="message" id="message" rows="5" required></textarea>
    <input type="submit" value="Submit">
</section>

</body>
</html>

