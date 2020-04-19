package javaBeans;

import java.sql.Date;

public class User {
	
	private int userID;		      //or String?
	private Date birthDate;		
	private String userName;	
    private String firstName;	   
    private String lastName;
    private String email; 	
    private int phoneNumber; 	
    private String streetAddress;		
//  private certificate; ??       //che tipo si usa? 
    private Date subscrDate;	
    private String password;
    
	public User(int userID, Date birthDate, String userName, String firstName, String lastName, String email,
			int phoneNumber, String streetAddress, Date subscrDate, String password) {
		super();
		this.userID = userID;
		this.birthDate = birthDate;
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.streetAddress = streetAddress;
		this.subscrDate = subscrDate;
		this.password = password;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	public Date getSubscrDate() {
		return subscrDate;
	}
	public void setSubscrDate(Date subscrDate) {
		this.subscrDate = subscrDate;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

    
    
}


