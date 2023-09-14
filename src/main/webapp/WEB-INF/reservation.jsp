<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	</style>
</head>
<body>
<nav>
	<ul>
		<li><a href="courseInfo.jsp">Golf Courses</a></li>
		<li><a href="contact.jsp">Contact Us</a></li>
		<li><a href="index.jsp">Index</a></li>
		<li><a href="homepage.jsp">Home</a></li>
	</ul>
</nav>
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
	<input type="submit" value="submit">
</form>
</body>
</html>