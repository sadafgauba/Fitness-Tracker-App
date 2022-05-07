<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="ISO-8859-1">
<title>FittMe - Updating Record</title>
<%
Class.forName("com.mysql.cj.jdbc.Driver");

String email= (String)request.getSession().getAttribute("email");
String date= (String)request.getSession().getAttribute("date");
String description= request.getParameter("description");
int calorieCount= Integer.parseInt(request.getParameter("calorieCount"));
Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
Statement Cmd = Con.createStatement();
String SQL = String.format("update fittmedb.calorieIntake set calorieCount = '%d', description = '%s' where email='%s' and date = '%s'", 
			calorieCount, description, email, date);
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