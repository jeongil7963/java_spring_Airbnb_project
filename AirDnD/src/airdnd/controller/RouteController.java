package airdnd.controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import airdnd.dao.interfaces.AccommodationDAO;

import airdnd.dao.interfaces.UserDAO;
import airdnd.util.UuidMaker;
import airdnd.vo.AccommodationVO;
import airdnd.vo.UserVO;

import airdnd.dao.interfaces.AmenityDAO;
import airdnd.dao.interfaces.ImageDAO;
import airdnd.dao.interfaces.ReservationDAO;
import airdnd.vo.AccommodationVO;
import airdnd.vo.AmenityVO;
import airdnd.vo.ImageVO;
import airdnd.vo.ReservationVO;

@Controller
public class RouteController {
	
	@Autowired
	AccommodationDAO adao;
	@Autowired
	UserDAO userDao;
	
	@RequestMapping("hello.do")
	public String sayHello(@RequestParam String name, Model model) {
		model.addAttribute("greet", "Hello " + name);
		return "hello";
	}
	
	@RequestMapping(value = "searchInList.do" )
	@ResponseBody
	public List<AccommodationVO> searchList(@RequestParam String city,@RequestParam String startDate,@RequestParam String endDate,@RequestParam String person) {
		System.out.println(city+" "+startDate+" "+endDate+" "+person);
		int p = Integer.parseInt(person);
		
		List<AccommodationVO>acvo = adao.getAccommodationListBySearchBar(city, startDate, endDate, p);
		System.out.println(acvo.size());
		System.out.println(acvo.toString());		
		return acvo;
	}
	
	@RequestMapping(value = "searchInListFromMain.do", method=RequestMethod.POST )
	public ModelAndView searchFromMain(@RequestParam String city,@RequestParam String startDate,@RequestParam String endDate,@RequestParam String person) {
		System.out.println(city+" "+startDate+" "+endDate+" "+person);
		int p = Integer.parseInt(person);
		
		List<AccommodationVO>acvo = adao.getAccommodationListBySearchBar(city, startDate, endDate, p);
		System.out.println(acvo.size());
		System.out.println(acvo.toString());		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("searchList");
		mv.addObject("voSize", acvo.size());	
		mv.addObject("city", city);
		mv.addObject("startDate", startDate);
		mv.addObject("endDate", endDate);
		mv.addObject("person", person);
		mv.addObject("acvo",acvo);
		
		
		return mv;
	}
	
	

	@RequestMapping(value="searchInListPriceFilter.do")
	@ResponseBody
	public List<AccommodationVO> searchListWithPriceFilter(@RequestParam String city,@RequestParam String startDate,
															@RequestParam String endDate,@RequestParam String person,
															@RequestParam String startPrice,@RequestParam String endPrice) {
		System.out.println(city+" "+startDate+" "+endDate+" "+person+" "+startPrice+" "+endPrice);
		int p = Integer.parseInt(person);
		int s = Integer.parseInt(startPrice);
		int e = Integer.parseInt(endPrice);
		
		List<AccommodationVO>acvo = adao.getAccommodationListBySearchBarUsingFilter(city, startDate, endDate, p,s,e);
		System.out.println(acvo.size());
		System.out.println(acvo.toString());		
		return acvo;
	}

	@Autowired
	AccommodationDAO accommDao;
	
	@Autowired
	AmenityDAO amenDao;
	
	@Autowired
	ImageDAO imageDao;
	
	@Autowired
	ReservationDAO reservationDao;
	
