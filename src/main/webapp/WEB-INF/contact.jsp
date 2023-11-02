<%--
  Created by IntelliJ IDEA.
  User: stevenzhang
  Date: 13/9/2023
  Time: 8:02 pm
--%>
<!DOCTYPE html>

<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3_slideshow.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/courseInfo.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Golf Course Management</title>
    <style>
        body {
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        header {
            text-align: center;
        }

        #contact-section {
            text-align: center;
        }

        #contact-section h2 {
            font-size: 24px;
        }

        #contact-section ul {
            list-style: none;
            padding: 0;
        }

        #contact-section ul li {
            margin: 10px 0;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file="jspf/header.jspf" %>
<section id="contact-section">
    <header>
        <h1>Contact Us</h1>
    </header>
    <p>If you have any questions or feedback, please feel free to contact us:</p>
    <ul>
        <li>Email: ASD@golf.com</li>
        <li>Phone: 123 456 789</li>
        <li>Address: 81 Broadway, Ultimo NSW 2007 </li>
    </ul>

    <h2>Enquiry Form</h2>
    <form action="${pageContext.request.contextPath}/SubmitContactServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required style="width: 300px; height: 20px;"><br>
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required style="width: 300px; height: 20px;"><br>
        <label for="message">Message:</label>
        <textarea name="message" id="message" rows="5" required style="width: 300px; height: 150px;"></textarea><br>
        <input type="submit" value="Submit">
    </form>
</section>
</body>
</html>
