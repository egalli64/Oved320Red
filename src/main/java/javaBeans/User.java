package javaBeans;

import java.time.LocalDate;

public class User {
	
	private int userID;		       
	private LocalDate birthDate;		
	private String userName;	
    private String firstName;	   
    private String lastName;
    private String email; 		    			
    private String phoneNumber; 	
    private String streetAddress;		
    private String certificate;    //giusto per verificare si o no. // come salvare il documento se salvare il documento?
    private LocalDate subscrDate;	
    private String password;
    
    public User() {
    	
    }
    
    public User(String userName) {
    	this.userName = userName;
    }
    
   // costruttore generale contenente tutti i dati della tabella
	public User(int userID, LocalDate birthDate, String userName, String firstName, String lastName, String email,
			String phoneNumber, String streetAddress, String certificate, LocalDate subscrDate, String password) {
		this(userID, birthDate, userName, firstName, lastName, email,
				phoneNumber,  streetAddress,  subscrDate, password);
		this.certificate = certificate;
	}
	
	// costruttore senza user_id, usato per creare utenti da inserire nel database se è fornito anche il certificato
	public User(LocalDate birthDate, String userName, String firstName, String lastName, String email,
			String phoneNumber, String streetAddress, String certificate, LocalDate subscrDate, String password) {
		this(birthDate, userName, firstName, lastName, email,
				phoneNumber, streetAddress, subscrDate, password);
		this.certificate = certificate;
	}
	
	// costruttore con user_id senza certificato
	public User(int userID, LocalDate birthDate, String userName, String firstName, String lastName, String email,
			String phoneNumber, String streetAddress, LocalDate subscrDate, String password) {
		this(birthDate, userName, firstName, lastName, email,
				phoneNumber,  streetAddress,  subscrDate, password);
		this.userID = userID;
	}
	
	// costruttore senza user_id e senza certificato (uso fino a quando decideremo cosa fare col certificato)
	public User(LocalDate birthDate, String userName, String firstName, String lastName, String email,
			String phoneNumber, String streetAddress, LocalDate subscrDate, String password) {
		this(birthDate, userName, firstName, lastName, email,
				phoneNumber,  streetAddress, password);
		this.subscrDate = subscrDate;
	}
	 
	/*
	 * costruttore senza user_id, usato per creare utenti da inserire nel database senza
	 * user_id, certificato o subscribe date (generata con curdate())
	 */
	public User(LocalDate birthDate, String userName, String firstName, String lastName, String email,
			String phoneNumber, String streetAddress, String password) {
		this.birthDate = birthDate;
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.streetAddress = streetAddress;
		this.password = password;
	}
	
	

	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public LocalDate getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(LocalDate birthDate) {
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
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	public LocalDate getSubscrDate() {
		return subscrDate;
	}
	public void setSubscrDate(LocalDate subscrDate) {
		this.subscrDate = subscrDate;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
    
    
}


