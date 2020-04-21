package servletUserPage;

import java.io.IOException;
import java.util.ArrayList;
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
import dao.LessonDao;
import javaBeans.Lesson;
import javaBeans.Staff;

@WebServlet("/access/UserCourses")
public class UserCoursesServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/red")
	private DataSource ds;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String courseName = request.getParameter("courseName");
		
		try (CourseDao daoC = new CourseDao(ds); LessonDao daoL = new LessonDao(ds)) {
			//versione base senza controlli sulla correttezza del nome del corso
			//serve aggiungere get course by name per inserire il controllo sul fatto che il corso esista
								
			List<Lesson> lessons = daoC.getAllCourseLessons(courseName);
			
			List<Staff> instructors = new ArrayList<Staff>();
			
			for(Lesson lesson : lessons) {
				Staff instructor = daoL.getLessonStaff(lesson.getLessonID());
				instructors.add(instructor);
			}
			
			request.setAttribute("courseName", courseName);
			request.setAttribute("courseLessons", lessons);
			request.setAttribute("instructors", instructors);
			RequestDispatcher rd = request.getRequestDispatcher("../loggedin/coursesummary.jsp"); 
			rd.forward(request, response);

			
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
