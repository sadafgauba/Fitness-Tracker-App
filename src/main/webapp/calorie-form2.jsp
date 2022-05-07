<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="ISO-8859-1">
<title>FittMe - View/Edit Record</title>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String email= (String)request.getSession().getAttribute("email");
String date= (String)request.getSession().getAttribute("date");
String description= (String)request.getSession().getAttribute("description");
int calorieCount= (int)request.getSession().getAttribute("calorieCount");
Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
Statement Cmd = Con.createStatement();

%>
</head>
<body class="login_body">
		<header>
			<div class="main">
				<h1 class="title">Fittme</h1>
				<h1 class="login_title">CALORIE INTAKE</h1>
				<form action="update-record.jsp" method="post">
					<h3 class="headlines ">Calories</h3>
					<input type="number" name="calorieCount" value="<%=calorieCount%>">
					<br>
					<br>
					<h3 class="headlines">Description</h3>
					<textarea class="textbox" type="text" name="description" maxlength=100><%=description%></textarea>
					<br>
					<br>
					<h3 class="headlines">Date</h3>
					<input style="color: black" type="date" name="date" value="<%=date%>" disabled>
					<br>
					<br>
					<button type="submit" class="login_btn2">UPDATE</button>
				</form>
				<a href="calorie-main.html"><button class="back_btn">BACK</button></a>
			</div>
	
		</header>
	</body>
</html>