package servletAccess;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dao.UserDao;
import javaBeans.User;

@WebServlet("/htmlAccess/Login")
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

			if (matchingUser.getUserName() == null) { // check dao
				request.setAttribute("userName", username);
				RequestDispatcher rdwrong = request.getRequestDispatcher("../jsp/jspAccess/wrongLogin.jsp");
				rdwrong.forward(request, response);

			} else {
				if (matchingUser.getPassword().equals(password)) { // login successful

					request.setAttribute("user", matchingUser);

					RequestDispatcher rdright = request.getRequestDispatcher("../jsp/jspAccess/userpage.jsp");

					rdright.forward(request, response);

				} else {
					request.setAttribute("userName", username);
					RequestDispatcher rdwrong = request.getRequestDispatcher("../jsp/jspAccess/wrongLogin.jsp");
					rdwrong.forward(request, response);
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
