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
import dao.UserDao;
import javaBeans.Course;
import javaBeans.Lesson;
import javaBeans.Staff;
import javaBeans.User;

@WebServlet(urlPatterns = { "/access/Subscribe", "/access/Unsubscribe" })
public class SubscribeUnsubscribeCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/red")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String opt = request.getParameter("opt");
		String dum = request.getParameter("courseID");
		int courseID = Integer.parseInt(dum);

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("myUser");

		try (UserCourseDao daouc = new UserCourseDao(ds); UserDao daou = new UserDao(ds);) {
			// subscribe
			if (opt.equals("1")) {
				daouc.setCourse(user.getUserID(), courseID);
			}
		
			// unsubscribe
			else if (opt.equals("2")) {
				daouc.deleteCourse(user.getUserID(), courseID);
			}
		
		List<Course> courses = daou.getAllUserCourses(user.getUserName());
		session.setAttribute("myCourses", courses);

		RequestDispatcher rdright = request.getRequestDispatcher("../access/userpage.jsp");
		rdright.forward(request, response);

	}

}
}