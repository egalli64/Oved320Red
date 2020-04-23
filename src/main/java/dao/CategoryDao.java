package dao;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import javaBeans.Category;
import javaBeans.Course;

public class CategoryDao implements Closeable {
	private static final String GET_ALL = "SELECT category_id, category_name FROM categories";
	private static final String GET_ALL_CATEGORY_COURSES = "SELECT course_id, course_name, category_id, price "
			+ "FROM categories JOIN courses USING(category_id) where category_name = ?";

	private static final String SET_CATEGORY = "INSERT INTO categories (category_id, category_name) values(?, ?)";

	private Connection conn;

	public CategoryDao(DataSource ds) {
		try {
			this.conn = ds.getConnection();
		} catch (SQLException se) {
			throw new IllegalStateException("Connection failed" + se.getMessage());
		}
	}

	@Override
	public void close() throws IOException {
		try {
			conn.close();
		} catch (SQLException se) {
			throw new IllegalStateException("Failed to close connection" + se.getMessage());
		}
	}

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX QUERY METHODS XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

	public List<Category> getAll() { // K
		List<Category> results = new ArrayList<>();

		try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(GET_ALL)) {
			while (rs.next()) {
				Category category = new Category(rs.getString(1), rs.getString(2));
				results.add(category);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}

		return results;
	}

	public List<Course> getAllCategoryCourses(String categoryName) { // K
		List<Course> results = new ArrayList<>();

		try (PreparedStatement prepStmt = conn.prepareStatement(GET_ALL_CATEGORY_COURSES)) {
			prepStmt.setString(1, categoryName);

			try (ResultSet rs = prepStmt.executeQuery()) {
				while (rs.next()) {
					results.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
				}
			}
		} catch (SQLException se) {
			se.printStackTrace();

		}

		return results;
	}

	public void setCategory(String categoryID, String categoryName) {

		try (PreparedStatement prepStmt = conn.prepareStatement(SET_CATEGORY)) {
			prepStmt.setString(1, categoryID);
			prepStmt.setString(2, categoryName);

			prepStmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return;
	}

}
