<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Check</title>
<%
Class.forName("com.mysql.cj.jdbc.Driver");

String email = request.getParameter("email");
String password = request.getParameter("password");
String ErrMsg="";
Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
Statement Cmd = Con.createStatement();
String SQL = String.format("select email, password from fittmedb.users where email='%s' and password='%s';",email, password);
ResultSet Dat = Cmd.executeQuery(SQL);
String email_check ="";
String password_check = "";
Boolean userExists = Dat.next();
if (!userExists) {
	ErrMsg = "Wrong email and/or password. Please try again."; 
} else {
		Dat.close();
		Cmd.close();
		Con.close();
		request.getSession().setAttribute("email", email);
		request.getRequestDispatcher("home.jsp").forward(request, response);
}

%>
</head>
<body class="login_body">
		<header>
			<div class="main">
				<h1 class="title">Fittme</h1>
				<div style="color: red;font-weight: bold;font-family: 'Open Sans', sans-serif; margin-bottom: 20px; margin-top:-30px">
					<%
				if (ErrMsg != ""){
					out.println(ErrMsg);
				} else {
					/* do nothing */
				}
				%>
				</div>
				<h1 class="login_title">LOG IN</h1>
			 <form action="login.jsp" method="post">
					<input type="email" name= "email" placeholder="Email" required>
					<br>
					<br>
					<input type="password" name= "password" placeholder="Password" required>
					<br>
					<br>
				<button  type="submit" class="login_btn2">LOG IN</button>
				</form>
				<a href="welcome.html"><button class="return_login">Return to Welcome Page</button></a>
			</div>
			
		</header>
</body>
</html>