package airdnd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import airdnd.dao.interfaces.UserDAO;
import airdnd.vo.UserVO;

@Controller
public class LoginController {
	
	@Autowired
    UserDAO userDAO;
    
	
	@RequestMapping("loginCheck.do")
    public ModelAndView loginCheck(@RequestParam String id, String pw, HttpSession session, HttpServletRequest request){
        System.out.println(id + "   " + pw);
		boolean result = userDAO.login(id, pw);
        ModelAndView mav = new ModelAndView();
        if (result == true) { // 로그인 성공
            // main.jsp로 이동
            mav.setViewName("index");
            mav.addObject("msg", "success");
            session.setAttribute("userid", id);
            session.setAttribute("pw", pw);
        } else {    // 로그인 실패
            // login.jsp로 이동
            mav.setViewName("login");
            mav.addObject("msg", "failure");
            session.setAttribute("userid", null);
            session.setAttribute("pw", null);
        }
        
        return mav;
    }
	
	//main page 가기
	@RequestMapping("loginCheck2.do")
    public ModelAndView loginCheck2(HttpSession session){
        System.out.println("ccc"); 
		String id = (String)session.getAttribute("userid");
         String pw = (String)session.getAttribute("pw");
		
		System.out.println(id + "   " + pw);
		boolean result = userDAO.login(id, pw);
        ModelAndView mav = new ModelAndView();
        if (result == true) { // 로그인 성공
            // main.jsp로 이동
            mav.setViewName("index");
            mav.addObject("msg", "success");
            session.setAttribute("userid", id);
            session.setAttribute("pw", pw);
        } else {    // 로그인 실패
            // login.jsp로 이동
            mav.setViewName("login");
            mav.addObject("msg", "failure");
            session.setAttribute("userid", null);
            session.setAttribute("pw", null);
        }
        
        return mav;
    }
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.setAttribute("userid", null);
		session.setAttribute("pw", null);
		return "redirect:index.jsp";
	}
}