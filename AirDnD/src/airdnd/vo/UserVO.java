package airdnd.vo;

import java.sql.Date;

public class UserVO {
	private String user_id;
	private String birthday  ;
	private String email;
	private String phone;
	private String pw;
	private String reg_date;
	
	public UserVO()
	{
		
	}

	public UserVO(String user_id, String birthday, String email, String phone, String pw, String reg_date) {
		super();
		this.user_id = user_id;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.pw = pw;
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "UserVO [userid=" + user_id + ", birthday=" + birthday + ", email=" + email + ", phone=" + phone + ", pw="
				+ pw + ", reg_date=" + reg_date + "]";
	}

	public String getUserid() {
		return user_id;
	}

	public void setUserid(String user_id) {
		this.user_id = user_id;
	}

	public String getBirthday() {
		return birthday.replace(" 00:00:00.0", "");
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getReg_date() {
		return reg_date.replace(" 00:00:00.0", "");
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	
	
}
