package airdnd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import airdnd.dao.interfaces.ReviewDAO;
import airdnd.vo.ReviewVO;

@Repository
public class ReviewDAOImp implements ReviewDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public int addReview(ReviewVO review) {
		return session.insert("reviewMapper.insertReview", review);
	}

	@Override
	public List<ReviewVO> getReviewListByAccomId(int accom_id) {
		return session.selectList("reviewMapper.getReviewListByAccomId", accom_id);
	}

	@Override
	public List<ReviewVO> getReviewListByUserId(String user_id) {
		return session.selectList("reviewMapper.getReviewListByUserId", user_id);
	}

	@Override
	public int updateReview(ReviewVO review) {
		return session.update("reviewMapper.updateReview", review);
	}

	@Override
	public int deleteReviewByReviewId(int review_id) {
		return session.delete("reviewMapper.deleteReviewByImageId", review_id);
	}

}
