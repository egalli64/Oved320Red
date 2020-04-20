package servletAccess;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dao.UserDao;
import javaBeans.User;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/red")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("usrn");
		String password = request.getParameter("pswd");
		
		UserDao dao = new UserDao(ds);
		User matchingUser = dao.getUser(username);  //controlla metodo uguale nel dao
		
		
		//controlla che l'username esista
		if (matchingUser.getUserName()==null) {         			//check dao
			RequestDispatcher rdwrong = request.getRequestDispatcher("wronglogin.html");
			rdwrong.forward(request, response);
		
			
		
		//se esiste
		}else {
			if(matchingUser.getPassword().equals(password)) { //login successful
				RequestDispatcher rdright = request.getRequestDispatcher("userpage.jsp");   //aggiungi pagina
				rdright.forward(request, response);
			}else {
				RequestDispatcher rdwrong = request.getRequestDispatcher("wronglogin.html");
				rdwrong.forward(request, response);
			}
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
