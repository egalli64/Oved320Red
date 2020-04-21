package javaBeans;


public class Lesson {
	private int lessonID;      
	private int courseID;	   	
	private int staffID;	
	private int duration;
	private String URL;
	
	public Lesson() {
		
	}
	
	public Lesson(int lessonID, int courseID, int staffID, int duration, String URL) {
		this(courseID, staffID, duration, URL);
		this.lessonID = lessonID;
	}

	public Lesson(int courseID, int staffID, int duration, String URL) {
		this.courseID = courseID;
		this.staffID = staffID;
		this.duration = duration;
		this.URL = URL;
	}

	public int getLessonID() {
		return lessonID;
	}


	public void setLessonID(int lessonID) {
		this.lessonID = lessonID;
	}


	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}

	public int getStaffID() {
		return staffID;
	}


	public void setInstructorID(int staffID) {
		this.staffID = staffID;
	}


	public int getDuration() {
		return duration;
	}


	public void setDuration(int duration) {
		this.duration = duration;
	}


	public String getURL() {
		return URL;
	}


	public void setURL(String URL) {
		this.URL = URL;
	}
	
	
}
