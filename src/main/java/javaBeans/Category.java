package javaBeans;

public class Category {
	private String categoryID;
	private String categoryName;

	public Category(String categoryID, String categoryName) {
		this.categoryID = categoryID;
		this.categoryName = categoryName;
	}

	public Category() {

	}

	public String getCategoryID() {
		return this.categoryID;
	}
	
	public String getCategoryName() {
		return this.categoryName;
	}	
}
