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

import javaBeans.Lesson;
import javaBeans.Staff;
import javaBeans.User;

public class LessonDao implements Closeable {
	private static final String GET_ALL = "SELECT lesson_id, course_id, duration, staff_id, URL "
			+ "FROM lessons";
	private static final String GET_ALL_LESSON_USERS = "SELECT user_id, birth_date, user_name, first_name, " 
			+ "last_name, e_mail, phone_number, address, med_certificate, subscr_date, passw "
			+ "FROM users JOIN users_lessons USING(user_id) JOIN lessons USING(lesson_id) where lesson_id = ?";
	private static final String GET_LESSON_INSTRUCTOR = "SELECT user_name, first_name, last_name, job_title, email FROM lessons JOIN staff USING(staff_id)"
			+ "JOIN jobs USING(job_id) WHERE lesson_id = ?";
	
	private static final String SET_LESSON = "INSERT INTO courses (course_id, duration, staff_id, URL"
			+ ") values(?, ?, ?, ?)";

	private Connection conn;

	public LessonDao(DataSource ds) {
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

	public List<Lesson> getAll() { // K
		List<Lesson> results = new ArrayList<>();

		try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(GET_ALL)) {
			while (rs.next()) {
				Lesson lesson = new Lesson(rs.getInt(1), rs.getInt(2), rs.getInt(3) , rs.getInt(4), rs.getString(5));
				results.add(lesson);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}

		return results;
	}

	public List<User> getAllLessonUsers(int lessonID) { // K
		List<User> results = new ArrayList<>();

		try (PreparedStatement prepStmt = conn.prepareStatement(GET_ALL_LESSON_USERS)) {
			prepStmt.setInt(1, lessonID);
			
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
	
	//
	public Staff getLessonStaff(int lessonID) { // K
		Staff results = new Staff();

		try (PreparedStatement prepStmt = conn.prepareStatement(GET_LESSON_INSTRUCTOR)) {
			prepStmt.setInt(1, lessonID);
			
	        try (ResultSet rs = prepStmt.executeQuery()) {
				while (rs.next()) {
					/*
					 * N.B. nel job_id è contenuto il job_name per comodità
					 */
					results = new Staff(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
	            }
	        }
		} catch (SQLException se) {
			se.printStackTrace();
			
		}

		return results;
	}
	

	public void setLesson(int courseID, int duration, int staffID, String URL) {

		try (PreparedStatement prepStmt = conn.prepareStatement(SET_LESSON)) {
			prepStmt.setInt(1, courseID);
			prepStmt.setInt(2, duration);
			prepStmt.setInt(3, staffID);
			prepStmt.setString(4, URL);
			
			prepStmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return;
	}


}