	@Autowired
	ServletRequest context;
	
	
	@RequestMapping(value = "upload.do", method = RequestMethod.POST)
	@ResponseBody
	public String upload(MultipartHttpServletRequest req, 
	    HttpServletResponse res, @RequestParam("accom_id") String accom_id) {
	 
	    Iterator<String> itr = req.getFileNames();
	    MultipartFile mpf = req.getFile(itr.next());
	    String originFileName = mpf.getOriginalFilename();
	 
//	    ServletContext context2 = req.getServletContext();
//	    String path = context2.getRealPath("/");
//	    String path = req.getContextPath();
	    String path = "C:\\imgtemp";
	    
	    
	    // 디렉리가 없다면 생성 
	    File dir = new File(path); 
	    if (!dir.isDirectory()) 
	    	{ dir.mkdirs(); }

//	    System.out.println(System.getProperty("user.dir"));
	    
	    //파일 저장

	    String origName=""; 
	    try {
			origName = new String(mpf.getOriginalFilename().getBytes("8859_1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //한글꺠짐 방지
	    
	    
	    // 파일 명 변경(uuid로 암호화) 
	    String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 
//	    String saveFileName = UuidMaker.getUuid() + ext; // 설정한 path에 파일저장
	    String saveFileName = accom_id + ext;
	    File serverFile = new File(path + File.separator + saveFileName);
	    
//	    File serverFile = new File(path + File.separator + originFileName);
	    try {
			mpf.transferTo(serverFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    System.out.println("Uploading Complete : " + path + File.separator + saveFileName);
	    return path + File.separator + saveFileName;
	}
	
	
	@RequestMapping(value= "addAccommodation.do", method=RequestMethod.POST)
	public String addRooms(@RequestBody Map<String,Object> params, @RequestParam String id) //dao가 문제였어!
	{
		String host_id = id; // form에서 받아와야 함. 일단 작동을 위해 hard Coding 처리
		AccommodationVO accommVO = new AccommodationVO(
				Integer.parseInt((String)params.get("accomodates")), 
				Integer.parseInt((String) params.get("bathrooms")), 
				Integer.parseInt((String)params.get("bedrooms")),
				Integer.parseInt((String)params.get("beds")), 
				(String) params.get("building_type"), (String) params.get("cdataurrency_unit"), (String) params.get("description"), 
				host_id, (String) params.get("national_name"), (String) params.get("name"), 
				Float.parseFloat((String)params.get("price")), (String) params.get("property_type"), 
				(String) params.get("room_type"));
		accommDao.addAccommodation(accommVO);
		int lastAccomId = accommDao.checkLastAccomodationId();

		List<AmenityVO> amenityList = new ArrayList<>();
		amenityList.add(new AmenityVO(lastAccomId, "amenity_essential", (String) params.get("amenity_essential")));
		amenityList.add(new AmenityVO(lastAccomId, "amenity_wifi", (String) params.get("amenity_wifi")));
		amenityList.add(new AmenityVO(lastAccomId, "amenity_shampoo", (String) params.get("amenity_shampoo")));
		amenityList.add(new AmenityVO(lastAccomId, "amenity_closet", (String) params.get("amenity_closet")));
		amenityList.add(new AmenityVO(lastAccomId, "amenity_tv", (String) params.get("amenity_tv")));
		amenityList.add(new AmenityVO(lastAccomId, "amenity_heating", (String) params.get("amenity_heating")));
		amenityList.add(new AmenityVO(lastAccomId, "amenity_airconditioner", (String) params.get("amenity_airconditioner")));
		amenityList.add(new AmenityVO(lastAccomId, "amenity_breakfast", (String) params.get("amenity_breakfast")));

		amenityList.add(new AmenityVO(lastAccomId, "securityFacility_smoke", (String) params.get("securityFacility_smoke")));
		amenityList.add(new AmenityVO(lastAccomId, "securityFacility_cm", (String) params.get("securityFacility_cm")));
		amenityList.add(new AmenityVO(lastAccomId, "securityFacility_firstaidkit", (String) params.get("securityFacility_firstaidkit")));
		amenityList.add(new AmenityVO(lastAccomId, "securityFacility_fire", (String) params.get("securityFacility_fire")));
		amenityList.add(new AmenityVO(lastAccomId, "securityFacility_locker", (String) params.get("securityFacility_locker")));

		amenityList.add(new AmenityVO(lastAccomId, "usableFacility_pridatavatelivingroom", (String) params.get("usableFacility_pridatavatelivingroom")));
		amenityList.add(new AmenityVO(lastAccomId, "usableFacility_pool", (String) params.get("usableFacility_pool")));
		amenityList.add(new AmenityVO(lastAccomId, "usableFacility_kitchen", (String) params.get("usableFacility_kitchen")));
		amenityList.add(new AmenityVO(lastAccomId, "usableFacility_washer", (String) params.get("usableFacility_washer")));
		amenityList.add(new AmenityVO(lastAccomId, "usableFacility_dryer", (String) params.get("usableFacility_dryer")));
		amenityList.add(new AmenityVO(lastAccomId, "usableFacility_park", (String) params.get("usableFacility_park")));
		amenityList.add(new AmenityVO(lastAccomId, "udatasableFacility_ele", (String) params.get("udatasableFacility_ele")));
		amenityList.add(new AmenityVO(lastAccomId, "usableFacility_tub", (String) params.get("usableFacility_tub")));
		amenityList.add(new AmenityVO(lastAccomId, "usableFacility_gym", (String) params.get("usableFacility_gym")));
		
		amenityList.add(new AmenityVO(lastAccomId, "goodThing_family", (String) params.get("goodThing_family")));
		amenityList.add(new AmenityVO(lastAccomId, "goodThing_group", (String) params.get("goodThing_group")));
		amenityList.add(new AmenityVO(lastAccomId, "goodThing_withpet", (String) params.get("goodThing_withpet")));
		
		amenDao.addAmenityList(amenityList);
		// params.get("accom_id"); //DB가 AutoIncrement로 관리
		
		ImageVO image = new ImageVO(lastAccomId, (String) params.get("img"));
		imageDao.addImage(image);
		
		
//		dao.addAccommodation(vo);
		return "roomsList";	//넘어가는 페이지
	}
	@RequestMapping(value= "sendRoomInfo.do", method=RequestMethod.GET)
	public ModelAndView sendRoomInfo(@RequestParam Integer accom_id)
	{
		AccommodationVO aVO = accommDao.getAccommodationByAccommodationId(accom_id);
		ModelAndView mav = new ModelAndView("roomsUpdate");
		List<AmenityVO> amenList = amenDao.getAmenityListByAccomID(accom_id);
		List<ImageVO> imgList = imageDao.getImageByAccomId(accom_id);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = "";
		try {
			json = mapper.writeValueAsString(amenList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("avo", aVO);
		mav.addObject("amenList", json);
		if(!imgList.isEmpty())
			mav.addObject("ivo", imgList.get(0));
		else
			mav.addObject("ivo", new ImageVO(accom_id, "null"));
		
		return mav;
	}
	
	@RequestMapping(value= "updateRoomInfo.do", method=RequestMethod.POST)
	public String updateRoomInfo(@RequestBody Map<String,Object> params, @RequestParam String id)
	{
		// LHS
			String host_id = id; // form에서 받아와야 함. 일단 작동을 위해 hard Coding 처리
			AccommodationVO accommVO = new AccommodationVO(
					(int)params.get("accom_id"),
					Integer.parseInt((String)params.get("accomodates")), 
					Integer.parseInt((String)params.get("bathrooms")), 
					Integer.parseInt((String)params.get("bedrooms")),
					Integer.parseInt((String)params.get("beds")), 
					(String) params.get("building_type"), (String) params.get("cdataurrency_unit"), (String) params.get("description"), 
					host_id, (String) params.get("national_name"), (String) params.get("name"), 
					Float.parseFloat((String)params.get("price")), (String) params.get("property_type"), 
					(String) params.get("room_type"),Float.parseFloat((String)params.get("avg_point")));
			accommDao.updateAccommodation(accommVO);

			List<AmenityVO> amenityList = new ArrayList<>();
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "amenity_essential", (String) params.get("amenity_essential")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "amenity_wifi", (String) params.get("amenity_wifi")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "amenity_shampoo", (String) params.get("amenity_shampoo")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "amenity_closet", (String) params.get("amenity_closet")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "amenity_tv", (String) params.get("amenity_tv")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "amenity_heating", (String) params.get("amenity_heating")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "amenity_airconditioner", (String) params.get("amenity_airconditioner")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "amenity_breakfast", (String) params.get("amenity_breakfast")));

			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "securityFacility_smoke", (String) params.get("securityFacility_smoke")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "securityFacility_cm", (String) params.get("securityFacility_cm")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "securityFacility_firstaidkit", (String) params.get("securityFacility_firstaidkit")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "securityFacility_fire", (String) params.get("securityFacility_fire")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "securityFacility_locker", (String) params.get("securityFacility_locker")));

			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "usableFacility_pridatavatelivingroom", (String) params.get("usableFacility_pridatavatelivingroom")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "usableFacility_pool", (String) params.get("usableFacility_pool")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "usableFacility_kitchen", (String) params.get("usableFacility_kitchen")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "usableFacility_washer", (String) params.get("usableFacility_washer")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "usableFacility_dryer", (String) params.get("usableFacility_dryer")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "usableFacility_park", (String) params.get("usableFacility_park")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "udatasableFacility_ele", (String) params.get("udatasableFacility_ele")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "usableFacility_tub", (String) params.get("usableFacility_tub")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "usableFacility_gym", (String) params.get("usableFacility_gym")));
			
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "goodThing_family", (String) params.get("goodThing_family")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "goodThing_group", (String) params.get("goodThing_group")));
			amenityList.add(new AmenityVO(accommVO.getAccom_id(), "goodThing_withpet", (String) params.get("goodThing_withpet")));
			
