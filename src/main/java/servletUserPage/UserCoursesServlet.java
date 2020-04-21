package servletUserPage;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dao.CourseDao;
import javaBeans.Lesson;

@WebServlet("/access/UserCourses")
public class UserCoursesServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/red")
	private DataSource ds;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String courseName = request.getParameter("courseName");
		
		try (CourseDao dao = new CourseDao(ds)) {
			//versione base senza controlli sulla correttezza del nome del corso
			//serve aggiungere get course by name per inserire il controllo sul fatto che il corso esista
			
			List<Lesson> results = dao.getAllCourseLessons(courseName);
			
			request.setAttribute("courseLessons", results);
			RequestDispatcher rd = request.getRequestDispatcher("userLesson.jsp"); //come si chiama?
			rd.forward(request, response);

			
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
