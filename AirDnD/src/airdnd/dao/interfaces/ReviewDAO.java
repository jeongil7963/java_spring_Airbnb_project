package airdnd.dao.interfaces;

import java.util.List;

import airdnd.vo.ReviewVO;

public interface ReviewDAO {
//	CRUDs
	public int addReview(ReviewVO review);
	public List<ReviewVO> getReviewListByAccomId(int accom_id);
	public List<ReviewVO> getReviewListByUserId(String user_id);
	public int updateReview(ReviewVO review);
	public int deleteReviewByReviewId(int review_id);
//	Functional Methods
}
