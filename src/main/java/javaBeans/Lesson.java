package javaBeans;


public class Lesson {
	private int lessonID;       //or String?
	private int courseID;	    //or String?
	private String lessonName;	
	private int instructorID;	//or String?
	private int duration;
	private String URL;
	
	
	public Lesson(int lessonID, int courseID, String lessonName, int instructorID, int duration, String URL) {
		this(courseID, lessonName, instructorID, duration, URL);
		this.lessonID = lessonID;
	}

	public Lesson(int courseID, String lessonName, int instructorID, int duration, String URL) {
		this.courseID = courseID;
		this.lessonName = lessonName;
		this.instructorID = instructorID;
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


	public String getLessonName() {
		return lessonName;
	}


	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}


	public int getInstructorID() {
		return instructorID;
	}


	public void setInstructorID(int instructorID) {
		this.instructorID = instructorID;
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