			amenDao.updateAmentiyList(accommVO.getAccom_id(), amenityList);
			
			// image 업데이트, delete & insert
			List<ImageVO> image = imageDao.getImageByAccomId(accommVO.getAccom_id());
			if(image.isEmpty())
			{
				imageDao.addImage(new ImageVO(accommVO.getAccom_id(), ""));
			}
			else
			{
				imageDao.deleteImageByImageId(image.get(0).getImage_id());
				image.get(0).setPath((String)params.get("img"));
				imageDao.addImage(image.get(0));
			}
			return "roomsList";	//넘어가는 페이지
	}
	
	@RequestMapping("getAccommodationByHostId.do")
	@ResponseBody
	public List<AccommodationVO> selectAccommodationByHostId(@RequestParam String host_id) 
	{
		List<AccommodationVO> accommodationByHostIdValue = accommDao.getAccommodationByHostId(host_id);
		return accommodationByHostIdValue;
	}
	
	
	
	@RequestMapping("getAmenityByAccomId.do")
	@ResponseBody
	public List<AmenityVO> selectAmenityByAccomId(@RequestParam int accom_id)
	{
		List<AmenityVO> amenityByAccomIdValue = amenDao.getAmenityListByAccomID(accom_id);
		return amenityByAccomIdValue;
	}


