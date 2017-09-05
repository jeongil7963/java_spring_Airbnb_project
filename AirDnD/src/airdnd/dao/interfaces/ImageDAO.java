package airdnd.dao.interfaces;

import java.util.List;

import airdnd.vo.ImageVO;

public interface ImageDAO {
	// CRUDs
	public int addImage(ImageVO img);
	public int addImageList(List<ImageVO> imgList);
	public List<ImageVO> getImageByAccomId(int accom_id);
	public int deleteImageByImageId(int image_id);
	
	// Functional Methods
}
