package airdnd.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import airdnd.dao.interfaces.UserDAO;
import airdnd.vo.UserVO;

@Controller
public class edit_profileController {

	@Autowired
	UserDAO userDAO;
	
	@RequestMapping("edit_profile.do")
	public ModelAndView edit_profile( HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		UserVO vo = userDAO.getUser((String)session.getAttribute("userid"));
		
		mav.setViewName("edit_profile");
		mav.addObject("userid", vo.getUserid());
		mav.addObject("birthday", vo.getBirthday());
		mav.addObject("email", vo.getEmail());
		mav.addObject("phone", vo.getPhone());
		mav.addObject("pw", vo.getPw());
		
		return mav;
	}
	
	@RequestMapping("modify_profile.do")
	public ModelAndView modify_profile(@RequestParam  String pw, String email, String phone, String birthday, HttpSession session) {
		String id = (String)session.getAttribute("userid");
		Date date2 = new Date(System.currentTimeMillis());
		String date = String.valueOf(date2.getYear()) + "-" + String.valueOf(date2.getMonth() + 1) + "-" + String.valueOf(date2.getDate());
		userDAO.updateUser(new UserVO(id, birthday, email , phone, pw, date));
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("index");
		mav.addObject("msg","success");
		session.setAttribute("userid", id);
        session.setAttribute("pw", pw);
		return mav;
	}
}
