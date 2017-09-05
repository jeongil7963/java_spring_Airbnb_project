package airdnd.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import airdnd.dao.interfaces.ReservationDAO;
import airdnd.util.DateMaker;
import airdnd.vo.ReservationVO;
import airdnd.vo.ReservedDateVO;

@Repository
public class ReservationDAOImp implements ReservationDAO {

	@Autowired
	SqlSession session;

	@Override
	public List<String> addReservation(ReservationVO reserv) {
		/**
		 * 출력용 메소드 입니다.
		 * @param ReservationVO Reservation 테이블에 추가할 예약정보가 담긴 VO
		 * @return 성공 [TRUE, Insert된 ROW갯수], 예약날짜가 겹치면 [FALSE, 겹친날짜의 String...]
		 */

		List<String> resultList = new ArrayList<>();
		
		String sDate = reserv.getStart_date();
		String eDate = reserv.getEnd_date();

		// 예약일의 시작~끝일까지의 날짜리스트를 생성
		List<String> dateList = DateMaker.getDateList(sDate, eDate);

		// 날짜리스트가 중복 되는지 확인
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("accom_id", reserv.getAccom_id());
		parameters.put("startDate", sDate);
		parameters.put("endDate", eDate);
		List<ReservedDateVO> rdList = session.selectList("reservedDateMapper.checkReservedDate", parameters);
		if (!rdList.isEmpty()) // 중복된 날짜가 하루라도 있다면, 예약 불가능
		{
			resultList.add("FALSE");
			for (ReservedDateVO reservedDateVO : rdList) {
				resultList.add(reservedDateVO.getReserv_date());
			}
		} 
		else 
		{
			// ReservationVO를 Insert
			int insertedNum = session.insert("reservationMapper.insertReservation", reserv);
			resultList.add("TRUE");
			resultList.add(Integer.toBinaryString(insertedNum));
			
			// Insert로 인해 increase 된 reserv_id 값을 가져옴
			int currReservId = session.selectOne("reservationMapper.checkReservId");
			
			// 생성된 날짜리스트를 ReservedDate에 등록
			for (String stringDate : dateList) {
				session.insert("reservedDateMapper.insertReservedDate",
						new ReservedDateVO(reserv.getAccom_id(), stringDate, currReservId));
			}
		}
		return resultList;
	}

	@Override
	public ReservationVO getReservationByReservId(int reserv_Id) {
		return session.selectOne("reservationMapper.getReservationByreservId", reserv_Id);
	}
	
	@Override
	public List<ReservationVO> getReservationListByUserId(String user_Id) {
		return session.selectList("reservationMapper.getReservationListByUserId", user_Id);
	}
	
	@Override
	public List<ReservationVO> getReservationListByHostId(String host_Id) {
		return session.selectList("reservationMapper.getReservationListByHostId", host_Id);
	}

	@Override
	public int updateReservation(ReservationVO reserv) {
		// 기존 예약날짜 리스트 삭제
		session.delete("reservedDateMapper.deleteReservedDateByReservationId", reserv.getReserv_id());
		
		// 새로 업데이트할 예약날짜 리스트 생성
		List<ReservedDateVO> reservedDateList = new ArrayList<>();
		List<String> dateStringList = DateMaker.getDateList(reserv.getStart_date(), reserv.getEnd_date());
		for (String stringDate : dateStringList) {
			reservedDateList.add(new ReservedDateVO(reserv.getAccom_id(), stringDate, reserv.getReserv_id()));
		}
		
		// 새로운 예약날짜 리스트 insert
		for (ReservedDateVO reservedDateVO : reservedDateList) {
			session.insert("reservedDateMapper.insertReservedDate", reservedDateVO);
		}
		
		return session.update("reservationMapper.updateReservation", reserv);
	}

	@Override
	public int deleteReservationByReservationId(int reservationId) {
		// 기존 예약날짜 리스트 삭제
		session.delete("reservedDateMapper.deleteReservedDateByReservationId", reservationId);
		return session.update("reservationMapper.deleteReservationByReservationId", reservationId);
	}

	@Override
	public int getNotiHostByReservID(int reserv_id) {
		return session.selectOne("reservationMapper.getNotiHostByReservID", reserv_id);
	}

	@Override
	public int confirmNotiHostByReservID(int reserv_id) {
		return session.update("reservationMapper.confirmNotiHostByReservID", reserv_id);

	}

	@Override
	public int getNotiConfirmedByReservID(int reserv_id) {
		return session.selectOne("reservationMapper.getNotiConfirmedByReservID", reserv_id);
	}

	@Override
	public int confirmedNotiConfirmedByReservID(int reserv_id) {
		return session.update("reservationMapper.confirmedNotiConfirmedByReservID", reserv_id);

	}

	@Override
	public int deniedNotiConfirmedByReservID(int reserv_id) {
		return session.update("reservationMapper.deniedNotiConfirmedByReservID", reserv_id);
	}

	@Override
	public List<ReservationVO> getReservationListByAcoomId(int accom_Id) {
		// TODO Auto-generated method stub
		return session.selectList("reservationMapper.getReservationListByAccomId",accom_Id);
	}

	

	

}
