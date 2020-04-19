package javaBeans;

//servono solo i getters in realta, giusto?

public class Course {
	private int courseID;	   //or String?
	private String courseName;
	private int frequency;     //non mi è chiaro cosa si intende per frequenza? 
	private int categoryID;    //or String?
	private int cost;
	
	public Course(int courseID, String courseName, int frequency, int categoryID, int cost) {
		super();
		this.courseID = courseID;
		this.courseName = courseName;
		this.frequency = frequency;
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
	public int getFrequency() {
		return frequency;
	}
	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}


}
