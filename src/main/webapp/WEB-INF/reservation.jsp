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
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
	</style>

</head>
<body>
<div id="myModal" class="modal">
	<div class="modal-content">
		<span class="close">&times;</span>
		<p id="modalText">Your reservation ID is: </p>
	</div>
</div>

<%
	Integer reservationId = (Integer) session.getAttribute("reservationId");
	if (reservationId != null) {
		session.removeAttribute("reservationId");
%>
<script>
    window.onload = function() {
        var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];
        document.getElementById("modalText").innerHTML += "<b><%= reservationId %></b>";

        modal.style.display = "block";
        span.onclick = function() {
            modal.style.display = "none";
        }
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    }
</script>
<%
	}
%>

<%@ include file="jspf/header.jspf" %>
<h1>Book Your Round!</h1>
<form action="ReservationServlet" method="post">
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
	<input type="submit" class="btn btn-primary" value="Submit" />
	<a href="EditReservationServlet" class="btn btn-primary">Edit Reservation</a>
</form>
</body>
</html>