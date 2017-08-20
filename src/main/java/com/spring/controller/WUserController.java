package com.spring.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.WebConstants;
import com.spring.model.ModelUser;
import com.spring.service.IServiceUser;

/**
 * Handles requests for the application home page.
 */
@Controller
public class WUserController {
	
	private static final Logger logger = LoggerFactory.getLogger(WUserController.class);
	
	@Autowired
	@Qualifier("serviceuser")
	private IServiceUser svruser;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model
	        ,HttpSession session) {
		logger.info("login");
		
		if(session.getAttribute(WebConstants.SESSION_NAME) != null){
		    return "redirect:/";
		}
		
		return "cafe/login";
	}
	
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
    public String loginaction(Model model
            ,@RequestParam(value="email",defaultValue="") String email
            ,@RequestParam(value="passwd",defaultValue="") String passwd
            ,HttpSession session) {
        logger.info("login post");
        
        ModelUser user = svruser.login(email, passwd);
        
        if(user != null){
            session.setAttribute(WebConstants.SESSION_NAME, user);
            return "redirect:/";
        }
        else{
            return "cafe/login";
        }
        
    }
	
	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
    public String logout(Locale locale, Model model
            ,HttpSession session) {
        logger.info("logout");
        
        session.removeAttribute(WebConstants.SESSION_NAME);
        
        return "redirect:/";
    }
	
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
    public String join(Locale locale, Model model) {
        logger.info("join");
        
        
        return "cafe/join";
    }
	
	@RequestMapping(value = "/user/join", method = RequestMethod.POST)
    public String joinaction(Locale locale, Model model
            ,HttpServletRequest request
            ,HttpSession session) {
	    
        logger.info("join result", locale);
        int emailselect = 0;
        String email = request.getParameter("email");
        String usernickname = request.getParameter("usernickname");
        String passwd = request.getParameter("passwd");
        String userphone = request.getParameter("userphone");
        String getemailselect = request.getParameter("emailselect");
        String sex = request.getParameter("sex");
        if(getemailselect == "on"){
            emailselect = 1;
        }else{
            emailselect = 0;
        }
        
        ModelUser user = new ModelUser();
        user.setEmail(email);
        user.setEmailselect(emailselect);
        user.setPasswd(passwd);
        user.setUserphone(userphone);
        user.setUsernickname(usernickname);
        user.setSex(sex);
        model.addAttribute("user",user);
        
        int result = svruser.insertUser(user);
        
        if(result == 1 ){
            return "redirect:/user/joinresult";
        }else{
            return "cafe/join";
        }

    }
	
	@RequestMapping(value = "/user/joinresult", method = RequestMethod.GET)
    public String joinresult(Locale locale, Model model) {
        logger.info("join");
        
        
        return "cafe/joinresult";
    }
	
	@RequestMapping(value = "/user/checkemail", method = RequestMethod.POST)
    @ResponseBody
    public int checkemail(Model model
            ,@RequestParam(value="email",defaultValue="")String email) {
        logger.info("checkemail");
        
        int result = svruser.checkemail(email);
        
        return result;
    }
	
	@RequestMapping(value = "/user/checknickname", method = RequestMethod.POST)
    @ResponseBody
    public int checknickname(Model model
            ,@RequestParam(value="usernickname",defaultValue="")String usernickname) {
        logger.info("checknickname");
        
        int result = svruser.checknickname(usernickname);
        
        return result;
    }
	
}