//	public ModelAndView selectAccommodationByHostId(@RequestParam String host_id) 
//	{
//		System.out.println(host_id);
//		List<AccommodationVO> accommodationByHostIdValue = dao.getAccommodationByHostId(host_id);		
//		return new ModelAndView("roomsList","accommodationByHostId",accommodationByHostIdValue);
//	}
	@RequestMapping("getMypage.do")
	@ResponseBody
	public UserVO getMyPage(HttpSession session) 
	{
		String userID = (String)session.getAttribute("userid");
		UserVO uservo=userDao.getUser(userID);
		return uservo;
	}
	
	@RequestMapping("getReservationByAccomId.do")
	@ResponseBody
	public List<ReservationVO> selectReservationByAccomId(@RequestParam int accom_id)
	{
		List<ReservationVO> reservationByAccomIdValue = reservationDao.getReservationListByAcoomId(accom_id);
		return reservationByAccomIdValue;
	}
	
	@RequestMapping(value = "searchDetail.do", method=RequestMethod.GET)
	   public ModelAndView searchDetail(@RequestParam Integer accom_id) {
	      AccommodationVO resVO = accommDao.getAccommodationByAccommodationId(accom_id);
	      return new ModelAndView("searchDetail","resVO",resVO);
	}
	
	@RequestMapping(value = "removeAccommodation.do", method=RequestMethod.GET)
	@ResponseBody
	   public String deleteAccommodationByAccommodationId(@RequestParam String acco_id) {		
	      int result = accommDao.removeAccommodation(Integer.parseInt(acco_id));
	      return result+"";
	}
	
	@RequestMapping(value = "searchInListFromMainGet.do", method=RequestMethod.GET )
	   public ModelAndView searchGetFromMain(@RequestParam String city,@RequestParam String startDate,@RequestParam String endDate,@RequestParam String person) {
	      System.out.println(city+" "+startDate+" "+endDate+" "+person);
	      int p = Integer.parseInt(person);
	      
	      List<AccommodationVO>acvo = adao.getAccommodationListBySearchBar(city, startDate, endDate, p);
	      System.out.println(acvo.size());
	      System.out.println(acvo.toString());      
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("searchList");
	      mv.addObject("voSize", acvo.size());   
	      mv.addObject("city", city);
	      mv.addObject("startDate", startDate);
	      mv.addObject("endDate", endDate);
	      mv.addObject("person", person);
	      mv.addObject("acvo",acvo);
	      
	      
	      return mv;
	   }

}
