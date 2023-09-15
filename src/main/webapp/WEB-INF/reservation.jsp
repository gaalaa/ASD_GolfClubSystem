<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3_slideshow.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/courseInfo.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Reservation</title>
	<style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            z-index: 1000;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 999;
        }
	</style>

</head>
<body>
<%@ include file="jspf/header.jspf" %>
<h1>Book Your Round!</h1>
<form action="" method="post">
	<table>
		<tr>
			<th><label for="Your Name">Name</label></th>
			<td><input type="text" name="name" id="Your Name" required></td>
		</tr>
		<tr>
			<th><label for="Your Membership Number">Membership Number</label></th>
			<td><input type="text" name="member_id" id="Your Membership Number" required></td>
		</tr>
		<tr>
			<th><label for="Select a Date">Date</label></th>
			<td><input type="date" name="date" id="Select a Date" required></td>
		</tr>
		<tr>
			<th><label for="Choose Your Time">Time</label></th>
			<td><input type="time" name="time" id="Choose Your Time" required></td>
		</tr>
		<tr>
			<th><label for="How Many People">People</label></th>
			<td><input type="number" name="number_of_people" min="1" id="How Many People" required></td>
		</tr>
		<tr>
			<th><label for="Description">Describe</label></th>
			<td><textarea name="remarks" rows="4" id="Description"></textarea></td>
		</tr>
	</table>
	<button onclick="showPopup()">Submit</button>
</form>
<div class="overlay" id="overlay"></div>
<div class="popup" id="popup">
	<h3>Successful Booking!</h3>
	<button onclick="closePopup()">Confirm</button>
</div>
<script>
    function showPopup() {
        document.getElementById('popup').style.display = 'block';
        document.getElementById('overlay').style.display = 'block';
    }

    function closePopup() {
        document.getElementById('popup').style.display = 'none';
        document.getElementById('overlay').style.display = 'none';
    }
</script>
</body>
</html>