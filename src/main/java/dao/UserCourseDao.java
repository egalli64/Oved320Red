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
	private static final String SET_COURSE = "INSERT INTO users_courses (user_id, course_id) values(?, ?)";
	private static final String DELETE_COURSE = "DELETE from users_courses WHERE user_id = ? and course_id = ?";
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

	// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX QUERY METHODS //
	// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

	public void setCourse(int userID, int courseID) {

		try (PreparedStatement pstmt = conn.prepareStatement(SET_COURSE);) {
			pstmt.setInt(1, userID);
			pstmt.setInt(2, courseID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();

		}
	}

	public void deleteCourse(int userID, int courseID) {
		try (PreparedStatement pstmt = conn.prepareStatement(DELETE_COURSE);) {
			pstmt.setInt(1, userID);
			pstmt.setInt(2, courseID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();

		}
	}

}
