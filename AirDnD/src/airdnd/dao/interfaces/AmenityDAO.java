package airdnd.dao.interfaces;

import java.util.List;

import airdnd.vo.AmenityVO;

public interface AmenityDAO {
//	CRUDs
	public int addAmenity(AmenityVO amen);
	public int addAmenityList(List<AmenityVO> amenList);
	public List<AmenityVO> getAmenityListByAccomID(int accom_id);
	public int updateAmentiyList(int accom_id, List<AmenityVO> amenList);
	public int deleteAmenityListByAccomID(int accom_id);
//	Functional Methods
}
