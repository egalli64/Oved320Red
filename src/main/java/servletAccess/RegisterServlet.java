package servletAccess;

import java.io.IOException;
import java.sql.Date;

import javax.annotation.Resource;
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
		String birthDate = request.getParameter("birthDate");
		String password = request.getParameter("pswd");
		String password2 = request.getParameter("pswd2");
		
		UserDao dao = new UserDao(ds);
		//devo mettere un if per controllare che non esista già userName
		//se esiste già rimando a una pagina register.jsp in cui tengo salvati i dati inseriti a parte username e password
		//se non esiste controllo che pass=pass2 e se sono uguali faccio setUser
		
//		User newUser = dao.setUser(birthDate, userName, firstName, lastName, email,
//				phone, String address, password);
	}
	


}
