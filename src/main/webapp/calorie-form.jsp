<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="ISO-8859-1">
<title>FittMe - Calorie Intake Form</title>
<%
Class.forName("com.mysql.cj.jdbc.Driver");

String date = request.getParameter("date");
String description = request.getParameter("description");
int calorieCount = Integer.parseInt(request.getParameter("calorieCount"));
String email= (String)request.getSession().getAttribute("email");
System.out.println("Email in calorie form: " + email);


String ErrMsg="";
Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
Statement Cmd = Con.createStatement();
String SQL = String.format("select date, email from fittmedb.calorieIntake where date='%s' and email='%s';",date, email);
ResultSet Dat = Cmd.executeQuery(SQL);
Boolean recordExists = Dat.next();
if (recordExists) {
	ErrMsg = "Record already exists, please choose a different date"; 
	/* out.println(ErrMsg); */
} else {
	Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
	Cmd = Con.createStatement();
	System.out.printf("%s", email);
	SQL = String.format("insert into fittmedb.calorieIntake(email, date, description, calorieCount) values('%s', '%s', '%s', '%d')", email, date,
			description, calorieCount);
	Cmd.executeUpdate(SQL);
		Dat.close();
		Cmd.close();
		Con.close();
		request.getSession().setAttribute("email", email);
		request.getRequestDispatcher("calorie-main.html").forward(request, response);
}

%>
</head>
<body class="login_body">
		<header>
			<div class="main">
				<h1 class="title">Fittme</h1>
				<h1 class="login_title">CALORIE INTAKE</h1>
				<form action="calorie-form.jsp" method="post">
					<div style="color: red;font-weight: bold;font-family: 'Open Sans', sans-serif; margin-bottom: 10px; margin-top:-10px">
					<%=ErrMsg %>
					</div>
					<h3 class="headlines ">Calories</h3>
					<input type="number" name="calorieCount" placeholder="" maxlength="5">
					<br>
					<br>
					<h3 class="headlines">Description</h3>
					<textarea class="textbox" type="text" name="description" placeholder="Enter description here"></textarea>
					<br>
					<br>
					<h3 class="headlines">Date</h3>
					<input type="date" name="date">
					<br>
					<br>
					<button type="submit" class="login_btn2">SUBMIT</button>
				</form>
				<a href="calorie-main.html"><button class="back_btn">BACK</button></a>
			</div>
	
		</header>
	</body>
</html>