<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3_slideshow.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/courseInfo.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Edit Reservation</title>
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
<h2>Search Reservation by ID</h2>
<form action="EditReservationServlet" method="get">
	<label for="searchId">Enter Reservation ID:</label>
	<input type="text" id="searchId" name="id">
	<input type="submit" value="Search">
</form>

<h1>Edit Reservation</h1>
<form action="EditReservationServlet" method="post">
	<input type="hidden" name="id" class="btn btn-primary" value="${reservation.id}" />
	<table>
		<tr>
			<th>Name:</th>
			<td><input type="text" name="name" value="${reservation.name}" required></td>
		</tr>
		<tr>
			<th>Membership Number:</th>
			<td><input type="text" name="member_id" value="${reservation.memberId}" required></td>
		</tr>
		<tr>
			<th>Date:</th>
			<td><input type="date" name="date" value="${reservation.date}" required></td>
		</tr>
		<tr>
			<th>Time:</th>
			<td><input type="time" name="time" value="${reservation.time}" required></td>
		</tr>
		<tr>
			<th>People:</th>
			<td><input type="number" name="number_of_people" value="${reservation.numberOfPeople}" required></td>
		</tr>
		<tr>
			<th>Description:</th>
			<td><textarea name="remarks" rows="4">${reservation.remarks}</textarea></td>
		</tr>
	</table>
	<input type="submit" class="btn btn-primary" value="Submit" />
	<a href="ReservationServlet" class="btn btn-primary">Back</a>
</form>
</body>
</html>
