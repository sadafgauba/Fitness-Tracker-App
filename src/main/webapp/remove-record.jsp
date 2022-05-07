<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="ISO-8859-1">
<title>FittMe - Deleting Record</title>
<%
Class.forName("com.mysql.cj.jdbc.Driver");

String email= (String)request.getSession().getAttribute("email");
String date= (String)request.getSession().getAttribute("date");

Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
Statement Cmd = Con.createStatement();
String SQL = String.format("delete from fittmedb.calorieIntake where email='%s' and date='%s'", email, date);
Cmd.executeUpdate(SQL);
Cmd.close();
Con.close();
request.getSession().setAttribute("email", email);
request.getRequestDispatcher("calorie-main.html").forward(request, response);

%>
</head>
<body>
</body>
</html>