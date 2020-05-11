package servletMenu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.google.gson.Gson;

import dao.CategoryDao;
import javaBeans.Category;

@WebServlet("/menu/AllCategoriesMenu")
public class AllCategoriesMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Resource(name = "jdbc/red")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try (CategoryDao categoryDao = new CategoryDao(ds);) {
			List<Category> categories = categoryDao.getAll();

			String JsonCategoryCourses = new Gson().toJson(categories);
			
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			out.print(JsonCategoryCourses);
			out.flush();
		}

	}

}
