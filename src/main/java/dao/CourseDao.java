package dao;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import javaBeans.Course;
import javaBeans.User;

public class CourseDao implements Closeable {
	private static final String GET_ALL = "SELECT course_id, course_name, category_id, price "
			+ "FROM courses";
	private static final String GET_ALL_COURSE_USERS = "SELECT user_id, birth_date, user_name, first_name, " 
			+ "last_name, e_mail, phone_number, address, med_certificate, subscr_date, passw "
			+ "FROM users JOIN users_courses USING(user_id) JOIN courses USING(course_id) where course_name = ?";

	private static final String SET_COURSE = "INSERT INTO courses (course_name, category_id, price"
			+ ") values(?, ?, ?)";

	private Connection conn;

	public CourseDao(DataSource ds) {
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

	public List<Course> getAll() { // K
		List<Course> results = new ArrayList<>();

		try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(GET_ALL)) {
			while (rs.next()) {
				Course course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3) , rs.getInt(4));
				results.add(course);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}

		return results;
	}

	public List<User> getAllCourseUsers(String courseName) { // K
		List<User> results = new ArrayList<>();

		try (PreparedStatement prepStmt = conn.prepareStatement(GET_ALL_COURSE_USERS)) {
			prepStmt.setString(1, courseName);
			
	        try (ResultSet rs = prepStmt.executeQuery()) {
				while (rs.next()) {
					LocalDate birthDate = rs.getDate(2).toLocalDate();
					LocalDate subscrDate = rs.getDate(10).toLocalDate();
					results.add(new User(rs.getInt(1), birthDate, rs.getString(3), rs.getString(4), rs.getString(5),
							rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), subscrDate,
							rs.getString(11)));
	            }
	        }
		} catch (SQLException se) {
			se.printStackTrace();
			
		}

		return results;
	}
	

	public void setCourse(String course_name, String categoryID, int price) {

		try (PreparedStatement prepStmt = conn.prepareStatement(SET_COURSE)) {
			prepStmt.setString(1, course_name);
			prepStmt.setString(2, categoryID);
			prepStmt.setInt(3, price);
			
			prepStmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return;
	}

}
