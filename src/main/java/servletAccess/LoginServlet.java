package servletAccess;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dao.UserDao;
import javaBeans.Course;
import javaBeans.User;

@WebServlet("/access/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/red")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("usrn");
		String password = request.getParameter("pswd");

		try (UserDao dao = new UserDao(ds)) {
			User matchingUser = dao.getUser(username); // controlla metodo uguale nel dao
			String error = "";
			if (matchingUser.getUserName() != null && matchingUser.getPassword().equals(password)) { // login successful
				request.setAttribute("user", matchingUser);
				
				List<Course> courses = dao.getAllUserCourses(username);
				request.setAttribute("userCourses", courses);
				
				String firstName = matchingUser.getFirstName();
				String lastName = matchingUser.getLastName();
				
				HttpSession session = request.getSession(); 
				session.setAttribute("myAccount",username);
				session.setAttribute("myPassword",password);
				session.setAttribute("myFirstName",firstName);
				session.setAttribute("myLastName",lastName);		
			
				RequestDispatcher rdright = request.getRequestDispatcher("userpage.jsp");
				rdright.forward(request, response);
				return;

			} else {
				request.setAttribute("userName", username);
				error = "Login NOT succesful. <br> Wrong Username or Password.";
				request.setAttribute("returnError", error);
				RequestDispatcher rdwrong = request.getRequestDispatcher("Login.jsp");
				rdwrong.forward(request, response);

			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
