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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dao.UserDao;
import javaBeans.User;

@WebServlet("/access/Register")
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
			String error = "";

			if (matchingUser.getUserName() != null) {
				userName = "";
				error = "Registration NOT successful! <br> Username already existing";
			} else if (matchingUser.getUserName() == null && !password.equals(password2)) {
				error = "Registration NOT successful! <br> The second password differs from the first one. Plaese type again.";
			} else if (matchingUser.getUserName() == null && password.equals(password2)) {
				
				HttpSession session = request.getSession(); 
				session.setAttribute("myAccount",userName);
				session.setAttribute("myPassword",password);
				session.setAttribute("myFirstName",firstName);
				session.setAttribute("myLastName",lastName);
				
				dao.setUser(birthDate, userName, firstName, lastName, email, phone, address, password);
				RequestDispatcher rd = request.getRequestDispatcher("userpage.jsp");
				rd.forward(request, response);
				return;
			}
			request.setAttribute("userName", userName);
			request.setAttribute("firstName", firstName);
			request.setAttribute("lastName", lastName);
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("address", address);
			request.setAttribute("returnError", error);
			request.setAttribute("birthdata", birthDate);
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.forward(request, response);
			return;
			}
		

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
