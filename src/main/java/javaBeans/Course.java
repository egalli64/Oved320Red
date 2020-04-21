package javaBeans;

//servono solo i getters in realta, giusto?

public class Course {
	private int courseID;	   //or String?
	private String courseName; 
	private String categoryID;    //or String?
	private int cost;
	
	public Course(int courseID, String courseName, String categoryID, int cost) {
		this(courseName, categoryID, cost);
		this.courseID = courseID;
	}
	
	public Course(String courseName, String categoryID, int cost) {
		this.courseName = courseName;
		this.categoryID = categoryID;
		this.cost = cost;
	}
	
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
	public String getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(String categoryID) {
		this.categoryID = categoryID;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}


}
