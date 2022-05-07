<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="ISO-8859-1">
<title>Fittme - Signup</title>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String password = request.getParameter("password");
String password2 = request.getParameter("password2"); 
String ErrMsg="";
 
if (password == null || password2 == null){
	/* request.getRequestDispatcher("home.html").forward(request, response); */
}
else if (password.compareTo(password2) != 0) {
	ErrMsg="Passwords do not match!"; 
} 

else {
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
	Statement cmd = con.createStatement();
	String sql = String.format("select * from fittmedb.users where email='%s'", email);
	ResultSet Dat = cmd.executeQuery(sql);
	
	Boolean UserExists=Dat.next();
	
	if (UserExists) {
		ErrMsg="The email <"+email+"> is taken. Please enter a different email.";
		//out.println(ErrMsg);
		Dat.close();
		cmd.close();
		con.close();
	}
	else { 
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "MGMT460SQL");
		cmd = con.createStatement();
		sql = String.format("insert into fittmedb.users(fname, lname, email, password) values('%s', '%s', '%s', '%s')", fname, lname,
				email, password);
		cmd.executeUpdate(sql);
		cmd.close();
		con.close();
		request.getSession().setAttribute("email", email);
		request.getRequestDispatcher("login.html").forward(request, response);
	}
}

%>
</head>
<div id="wrapper">
<body class="signup_body">
	<header>
		<div class="main">
			<h1 class="title">Fittme</h1>
			<div style="color: red;font-weight: bold;font-family: 'Open Sans', sans-serif; margin-bottom: 10px; margin-top:-10px">
				<%
				if (ErrMsg != ""){
					out.println(ErrMsg);
				} else {
					/* do nothing */
				}
				%>
			</div>
			<h1 class="signup_title">SIGN UP</h1>
			<form action="signup.jsp" method="post">
				<br>	
				<input type="text" name="fname" placeholder="First Name" required>
				<br>
				<br>
				<input type="text" name="lname" placeholder="Last Name" required>
				<br>
				<br>
				<input type="email" name="email" placeholder="Email" required>
				<br>
				<br>
				<input type="password" name="password" placeholder="Password" required>
				<br>
				<br>
				<input type="password" name="password2" placeholder="Re-enter Password" required>
				<br>
				<button type="submit" class="signup_btn2">SIGN UP</button>
				<br>
			</form>
			<a href="welcome.html"><button class="return_signup">Return to Welcome Page</button></a>
		</div>
		
	</header>
</body>
</div>

</html>
