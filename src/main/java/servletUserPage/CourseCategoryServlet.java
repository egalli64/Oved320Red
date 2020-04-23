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

import dao.CategoryDao;
import javaBeans.Course;

@WebServlet("/access/CourseCategory")
public class CourseCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/red")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String categoryName = request.getParameter("choice");
		

		try (CategoryDao categoryDao = new CategoryDao(ds);) {
			List<Course> categoryCourses = categoryDao.getAllCategoryCourses(categoryName);

			HttpSession session = request.getSession();

			@SuppressWarnings("unchecked") // sono sicura del cast.
			List<Course> myCourses = (List<Course>) session.getAttribute("myCourses");

			List<Course> newCourses = new ArrayList<>();
			List<Course> oldCourses = new ArrayList<>();

			for (Course course : categoryCourses) {   //coursi della categoria
				newCourses.add(course);
				for (Course mycourse : myCourses) {
					if (mycourse.getCourseID()==course.getCourseID()) {
						oldCourses.add(course);
						newCourses.remove(course);
						break;
					}
				}
			}
			
			request.setAttribute("oldCourses", oldCourses);
			request.setAttribute("newCourses", newCourses);

			RequestDispatcher userpage = request.getRequestDispatcher("../access/userpage.jsp");
			userpage.forward(request, response);

		}
	}

}
