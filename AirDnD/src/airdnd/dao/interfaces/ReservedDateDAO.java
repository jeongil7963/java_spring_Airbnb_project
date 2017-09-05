package airdnd.dao.interfaces;

import java.util.List;

import airdnd.vo.ReservedDateVO;

public interface ReservedDateDAO {
//	CRUDs
	public int addReservedDate(ReservedDateVO reservedDate);
	public int deleteReservedDateByReservedDateId(int rdId);
	public int deleteReservedListByReservIdDates(int reserv_id, String startDate, String endDate);
	
//	Functional Method
	public int addReservedDateList(List<ReservedDateVO> reservedDateList);
	public List<ReservedDateVO> getReservedDateListByAccommodationId(int accommodationId);
	public List<ReservedDateVO> getReservedDateListByDates(String startDate, String endDate);
}
