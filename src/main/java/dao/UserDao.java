package dao;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import javaBeans.User;

public class UserDao implements Closeable{
	
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

	//QUERY METHODS

//	public List<User> getAllUsers(String usrName) {
//		
//	}
	
//	public User getUser(String userName) {
//		
//	}
	
//	public void insertUser(User user) {
//		
//	}
	
	
	
	
}
