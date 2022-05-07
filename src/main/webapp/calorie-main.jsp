<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="ISO-8859-1">
<title>FittMe - Calorie Intake Logs</title>

</head>
<body class="login_body">
	<header>
		<div class="main">
			<h1 class="title">Fittme</h1>
			<h1 class="login_title">CALORIE INTAKE LOG</h1>
			<br><br>
			
			<div class="table-centering">
			
			<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			String date = request.getParameter("date");
			String email= (String)request.getSession().getAttribute("email");
			System.out.println("email in calorie-main.jsp: " + email);
			System.out.println(date);
			String ErrMsg="";
			if (date == "" || date == null) {
				ErrMsg = "Please choose a date";
				/* request.getSession().setAttribute("email", email); */
			} else {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
				Statement cmd = con.createStatement();
				String sql = String.format("select * from fittmedb.calorieIntake where date='%s' and email='%s'", date, email);
				ResultSet Dat = cmd.executeQuery(sql);
				Boolean RecordExists=Dat.next();
			
				if (!RecordExists) {
					ErrMsg="No record exists for this date,\nPlease choose a different date";
					/* request.getSession().setAttribute("email", email); */
					Dat.close();
					cmd.close();
					con.close();
				}
				else { 
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
					cmd = con.createStatement();
					sql = String.format("select date, description, calorieCount from fittmedb.calorieIntake where date='%s' and email='%s';",date, email);
					Dat = cmd.executeQuery(sql);
					String date_show = "";
					String description_show = "";
					int calorieCount_show = -1;	
				

%>
			<br>
			
			<table cellspacing="10" cellpadding="10" style="text-align: left; margin-left: 10px; padding-left: 20px" >
				<tr style="color: white;font-weight: bolder;font-family: 'Open Sans', sans-serif; margin-bottom: 10px; margin-top:-10px; font-size: 20px">
					<th>Data</th>
					<th>Description</th>
					<th>Calories</th>
				</tr>
				<%
				String description_hiding = "...";
				if (ErrMsg != ""){
					
				} else {
					while(Dat.next()){
					description_show = Dat.getString("description");
					date_show = Dat.getString("date");
					calorieCount_show = Dat.getInt("calorieCount");
				%>
				<tr style="color: white;font-family: 'Open Sans', sans-serif; margin-bottom: 10px; margin-top:-10px">
					<td><%=date_show%></td>
					<td style="text-align: right"><%=description_hiding%></td>
					<td style="text-align: right"><%=calorieCount_show%></td>
				</tr>
				<%  
					request.getSession().setAttribute("date", date_show);
					request.getSession().setAttribute("description", description_show);
					request.getSession().setAttribute("calorieCount", calorieCount_show);
					request.getSession().setAttribute("email", email);
					}
				}
				%>
			</table>
			<div>
			<form action="calorie-form2.jsp" method="post">
			<button type="submit" name="edit" class="signup_btn2">View/Edit</button>
			<%
			%>
			</form>
			<form action="remove-record.jsp" method="post">
			<button type="submit" name="delete" class="signup_btn2">Delete</button>
			
			</form>
			</div>
			<% }} %>
			<div style="color: red;font-weight: bold;font-family: 'Open Sans', sans-serif; margin-bottom: 10px; margin-top:20px">
				<%
				if (ErrMsg != ""){
					out.println(ErrMsg);
				} else {
					/* do nothing */
				}
				%>
			</div>
			<br>
			<form action="calorie-main.jsp" method="post">
			<input type="date" name="date" placeholder="Choose date">
			<br>
			<br>
			<button type="submit" class="signup_btn2">SEE RECORD</button>
			</form>
			</div>
			<a href="home.jsp"><button class="back_btn">BACK</button></a>
			<form action="calorie-form.html" method="post">
			<button type="submit" class="back_btn">ADD A LOG</button>
			</form>
			<br>
		</div>

	</header>
</body>

</html>