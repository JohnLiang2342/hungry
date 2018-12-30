package cn.hungry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.hungry.pojo.User;
import cn.hungry.service.UserService;
import cn.hungry.util.Page;

@Controller
public class adminUserController {
	@Autowired
	UserService userService;
	
	@RequestMapping("adminUser")
    public String adminUser(Model model,Page page) {
		PageHelper.offsetPage(page.getStart(),page.getCount());
		List<User> us = userService.list();
		int total = (int) new PageInfo<>(us).getTotal();
		page.setTotal(total);		
		model.addAttribute("us", us);
		model.addAttribute("page", page);
		return "admin/adminUser";		
	}
}
