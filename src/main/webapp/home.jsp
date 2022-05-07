<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="ISO-8859-1">
<title>Fittme - Home</title>
<%

String email= (String)request.getSession().getAttribute("email");
Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
Statement Cmd = Con.createStatement();
String SQL = String.format("select fname from fittmedb.users where email='%s';", email);
ResultSet Dat = Cmd.executeQuery(SQL);
String fname = "";
String result = "";

while(Dat.next()){
	result = Dat.getString("fname");
	fname = result.substring(0, 1).toUpperCase() + result.substring(1);
}

%>
</head>

<body class="login_body">
	<header>
		<div class="main">
			<h1 class="title">Fittme</h1>
			<h1 class="login_title">Hello <%=fname%>!</h1>
			<br>
			<h4 class="track_msg">Track your calories here in "Calorie Intake Log" </h4>
			<br><br><br>
			<a href="calorie-main.html"><button class="cal_intake_btn">CALORIE INTAKE LOG</button></a>
			<br><br><br>
			<a href="login.html"><button class="back_btn">SIGN OUT</button> </a>
			<br><br><br><br>
			<br>
		</div>

	</header>
</body>

</html>