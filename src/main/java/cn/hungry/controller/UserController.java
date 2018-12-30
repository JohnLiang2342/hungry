package cn.hungry.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import cn.hungry.pojo.Food;
import cn.hungry.pojo.User;
import cn.hungry.service.UserService;
import cn.hungry.util.RandomCodeUtil;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("login")
    public String login() {		
		return "login";
		
	}
	
	@RequestMapping("forget")
    public String forget() {
		
		return "forget";		
	}
	
	
	@RequestMapping("register")
    public String register() {
		return "register";	
	}
	
	@RequestMapping("userInfo")
    public String userInfo(Model model,HttpSession session) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user",user);
		return "fore/userInfo";
	}
	
	@ResponseBody
	@RequestMapping("checkLogin")
    public String checkLogin(User user,HttpSession session) {
		System.out.println(user.getUsername());
		System.out.println(user.getPassword());
		
		User us = userService.checkLogin(user);
		//System.out.println("us"+us.getUsername());
        if(null==us){
        	
            return "fail";
        }
        session.setAttribute("user", us);		
        return "success";			
	}
	
	@ResponseBody
	@RequestMapping("logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "success";
    }
	
	@ResponseBody
	@RequestMapping("toRegister")
    public String register(User user,HttpSession session) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        user.setCreate_date(df.format(new Date()));
        //创建新用户同时返回新用户id
        userService.toRegister(user);
        //System.out.println("新创建的用户id:"+user.getId());
        if(user.getId()!=0) {
        	User user2 = userService.get(user.getId());
        	session.setAttribute("user", user2);
        	return "success";
        }else {
        	return "fail";
		}        
    }
	
	@ResponseBody
	@RequestMapping("getVerCode")
    public String getVerCode(String phone) {
		//查询手机号是否已被注册				
		if(userService.checkExisPhone(phone)==null) {
			userService.sendSMS(phone);
			return "success";
		}else {
			return "fail";
		}			
	}
	
	@ResponseBody
	@RequestMapping("forgetGetVerCode")
    public String forgetGetVerCode(String phone) {
		//查询手机号是否存在			
		if(userService.checkExisPhone(phone)!=null) {
			userService.sendSMS(phone);
			return "success";
		}else {
			return "fail";
		}			
	}

	@ResponseBody
	@RequestMapping("checkVerCode")
    public String checkVerCode(String verCode) {		
		if(!verCode.equals(RandomCodeUtil.code)) {		
			return "fail";
		}
		System.out.println(verCode);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("updateUsername")
    public String updateUsername(User user,HttpSession session) {
		if(userService.updateUsername(user)) {
			User u = (User) session.getAttribute("user");
			u.setUsername(user.getUsername());
			session.setAttribute("user", u);
			return "success";
		}else {
			return "fail";
		}		
	}
	
	@ResponseBody
	@RequestMapping("updatePassword")
    public String updatePassword(User user,HttpSession session) {
		if(userService.updatePassword(user)) {
			User u = (User) session.getAttribute("user");
			u.setUsername(user.getUsername());
			session.setAttribute("user", u);
			return "success";
		}else {
			return "fail";
		}		
	}
	
	@ResponseBody
	@RequestMapping(value = "uploadIcon", method = RequestMethod.POST)
    public Map<String, Object> upload(HttpServletRequest req, @RequestParam("file") MultipartFile file,Model model,User user) {
				
		Map<String, Object> maps = new HashMap<>();
				
		System.out.println(user.getId());		
		
	    try {
	    	String fileName = user.getId()+"";
	        //String fileName = System.currentTimeMillis()+file.getOriginalFilename();
	        String destFileName=req.getServletContext().getRealPath("")+"img"+File.separator+"user"+File.separator+fileName+".jpg";	        
	        File destFile = new File(destFileName);
	        destFile.getParentFile().mkdirs();
	        file.transferTo(destFile);
	        
	        //更新图片名字
	        	        	        
			maps.put("msg", "success");
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();	        
	        maps.put("msg", "fail");
	        return maps;
	    } catch (IOException e) {
	        e.printStackTrace();
	        maps.put("msg", "fail");
	        return maps;
	    }	     	    
		return maps;
    }
	
}
