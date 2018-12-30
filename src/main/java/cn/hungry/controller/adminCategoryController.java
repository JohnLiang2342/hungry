package cn.hungry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.hungry.pojo.Category;


import cn.hungry.service.CategoryService;
import cn.hungry.service.FoodService;

import cn.hungry.util.Page;

@Controller
public class adminCategoryController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	FoodService foodService;
	
	
	@RequestMapping("adminCategory")
    public String adminCategory(Model model,Page page) {
		PageHelper.offsetPage(page.getStart(),page.getCount());
		List<Category> cs = categoryService.list();
		int total = (int) new PageInfo<>(cs).getTotal();
		page.setTotal(total);
		model.addAttribute("cs", cs);
        model.addAttribute("page", page);
		//model.addAttribute("cs",cs);		
		return "admin/adminCategory";		
	}
		
	
	@RequestMapping("editCategory")
	public String editCategory(int cid,Model model) {
		Category cs = categoryService.get(cid);
		model.addAttribute("cs",cs);
		return "admin/editCategory";
	}
	
	@ResponseBody
	@RequestMapping("editCategory_update")
	public String editCategory_update(Category c) {		
		if(categoryService.update(c)) {
			return "success";
		}				
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("adminCategory_delete")
	public String adminCategory_delete(Category c) {		
		if(categoryService.delete(c)) {
			return "success";
		}				
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("adminCategory_add")
	public String adminCategory_add(Category c) {		
		if(categoryService.add(c)) {
			return "success";
		}				
		return "fail";
	}
	
	
	

}
