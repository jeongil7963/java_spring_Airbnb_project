package airdnd.tester;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import airdnd.dao.UserDAOImp;
import airdnd.dao.interfaces.AccommodationDAO;
import airdnd.dao.interfaces.AmenityDAO;
import airdnd.dao.interfaces.ImageDAO;
import airdnd.dao.interfaces.ReservationDAO;
import airdnd.dao.interfaces.ReservedDateDAO;
import airdnd.dao.interfaces.ReviewDAO;
import airdnd.dao.interfaces.UserDAO;
import airdnd.vo.AccommodationVO;
import airdnd.vo.AmenityVO;
import airdnd.vo.ImageVO;
import airdnd.vo.ReservationVO;
import airdnd.vo.ReservedDateVO;
import airdnd.vo.ReviewVO;
import airdnd.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/beans.xml")

public class hellotester {

	
	@Autowired
	UserDAO dao;
	
	@Autowired
	AccommodationDAO adao;
	
	@Autowired
	ReservedDateDAO rddao;
	
	@Autowired
	ReservationDAO reservdao;
	
	@Autowired
	AmenityDAO amendao;
	
	@Autowired
	ImageDAO idao;
	
	@Autowired
	ReviewDAO rvdao;
	
	@Test
	public void driver()
	{
//		-----------------------USER TESTER--------------------------
//		**Add User**
//		dao.addUser(new UserVO("test1", "1992-10-05", "yji@naver.com", "010123456789", "1234", "2017-07-15"));
//		System.out.println(dao.getUser("yji"));
//		**RETRIEVE User List**
//		List<UserVO> list2 = dao.getUserList();
//		for (UserVO empVO : list2) {
//			System.out.println(empVO);
//		}
//		** DELETE User**
//		System.out.println("removeUser result, AFFECTED ROW : " + dao.removeUser("test2"));
//		** UPDATE User**
//		UserVO uvo = dao.getUser("test1");
//		uvo.setEmail("test@abc.com");
//		System.out.println("updateUser result, UPDATED ROW : " + dao.updateUser(uvo));
		
//		**Login**
//		System.out.println("login result : " + dao.login("test", "1234"));
		
//		-----------------------Accommodation TESTER--------------------------
//		**ADD**
//		adao.addAccommodation(new AccommodationVO(
//				4,1,2,2,"빌라","원","숙박지설명입니다. 1,2,3 마이크 테스트", "test", "서울시 금천구 가산동", 
//				"test의 숙박지", 70000, "집", "개인실"));
//		adao.addAccommodation(new AccommodationVO(
//				3,1,2,2,"아파트","원","아파트", "test", "서울시 용산구 남영동", 
//				"test의 숙박지2", 80000, "집", "개인실"));
		/*		
		 * int accomodates, int bathrooms, int bedrooms, int beds, String buildingType,
		 * String currencyUnit, String description, String hostId, String location, String name, float price,
		 * String propertyType, String roomType		
		 */
		
//		**RETRIEVE**
//		System.out.println(adao.getAccommodationByAccommodationId(1));
		
//		**DELETE**
//		System.out.println("DELETE AFFECTED ROWS : " + adao.removeAccommodation(2));
		
//		**UPDATE**
//		AccommodationVO avo = adao.getAccommodationByAccommodationId(1);
//		avo.setName("test의 하숙집");
//		System.out.println(avo);
//		adao.updateAccommodation(avo);
		
//		**RETRIEVE BY SEARCH BAR**
//		List<AccommodationVO> searchlist = adao.getAccommodationListBySearchBar("서울시", "2017-01-02", "2017-04-30", 1);
//		for (AccommodationVO accommodationVO : searchlist) {
//			System.out.println(accommodationVO);
//		}

		
//		-----------------------ReservedDate TESTER--------------------------
//		**ADD**
//		rddao.addReservedDate(new ReservedDateVO(1, "2017-08-07"));
//		List<ReservedDateVO> rd = rddao.getReservedDateListByAccommodationId(1);
//		for(ReservedDateVO f : rd) {
//			System.out.println(f);
//		}
		
//		**ADD BY LIST**
//		List<ReservedDateVO> reservedDateList = new ArrayList<>();
//		reservedDateList.add(new ReservedDateVO(1, "2017-05-04"));
//		reservedDateList.add(new ReservedDateVO(1, "2017-05-05"));
//		reservedDateList.add(new ReservedDateVO(1, "2017-05-06"));
//		
//		int resultRDL = rddao.addReservedDateList(reservedDateList);
//		System.out.println("RDL inserted : " + resultRDL);

//		**RETRIEVE between DATES**
//		List<ReservedDateVO> il = rddao.getReservedDateListByDates("2017-05-01", "2017-05-05");
//		for (ReservedDateVO reservedDateVO : il) {
//			System.out.println(reservedDateVO);
//		}
		
//		**DELETE**
//		rddao.deleteReservedDateByReservedDateId(11);
		
//		-----------------------Reservation TESTER--------------------------
//		**ADD**
//		System.out.println("add Reservaiton result : " + 
//				reservdao.addReservation(
//						new ReservationVO(1, "2017-06-06", 4, "2017-06-05", "lhs", 5000, "yji")
//						)
//		);
		/*ReservationVO(
		 * accom_id, end_date, number_of_people, 
		 * start_date, user_id, price, host_id
		 * )
		*/
//		**RETRIEVE**
//		System.out.println(reservdao.getReservationListByUserId("test"));
//		System.out.println(reservdao.getReservationListByHostId("yji"));
		
//		**UPDATE**
//		List<ReservationVO> rsrvList = reservdao.getReservationListByUserId("lhs");
//		System.out.println(rsrvList);
//		rsrvList.get(0).setStart_date("2017-06-01");
//		rsrvList.get(0).setEnd_date("2017-06-02");
//		reservdao.updateReservation(rsrvList.get(0));

//		**FUNCTIONAL***
////		NOTI_HOST
//		System.out.println("getNotiHostByReservID result : " + reservdao.getNotiHostByReservID(7));
//		System.out.println("confirmNotiHostByReservID AFFECTED ROWS : " + reservdao.confirmNotiHostByReservID(7));
//		System.out.println("getNotiHostByReservID result : " + reservdao.getNotiHostByReservID(7));
////		NOTI_CONFIRMED
//		System.out.println("getNotiConfirmedByReservID result : " + reservdao.getNotiConfirmedByReservID(7));
//		System.out.println("confirmNotiHostByReservID AFFECTED ROWS : " + reservdao.confirmedNotiConfirmedByReservID(7));
//		System.out.println("getNotiConfirmedByReservID result : " + reservdao.getNotiConfirmedByReservID(7));
//		System.out.println("confirmNotiHostByReservID AFFECTED ROWS : " + reservdao.deniedNotiConfirmedByReservID(7));
//		System.out.println("getNotiConfirmedByReservID result : " + reservdao.getNotiConfirmedByReservID(7));
////		Reset NOTI_HOST, NOTI_CONFIMED by UPDATE
//		ReservationVO rsrv = reservdao.getReservationByReservId(7);
//		reservdao.updateReservation(rsrv);
//		System.out.println("After updateReservation result NOTI_HOST : " + reservdao.getNotiHostByReservID(7));
//		System.out.println("After updateReservation result NOTI_CONFIRMED : " + reservdao.getNotiConfirmedByReservID(7));
	
//		-----------------------AMENITY TESTER--------------------------
//		**ADD Amenity**
//		System.out.println("addAmenity INSERTED ROWS : " + amendao.addAmenity(new AmenityVO(1, "Wi-Fi")));
		
//		**ADD AmenityList**
//		List<AmenityVO> aVOList = new ArrayList<>();
//		aVOList.add(new AmenityVO(1, "편의시설",  "무선인터넷"));
//		aVOList.add(new AmenityVO(1, "공간", "수영장"));
//		aVOList.add(new AmenityVO(1, "좋은점", "반려동물 동반"));
//		System.out.println("addAmenity INSERTED ROWS : " + amendao.addAmenityList(aVOList));
		
//		**RETRIEVE AmentiyList**
//		List<AmenityVO> raVOList = new ArrayList<>();
//		raVOList = amendao.getAmenityListByAccomID(1);
//		for (AmenityVO amenityVO : raVOList) {
//			System.out.println(amenityVO);
//		}
	
//		**UPDATE**
//		List<AmenityVO> aVOList = new ArrayList<>();
//		aVOList.add(new AmenityVO(1, "편의시설", "Wi-Fi"));
//		aVOList.add(new AmenityVO(1, "편의시설", "수면등"));
//		aVOList.add(new AmenityVO(1, "편의시설", "DVD"));
//		System.out.println("updateAmentiy AFFECTED ROWS : " + amendao.updateAmentiyList(1, aVOList));
		
//		**DELETE AmenityList**
//		amendao.deleteAmenityListByAccomID(1);
		
//		-----------------------IMAGE TESTER--------------------------
//		**ADD Image**
//		System.out.println("addImage() INSERTED ROWS : " + idao.addImage(new ImageVO(1, "Path/to/image2.png")));
		
//		**ADD ImageList**
//		List<ImageVO> imgList = new ArrayList<>();
//		imgList.add(new ImageVO(1, "my/path/to/dest"));
//		imgList.add(new ImageVO(1, "Test/path"));
//		System.out.println("addImageList() INSERTED ROWS : " + idao.addImageList(imgList));
		
//		**GET ImageList**
//		System.out.println("getImageList() Result : ");
//		List<ImageVO> imageList = idao.getImageByAccomId(1);
//		for (ImageVO imageVO : imageList) {
//			System.out.println(imageVO);
//		}
		
//		**DELETE Image by image_id**
//		System.out.println("deleteImageByImageId() AFFECTED ROWS :  : " +  idao.deleteImageByImageId(1));
		
//		-----------------------REVIEW TESTER--------------------------
//		**ADD Review**
//		System.out.println("addReviw() INSERTED ROW : " + rvdao.addReview(new ReviewVO(1, "리뷰텍스트입니다. 아아아앙아아아아아아아!", "lhs", 3.8f, "제목1")));
//		System.out.println("addReviw() INSERTED ROW : " + rvdao.addReview(new ReviewVO(1, "Very Good! Recommended!", "lhs", 4.0f, "제목2")));
		
//		**GET ReviewList By userID**
//		List<ReviewVO> rvList = rvdao.getReviewListByUserId("lhs");
//		for (ReviewVO reviewVO : rvList) {
//			System.out.println(reviewVO);
//		}
		
//		**GET ReveiwList By AccomId**
//		List<ReviewVO> rvList2 = rvdao.getReviewListByAccomId(1);
//		for (ReviewVO reviewVO : rvList2) {
//			System.out.println(reviewVO);
//		}
		
//		**UPDATE Review**
//		ReviewVO rvo = rvdao.getReviewListByAccomId(1).get(0);
//		rvo.setPoint(0.5f);
//		System.out.println("updateReview() AFFECTED ROWS : " + rvdao.updateReview(rvo));
		
//		**DELETE Review By review_id
//		System.out.println("deleteReviewByReviewId() AFFECTED ROWS : " + rvdao.deleteReviewByReviewId(1));
	}
}
