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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dao.CourseDao;
import dao.LessonDao;
import dao.UserCourseDao;
import javaBeans.Lesson;
import javaBeans.Staff;
import javaBeans.User;

@WebServlet(urlPatterns = { "/access/Subscribe", "/access/Usubscribe" })
public class SubscribeUnsubscribeCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/red")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getParameter("opt");
		String dum = request.getParameter("courseID");
		int courseID = Integer.parseInt(dum);
		String courseName = request.getParameter("courseName");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("myUser");

		try (UserCourseDao daouc = new UserCourseDao(ds);) {
			// subscribe
			if (path == "1") {
				daouc.setCourse(user.getUserID(), courseID);

				try (CourseDao daoC = new CourseDao(ds); LessonDao daoL = new LessonDao(ds)) {
					// versione base senza controlli sulla correttezza del nome del corso
					// serve aggiungere get course by name per inserire il controllo sul fatto che
					// il corso esista

					List<Lesson> lessons = daoC.getAllCourseLessons(courseName);

					List<Staff> instructors = new ArrayList<Staff>();

					for (Lesson lesson : lessons) {
						Staff instructor = daoL.getLessonStaff(lesson.getLessonID());
						instructors.add(instructor);
					}

					request.setAttribute("courseID", courseID);
					request.setAttribute("courseName", courseName);
					request.setAttribute("courseLessons", lessons);
					request.setAttribute("instructors", instructors);
				}

			}
			// unsubscribe
			else if (path == "2") {
				daouc.deleteCourse(user.getUserID(), courseID);
			}

			RequestDispatcher rdright = request.getRequestDispatcher("../access/userpage.jsp");
			rdright.forward(request, response);
		}
	}

}