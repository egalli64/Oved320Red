package servletUserPage;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

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
import javaBeans.User;

@WebServlet("/loggedin/UpdateUser")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/red")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User myUser = (User) session.getAttribute("myUser");

		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String streetAddress = request.getParameter("streetAddress");
		Date birthDate = Date.valueOf(request.getParameter("birthDate")); 

		try (UserDao daoU = new UserDao(ds);) {

			daoU.updateUser(birthDate, userName,  firstName, lastName, email, phoneNumber,
					streetAddress, password);
	
			myUser.setUserName(userName);
			myUser.setPassword(password);
			myUser.setFirstName(firstName);
			myUser.setLastName(lastName);
			myUser.setEmail(email);
			myUser.setPhoneNumber(phoneNumber);
			myUser.setStreetAddress(streetAddress);
			myUser.setBirthDate(birthDate.toLocalDate());
			
			session.setAttribute("myUser", myUser);
			RequestDispatcher rd = request.getRequestDispatcher("myAccount.jsp");
			rd.forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
