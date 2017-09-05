package airdnd.dao.interfaces;

import java.util.List;

import airdnd.vo.ReservationVO;

public interface ReservationDAO {
//	CRUDs
	public List<String> addReservation(ReservationVO reserv);
	public ReservationVO getReservationByReservId(int reserv_Id);
	public List<ReservationVO>getReservationListByUserId(String user_Id);
	public List<ReservationVO>getReservationListByHostId(String host_Id);
	public List<ReservationVO>getReservationListByAcoomId(int accom_Id);
	public int updateReservation(ReservationVO reserv); // set NotiHost 0, NotiConfirmed 0
	public int deleteReservationByReservationId(int reservationId);
	
//	Functional Method
	public int getNotiHostByReservID(int reserv_id);
	public int confirmNotiHostByReservID(int reserv_id); // 1
	public int getNotiConfirmedByReservID(int reserv_id);
	public int confirmedNotiConfirmedByReservID(int reserv_id); // 1
	public int deniedNotiConfirmedByReservID(int reserv_id); // 2 
}
