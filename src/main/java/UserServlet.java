

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/signup")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Signup signup = new Signup();

    /**
     * Default constructor. 
     */
    public UserServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/webapp/sigup.html");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("Email"); 
		String fname = request.getParameter("FName");
		String lname = request.getParameter("LName");
		String password = request.getParameter("Password");
		
		User user = new User();
		user.setEmail(email);
		user.setFName(fname);
		user.setLName(lname);
		user.setPassword(password);
		
		try {
			signup.signupProcess(user);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/webapp/home.html");
		dispatcher.forward(request, response);
		
	}

}
