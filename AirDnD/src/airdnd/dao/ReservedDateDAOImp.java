package airdnd.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import airdnd.dao.interfaces.ReservedDateDAO;
import airdnd.vo.ReservedDateVO;
import airdnd.vo.UserVO;

@Repository
public class ReservedDateDAOImp implements ReservedDateDAO {
	
	@Autowired
	SqlSession session;
	
	@Override
	public int addReservedDate(ReservedDateVO reservedDate) {
		return session.insert("reservedDateMapper.insertReservedDate", reservedDate);
	}
	
	@Override
	public List<ReservedDateVO> getReservedDateListByAccommodationId(int accommodationId) {
		return session.selectList("reservedDateMapper.getReservedDateListByAccommodationId", accommodationId);
	}

	@Override
	public List<ReservedDateVO> getReservedDateListByDates(String startDate, String endDate) {
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("startDate", startDate);
		parameters.put("endDate", endDate);
		
		return session.selectList("reservedDateMapper.getReserveDateIdListByDates", parameters);
	}

	@Override
	public int addReservedDateList(List<ReservedDateVO> reservedDateList) {
		int cnt = 0;
		for (ReservedDateVO reservedDateVO : reservedDateList) {
			cnt += session.insert("reservedDateMapper.insertReservedDate", reservedDateVO);
		}
		return cnt;
	}

	@Override
	public int deleteReservedDateByReservedDateId(int rdId) {
		return session.delete("reservedDateMapper.deleteReservedDateByReservedDateId", rdId);
	}

	@Override
	public int deleteReservedListByReservIdDates(int reserv_id, String startDate, String endDate) {
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("reserv_id", reserv_id);
		parameters.put("startDate", startDate);
		parameters.put("endDate", endDate);
		
		return session.delete("reservedDateMapper.deleteReservedListByreservIdDates", parameters);
	}

	

}
