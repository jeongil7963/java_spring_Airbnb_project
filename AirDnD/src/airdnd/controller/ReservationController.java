package airdnd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import airdnd.dao.interfaces.AccommodationDAO;
import airdnd.dao.interfaces.ImageDAO;
import airdnd.dao.interfaces.ReservationDAO;
import airdnd.vo.AccommodationVO;
import airdnd.vo.ImageVO;
import airdnd.vo.ReservationVO;
import airdnd.vo.UserVO;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationDAO reservationDAO;
	@Autowired
	AccommodationDAO accommodationDAO;
	@Autowired
	ImageDAO imageDAO;
	
	

	@RequestMapping(value="getReservList.do", method=RequestMethod.GET )
	public ModelAndView getReservationList(@RequestParam String userId){
		List<ReservationVO> reservValues = reservationDAO.getReservationListByUserId(userId);
		List<AccommodationVO> accomValues = new ArrayList<AccommodationVO>();
		List<ImageVO> imageValues = new ArrayList<ImageVO>();
		
		for(int i=0; i<reservValues.size(); i++){
			accomValues.add(i,accommodationDAO.getAccommodationByAccommodationId(reservValues.get(i).getAccom_id()));
//			imageValues.add(i,imageDAO.getImageByAccomId(reservValues.get(i).getAccom_id()));
			//dao, mapper로 이미지 한개만 가져오게 만듬(rownum<=1)
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("reservationList");
		view.addObject("reservations", reservValues);
		view.addObject("accommodations", accomValues);
		view.addObject("images", imageValues);

//		Map<String, Object> dataMap = new HashMap<>();
//		dataMap.put("reservations", (List<ReservationVO>)reservValues);
//		dataMap.put("accommodations", (List<AccommodationVO>)accomValues);
//		dataMap.put("images", (List<ImageVO>)imageValues);
		
		return view;

		
	/*	*/
		
	}
	
	@RequestMapping(value="getReservUpdateForm.do", method=RequestMethod.GET )
	public ModelAndView getReservationUpdateForm(@RequestParam String reserv_id){
		int tmp = Integer.parseInt(reserv_id);
		ReservationVO reservVO  = reservationDAO.getReservationByReservId(tmp);
		AccommodationVO accomVO = accommodationDAO.getAccommodationByAccommodationId(reservVO.getAccom_id());
		ImageVO imageVO = new ImageVO();
//		ImageVO imageVO = imageDAO.getImageByAccomId(reservVO.getAccom_id());
		
		ModelAndView view = new ModelAndView();
		view.setViewName("updateReservation");
		view.addObject("reservation", reservVO);
		view.addObject("accommodation", accomVO);
		view.addObject("image", imageVO);
		
		return view;
		
	}

	@RequestMapping(value="UpdateReserv.do", method=RequestMethod.POST )
	public String updateReservation(@ModelAttribute ReservationVO reserv,HttpSession session){
		String userID = (String)session.getAttribute("userid");
		
		ReservationVO originVO = reservationDAO.getReservationByReservId(reserv.getReserv_id());
		AccommodationVO accomVO = accommodationDAO.getAccommodationByAccommodationId(originVO.getAccom_id());
		float price = (accomVO.getPrice() * reserv.getNumber_of_people());
			
		ReservationVO updateVO = new ReservationVO(originVO.getAccom_id(), reserv.getEnd_date(), reserv.getNumber_of_people(), reserv.getStart_date(), originVO.getUser_id(), price, originVO.getHost_id());
		updateVO.setReserv_id(reserv.getReserv_id());
		int cnt = reservationDAO.updateReservation(updateVO);
		if(cnt == 1)
			return "redirect:/getReservList.do?userId="+userID;
		else return "";
	}
	
	
	@RequestMapping(value="DeleteReserv.do", method=RequestMethod.GET )
	public String DeleteReservation(@RequestParam String reserv_id,HttpSession session){
		String userID = (String)session.getAttribute("userid");
		
		int tmp = Integer.parseInt(reserv_id);
		int cnt = reservationDAO.deleteReservationByReservationId(tmp);
		
		if(cnt == 1)
			return "redirect:/getReservList.do?userId="+userID;
		else return "";
		
	}
	
}
