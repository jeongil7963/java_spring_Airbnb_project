package airdnd.vo;

public class ReservationVO {
	int reserv_id;
	int accom_id;
	String end_date;
	int number_of_people;
	String start_date;
	String user_id;
	float price;
	String host_id;
	int noti_host;
	int noti_confirmed;
	public int getReserv_id() {
		return reserv_id;
	}
	public void setReserv_id(int reserv_id) {
		this.reserv_id = reserv_id;
	}
	public int getAccom_id() {
		return accom_id;
	}
	public void setAccom_id(int accom_id) {
		this.accom_id = accom_id;
	}
	public String getEnd_date() {
		return end_date.replace(" 00:00:00.0", "");
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date.replace(" 00:00:00.0", "");
	}
	public int getNumber_of_people() {
		return number_of_people;
	}
	public void setNumber_of_people(int number_of_people) {
		this.number_of_people = number_of_people;
	}
	public String getStart_date() {
		return start_date.replace(" 00:00:00.0", "");
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date.replace(" 00:00:00.0", "");
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public int getNoti_host() {
		return noti_host;
	}
	public void setNoti_host(int noti_host) {
		this.noti_host = noti_host;
	}
	public int getNoti_confirmed() {
		return noti_confirmed;
	}
	public void setNoti_confirmed(int noti_confirmed) {
		this.noti_confirmed = noti_confirmed;
	}
	@Override
	public String toString() {
		return "ReservationVO [reserv_id=" + reserv_id + ", accom_id=" + accom_id + ", end_date=" + end_date
				+ ", number_of_people=" + number_of_people + ", start_date=" + start_date + ", user_id=" + user_id
				+ ", price=" + price + ", host_id=" + host_id + ", noti_host=" + noti_host + ", noti_confirmed="
				+ noti_confirmed + "]";
	}
	public ReservationVO(int accom_id, String end_date, int number_of_people, String start_date,
			String user_id, float price, String host_id) {
		super();
		this.reserv_id = -1; //dummy, DB fill it by Sequence : RESERVED_ID_AUTOINC
		this.accom_id = accom_id;
		this.end_date = end_date;
		this.number_of_people = number_of_people;
		this.start_date = start_date;
		this.user_id = user_id;
		this.price = price;
		this.host_id = host_id;
		this.noti_host = 0;
		this.noti_confirmed = 0;
	}
	public ReservationVO()
	{
		
	}
	
	
}
