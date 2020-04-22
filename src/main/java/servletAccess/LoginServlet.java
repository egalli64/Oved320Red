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
				
				HttpSession session = request.getSession();
				List<Course> courses = dao.getAllUserCourses(username);
				session.setAttribute("myCourses", courses);
				session.setAttribute("myUser",matchingUser);
			
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
