package servletMenu;

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

@WebServlet("/index")
public class AllCoursesMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/red")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String categoryName = request.getParameter("choice");

		try (CategoryDao categoryDao = new CategoryDao(ds);) {

			List<Course> categoryCourses = categoryDao.getAllCategoryCourses(categoryName);

			request.setAttribute("categoryCourses", categoryCourses);
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.forward(request, response);
			return;
		}

	}
}
