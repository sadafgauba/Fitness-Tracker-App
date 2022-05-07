<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="ISO-8859-1">
<title>Testing</title>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
Statement Cmd = Con.createStatement();
String date2 = "2022-05-04";
String email = "maham@gmail.com";
String SQL = String.format("select * from fittmedb.calorieIntake where date='%s' and email='%s';",date2, email);
ResultSet Dat = Cmd.executeQuery(SQL);
String date1 = "";
String description = "";
int calorieCount = -1;
String ErrMsg = "";
%>


<!-- 	date1 = Dat.getString("date");
	description = Dat.getString("description");
	calorieCount = Dat.getInt("calorieCount");
}
String Err = "";
 -->

</head>
<body style="background-color: black">
<h1 style="color: white">Hello!</h1>

<div style="color: red;font-weight: bold;font-family: 'Open Sans', sans-serif; margin-bottom: 10px; margin-top:-10px">
	<%
	if (ErrMsg != ""){
		out.println(ErrMsg);
	} else {
		/* do nothing */
	}
	%>
</div>
<table cellspacing="10" cellpadding="10" style="text-align: left; margin-left: 10px; padding-left: 20px" >
	<tr style="color: white;font-weight: bolder;font-family: 'Open Sans', sans-serif; margin-bottom: 10px; margin-top:-10px; font-size: 20px">
		<th>Data</th>
		<th>Description</th>
		<th>Calories</th>
	</tr>
	<%
	if (ErrMsg != ""){
		
	} else {
		while(Dat.next()){
	%>
	<tr style="color: white;font-family: 'Open Sans', sans-serif; margin-bottom: 10px; margin-top:-10px">
		<td><%=Dat.getString("date")%></td>
		<td style="text-align: right"><%=Dat.getString("description") %></td>
		<td style="text-align: right"><%=Dat.getInt("calorieCount")%></td>
	</tr>
	<% }
		} %>
</table>
<br>
<br>
</body>
</html>