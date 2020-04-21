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

import javax.annotation.Resource;
import javax.sql.DataSource;

import javaBeans.User;
import javaBeans.UserCourses;

public class UserCourseDao implements Closeable {
	private static final String GET_ALL = "SELECT user_id, course_id FROM users_courses";
	private static final String SET_COURSE = "INSERT INTO users_courses (user_id, course_id) values(?, ?)";

	private Connection conn;

	public UserCourseDao(DataSource ds) {
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

	// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX QUERY METHODS
	// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

//	public List<UserCourses> getAll() {
//		List<UserCourses> results = new ArrayList<>();
//
//		try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(GET_ALL)) {
//			while (rs.next()) {
//				UserCourses usercourses = new UserCourses(rs.getInt(1), rs.getInt(2));
//				results.add(usercourses);
//			}
//		} catch (SQLException se) {
//			se.printStackTrace();
//		}
//
//		return results;
//	}

	
//	
//	public List<UserCourses> setCourse(int userID, int courseID) {
//		List<UserCourses> results = new ArrayList<>();
//
//		try (PreparedStatement pstmt = conn.prepareStatement(SET_COURSE);) {
//			pstmt.setInt(1, userID);
//			pstmt.setInt(2, courseID);
//		    pstmt.execute();  
//			
//		} catch (SQLException se) {
//			se.printStackTrace();
//
//		}
//		return results;
//	}
//
}
