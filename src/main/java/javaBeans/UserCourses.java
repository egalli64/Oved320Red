package javaBeans;

public class UserCourses {
	private int userID;		      //or String?
	private int courseID;

	public UserCourses() {
	}
	
	public UserCourses(int userID, int courseID) {
		super();
		this.userID = userID;
		this.courseID = courseID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	
	
	//a questo bean si potrebbe aggiungere la proprietà lezioni per tener conto anche delle lezioni in un'unica tabella no?
	//Se sono in tabella sql unica, anche qui. altrimenti se sono tabelle separate, anceh javaBeans devono essere separati. 
	

}
