package airdnd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import airdnd.dao.interfaces.AmenityDAO;
import airdnd.vo.AmenityVO;
import airdnd.vo.ReservedDateVO;

@Repository
public class AmenityDAOImp implements AmenityDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public int addAmenity(AmenityVO amen) {
		return session.insert("amenityMapper.insertAmenity", amen);
	}

	@Override
	public int addAmenityList(List<AmenityVO> amenList) {
		int cnt = 0;
		for (AmenityVO aVO : amenList) {
			cnt += session.insert("amenityMapper.insertAmenity", aVO);
		}
		return cnt;
	}

	@Override
	public List<AmenityVO> getAmenityListByAccomID(int accom_id) {
		return session.selectList("amenityMapper.getAmenityListByAccomId", accom_id);
	}
	
	@Override
	public int updateAmentiyList(int accom_id, List<AmenityVO> amenList) {
		int cnt = 0;
		cnt += session.delete("amenityMapper.deleteAmenityListByAccomId", accom_id);
		for (AmenityVO aVO : amenList) {
			cnt += session.insert("amenityMapper.insertAmenity", aVO);
		}
		return cnt;
	}

	@Override
	public int deleteAmenityListByAccomID(int accom_id) {
		return session.delete("amenityMapper.deleteAmenityListByAccomId", accom_id);
	}

	

}
