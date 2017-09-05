package airdnd.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import airdnd.dao.interfaces.AccommodationDAO;
import airdnd.vo.AccommodationVO;

@Repository
public class AccommodationDAOImp implements AccommodationDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public int addAccommodation(AccommodationVO accom) {
		return session.insert("accommodationMapper.insertAccommodation", accom);
	}

	@Override
	public int removeAccommodation(int accommodationId) {
		return session.delete("accommodationMapper.deleteAccommodationByAccommodationId", accommodationId);
	}

	@Override
	public int updateAccommodation(AccommodationVO accom) {
		return session.update("accommodationMapper.updateAccommodation", accom);
	}

	@Override
	public AccommodationVO getAccommodationByAccommodationId(int accommodationId) {
		return session.selectOne("accommodationMapper.getAccommodationByAccommodationId", accommodationId);
	}

	@Override
	public float getAveragePoint() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AccommodationVO> getAccommodationListBySearchBar(String location, String startDate, String endDate,
			int numberOfPeople) {
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("location", location);
		parameters.put("startDate", startDate);
		parameters.put("endDate", endDate);
		parameters.put("numPeople", numberOfPeople);
		
		return session.selectList("accommodationMapper.getAccommodationListBySearchBar", parameters);
	}
	
	@Override
	public List<AccommodationVO> getAccommodationListBySearchBarUsingFilter(String location, String startDate, String endDate,
			int numberOfPeople, int startPrice, int endPrice) {
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("location", location);
		parameters.put("startDate", startDate);
		parameters.put("endDate", endDate);
		parameters.put("numPeople", numberOfPeople);
		parameters.put("startPrice", startPrice);
		parameters.put("endPrice", endPrice);
		
		return session.selectList("accommodationMapper.getAccommodationListBySearchBarUsingPriceFilter", parameters);
	}
	
	

	@Override
	public List<AccommodationVO> getAccommodationByHostId(String host_id) {
		
		return session.selectList("accommodationMapper.getAccommodationByHostId", host_id);
	}

	@Override
	public int checkLastAccomodationId() {
		return session.selectOne("accommodationMapper.checkAccomId");
	}

	@Override
	public List<AccommodationVO> getAccommodationListBySearchBarUsingTypeFilter(String location, String startDate,
			String endDate, int numberOfPeople, int totChecked) {
		// TODO Auto-generated method stub
		return null;
	}


}
