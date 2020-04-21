package javaBeans;

import java.time.LocalDate;

public class Staff {
	private int staffID;
	private LocalDate birthDate;
	private String userName;
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	private String streetAddress;
	private String certificate;
	private LocalDate hireDate;
	private String password;
	private String IBAN;
	private int salary;
	private String jobID;

	public Staff() {

	}

	public Staff(int staffID, LocalDate birthDate, String userName, String firstName, String lastName, String email, String phoneNumber,
			String streetAddress, String certificate, LocalDate hireDate, String password, String IBAN, int salary,
			String jobID) {
		this(birthDate, userName, firstName, lastName, email, phoneNumber, streetAddress, certificate, hireDate, 
				password, IBAN, salary, jobID);
		this.staffID = staffID;

	}


	public Staff(LocalDate birthDate, String userName, String firstName, String lastName, String email, String phoneNumber,
			String streetAddress, String certificate, LocalDate hireDate, String password, String IBAN, int salary,
			String jobID) {
		this.birthDate = birthDate;
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.streetAddress = streetAddress;
		this.certificate = certificate;
		this.hireDate = hireDate;
		this.password = password;
		this.IBAN = IBAN;
		this.salary = salary;

	}
	
	public Staff(String userName, String firstName, String lastName, String jobID, String email) {
		this.userName = userName;
		this.firstName = firstName;
		this.jobID = jobID;
		this.email = email;		
	}
	
	public int getStaffID() {
		return this.staffID;
	}
	
	public void setStaffID(int staffID) {
		this.staffID = staffID;
	}
	
	public LocalDate getBirthDate() {
		return this.birthDate;
	}
	
	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}
	
	public String getUserName() {
		return this.userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getFirstName() {
		return this.firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return this.lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhoneNumber() {
		return this.phoneNumber;
	}
	
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public String getStreetAddress() {
		return this.streetAddress;
	}
	
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	
	public String getCertificate() {
		return this.certificate;
	}
	
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	
	public LocalDate getHireDate() {
		return this.hireDate;
	}
	
	public void setHireDate(LocalDate hireDate) {
		this.hireDate = hireDate;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getIBAN() {
		return this.IBAN;
	}
	
	public void setIBAN(String IBAN) {
		this.IBAN = IBAN;
	}
	
	public int getsalary() {
		return this.salary;
	}
	
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
	public String getJobID() {
		return this.jobID;
	}
	
	public void setJobID(String jobID) {
		this.jobID = jobID;
	}
}
