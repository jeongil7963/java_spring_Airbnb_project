package airdnd.vo;

public class ReviewVO {
	int review_id;
	int accom_id;
	String text;
	String user_id;
	float point;
	String title;
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getAccom_id() {
		return accom_id;
	}
	public void setAccom_id(int accom_id) {
		this.accom_id = accom_id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public float getPoint() {
		return point;
	}
	public void setPoint(float point) {
		this.point = point;
	}
	
	
	
	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", accom_id=" + accom_id + ", text=" + text + ", user_id=" + user_id
				+ ", point=" + point + ", title=" + title + "]";
	}
	public ReviewVO( int accom_id, String text, String user_id, float point, String title) {
		super();
		this.review_id = -1; // dummy, DB fill it by Sequence : REVIEW_ID_AUTOINC
		this.accom_id = accom_id;
		this.text = text;
		this.user_id = user_id;
		this.point = point;
		this.title = title;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public ReviewVO()
	{
		
	}
	
}
