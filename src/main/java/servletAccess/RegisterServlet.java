package servletAccess;

import java.io.IOException;
import java.sql.Date;

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

@WebServlet("/htmlAccess/Register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/red")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("usrn");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
//		@SuppressWarnings("deprecation")
//		Date birthDate = new Date(2000, 0, 1);
		
		Date birthDate = Date.valueOf(request.getParameter("birthdate"));
		String password = request.getParameter("pswd");
		String password2 = request.getParameter("pswd2");

		try (UserDao dao = new UserDao(ds)) {
			User matchingUser = dao.getUser(userName);

			if (matchingUser.getUserName() != null) {
				request.setAttribute("firstName", firstName);
				request.setAttribute("lastName", lastName);
				request.setAttribute("email", email);
				request.setAttribute("phone", phone);
				request.setAttribute("address", address);
				RequestDispatcher rd = request.getRequestDispatcher("../jsp/jspAccess/wrongRegisterName.jsp");
				rd.forward(request, response);
			} else if (matchingUser.getUserName() == null && !password.equals(password2)) {
				request.setAttribute("userName", userName);
				request.setAttribute("firstName", firstName);
				request.setAttribute("lastName", lastName);
				request.setAttribute("email", email);
				request.setAttribute("phone", phone);
				request.setAttribute("address", address);
				RequestDispatcher rd = request.getRequestDispatcher("../jsp/jspAccess/wrongRegisterPass.jsp");
				rd.forward(request, response);
			} else if (matchingUser.getUserName() == null && password.equals(password2)) {
				dao.setUser(birthDate, userName, firstName, lastName, email, phone, address, password);
				RequestDispatcher rd = request.getRequestDispatcher("../jsp/jspAccess/userpage.jsp");
				rd.forward(request, response);
			}
		}

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
