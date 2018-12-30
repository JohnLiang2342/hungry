package cn.hungry.interceptor;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.hungry.pojo.User;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final String[] IGNORE_URI = {
												"login",
												"checkLogin",
											    "register",
											    "search",
											    "toSearch",
											    "getVerCode",
											    "checkVerCode",
											    "toRegister",
											    "forget",
											    "error",
											    "home",											   
											    "CategoryPage",
											    
											    "adminCategory",
											    "editCategory",
											    "editCategory_update",
											    "adminCategory_delete",
											    "adminCategory_add",
											    "adminFood",
											    "editFood",
											    "uploadFoodImg",
											    "editFood_update",
											    "adminFood_delete",
											    "adminFood_add",
											    "upload",
											    "adminOrder",
											    "adminOrder_delete",
											    "adminOrder_delivery",
											    "adminUser"
											   };
	
	/**/
	
	public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {
		
		//flag变量用于判断是否包含路径
        boolean flag = false; 
        //String uri = request.getRequestURI();
        
        String servletPath = request.getServletPath();
        System.out.println(servletPath);
        
        
        for (String s : IGNORE_URI) {
        	if("/".equals(servletPath)) {
        		flag = true;
        	}
            if (servletPath.contains(s)) {
            	
            	System.out.println("是否包含路径？"+servletPath.contains(s));
            	flag = true;
            	break;
            }
        }
        
        //拦截请求
        if (flag) {
        	return true;
        }else {
        	//1.获取session中的用户 
            User user = (User)request.getSession().getAttribute("user");
            
            //System.out.println("sessionId"+name);
            //2.判断用户是否已经登录 
            if(user == null) {
            	//验证还未登录，跳转至登录界面
            	
            	response.sendRedirect("login");
            	return false;
            } else {
            	//如果用户已经登录，则验证通过，放行             
            	return true;
            }
		}
        
        
        //System.out.println(servletPath);
        
        
	
	
	}
	
	public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler,    
            ModelAndView modelAndView) throws Exception {


    }
	
	public void afterCompletion(HttpServletRequest request,    
            HttpServletResponse response, Object handler, Exception ex)  
    throws Exception {  
           
    }
	
}
