package airdnd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import airdnd.dao.interfaces.ImageDAO;
import airdnd.vo.ImageVO;
import airdnd.vo.ReservedDateVO;

@Repository
public class ImageDAOImp implements ImageDAO {

	
	@Autowired
	SqlSession session;
	
	@Override
	public int addImage(ImageVO img) {
		return session.insert("imageMapper.insertImage", img);
	}
	
	@Override
	public int addImageList(List<ImageVO> imgList) {
		int cnt = 0;
		for (ImageVO imgvo : imgList) {
			cnt += session.insert("imageMapper.insertImage", imgvo);
		}
		return cnt;
	}

	@Override
	public List<ImageVO> getImageByAccomId(int accom_id) {
		return session.selectList("imageMapper.getImageListByAccomId", accom_id);
	}

	@Override
	public int deleteImageByImageId(int image_id) {
		return session.delete("imageMapper.deleteImageByImageId", image_id);
	}

	

}
