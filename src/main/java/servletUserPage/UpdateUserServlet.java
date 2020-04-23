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
		
		if (request.getParameter("control").equals("psn")) {
			myUser.setFirstName(request.getParameter("firstName"));
			myUser.setLastName(request.getParameter("lastName"));
			myUser.setEmail(request.getParameter("email"));
			myUser.setPhoneNumber(request.getParameter("phoneNumber"));
			myUser.setStreetAddress(request.getParameter("streetAddress"));
			Date date = Date.valueOf(request.getParameter("birthDate"));
			myUser.setBirthDate(date.toLocalDate());
		}
		
		if (request.getParameter("control").equals("un")) {
			myUser.setUserName(request.getParameter("userName"));
		}
		
		if (request.getParameter("control").equals("ps")) {
			myUser.setPassword(request.getParameter("password1"));
		}
		
		String userName = myUser.getUserName();
		String password = myUser.getPassword();
		String firstName = myUser.getFirstName();
		String lastName = myUser.getLastName();
		String email = myUser.getEmail();
		String phoneNumber = myUser.getPhoneNumber();
		String streetAddress = myUser.getStreetAddress();
		Date birthDate = Date.valueOf(myUser.getBirthDate());
		int id = myUser.getUserID();
		
		try (UserDao daoU = new UserDao(ds);) {
			
			daoU.updateUser(birthDate, userName, firstName, lastName, email, 
					phoneNumber, streetAddress, password, id);


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
