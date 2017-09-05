package airdnd.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import airdnd.dao.interfaces.UserDAO;
import airdnd.vo.UserVO;

@Controller
public class JoinController {

   @Autowired
   UserDAO userDAO;
   
   @RequestMapping("join.do")
   public ModelAndView join(@RequestParam String id, String pw, String email, String phone, String birthday) {
      Date date2 = new Date(System.currentTimeMillis());
      
      String date = String.valueOf(date2.getYear()) + "-" + String.valueOf(date2.getMonth() + 1) + "-" + String.valueOf(date2.getDate());
      
      
      UserVO uservo = userDAO.getUser(id);
      ModelAndView mav = new ModelAndView();
      if(uservo == null)
      {
      userDAO.addUser(new UserVO(id, birthday, email , phone, pw, date));
      mav.setViewName("index");
      mav.addObject("msg","success");
      System.out.println("ddd");
      return mav;
      }
      else
      {
         mav.setViewName("login_check");
         mav.addObject("msg","fail");
         System.out.println("cccc");
         return mav;
      }
   }
}