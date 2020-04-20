package dao;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import javaBeans.User;


public class UserDao implements Closeable {
	private static final String GET_ALL = "SELECT user_id, birth_date, user_name, first_name, "
			+ "last_name, e_mail, phone_number, address, subscr_date, passw FROM users";
	private static final String GET_USER = "SELECT user_id, birth_date, user_name, first_name, "
			+ "last_name, e_mail, phone_number, address, med_certificate, subscr_date, passw FROM users "
			+ "where user_name = ?";

	private static final String SET_USER = "INSERT INTO users (birth_date, user_name, first_name, "
			+ "last_name, e_mail, phone_number, address, subscr_date, passw) values(?, ?, ?, ?, ?, "
			+ "?, ?, CURDATE(), ?)";

	private Connection conn;

	public UserDao(DataSource ds) {
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

	public List<User> getAll() {
		List<User> results = new ArrayList<>();

		try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(GET_ALL)) {
			while (rs.next()) {
				LocalDate birthDate = rs.getDate(2).toLocalDate();
				LocalDate subscrDate = rs.getDate(10).toLocalDate();
				User user = new User(rs.getInt(1), birthDate, rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), subscrDate,
						rs.getString(11));
				results.add(user);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}

		return results;
	}

	public User getUser(String name) {
		User results = new User();

		try (PreparedStatement prepStmt = conn.prepareStatement(GET_USER)) {
			prepStmt.setString(1, name);
			
	        try (ResultSet rs = prepStmt.executeQuery()) {
				while (rs.next()) {
					LocalDate birthDate = rs.getDate(2).toLocalDate();
					LocalDate subscrDate = rs.getDate(10).toLocalDate();
					results = new User(rs.getInt(1), birthDate, rs.getString(3), rs.getString(4), rs.getString(5),
							rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), subscrDate,
							rs.getString(11));;
	            }
	        }
		} catch (SQLException se) {
			se.printStackTrace();
			
		}

		return results;
	}
	

/*
 * uso il costruttore senza certificato, per il momento non sappiamo come trattarlo
 */
	public void setUser(Date birthDate, String userName, String firstName, String lastName, String email,
			String phoneNumber, String streetAddress, String password) {

		try (PreparedStatement prepStmt = conn.prepareStatement(SET_USER)) {
			prepStmt.setDate(1, birthDate);
			prepStmt.setString(2, userName);
			prepStmt.setString(3, firstName);
			prepStmt.setString(4, lastName);
			prepStmt.setString(5, email);
			prepStmt.setString(6, phoneNumber);
			prepStmt.setString(7, streetAddress);
			prepStmt.setString(8, password);
			
			prepStmt.executeQuery();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return;
	}

}
