package airdnd.vo;


public class ReservedDateVO {
	int accom_id;
	int rd_id;
	String reserv_date;
	int reserv_id;
	
	

	public int getAccom_id() {
		return accom_id;
	}



	public void setAccom_id(int accom_id) {
		this.accom_id = accom_id;
	}



	public int getRd_id() {
		return rd_id;
	}



	public void setRd_id(int rd_id) {
		this.rd_id = rd_id;
	}



	public String getReserv_date() {
		return reserv_date.replace(" 00:00:00.0", "");
	}



	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date.replace(" 00:00:00.0", "");
	}



	public int getReserv_id() {
		return reserv_id;
	}



	public void setReserv_id(int reserv_id) {
		this.reserv_id = reserv_id;
	}



	public ReservedDateVO(int accom_id, String reserv_date, int reserv_id) {
		super();
		this.accom_id = accom_id;
		this.rd_id = -1; //dummy, DB fill it by Sequence : RD_ID_AUTOINC
		this.reserv_date = reserv_date;
		this.reserv_id = reserv_id;
	}



	@Override
	public String toString() {
		return "ReservedDateVO [accom_id=" + accom_id + ", rd_id=" + rd_id + ", reserv_date=" + reserv_date
				+ ", reserv_id=" + reserv_id + "]";
	}

	public ReservedDateVO()
	{
		
	}
	
	
}
