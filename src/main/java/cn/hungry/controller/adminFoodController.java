package cn.hungry.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.hungry.pojo.Cart;
import cn.hungry.pojo.Category;
import cn.hungry.pojo.Food;
import cn.hungry.service.CategoryService;
import cn.hungry.service.FoodService;
import cn.hungry.util.Page;


@Controller
public class adminFoodController {
	
	@Autowired
	FoodService foodService;	
	@Autowired
	CategoryService categoryService;
		
	
	@RequestMapping("adminFood")
    public String adminFood(int cid, Model model, Page page) {	
		Category cs = categoryService.get(cid);
		PageHelper.offsetPage(page.getStart(),page.getCount());	
		List<Food> fs = foodService.list(cid);
		int total = (int) new PageInfo<>(fs).getTotal();
        page.setTotal(total);
        page.setParam("&cid="+cs.getId());
        model.addAttribute("fs", fs);
        model.addAttribute("cs", cs);
        model.addAttribute("page", page);
		return "admin/adminFood";		
	}
	
	@RequestMapping("editFood")
	public String editFood(int fid,Model model) {
		Food fs = foodService.get(fid);
		model.addAttribute("fs",fs);
		return "admin/editFood";
	}
	
	@RequestMapping("uploadFoodImg")
    public String uploadFoodImg(int fid,int cid,Model model) {
		Food fs= foodService.get(fid);
		//Category cs = categoryService.get(cid);
		model.addAttribute("fs",fs);
		//model.addAttribute("cs",cs);
        return "admin/uploadFood";
    }
	
	@ResponseBody
	@RequestMapping("editFood_update")
	public String editFood_update(Food f) {		
		if(foodService.update(f)) {
			return "success";
		}				
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("adminFood_delete")
	public String adminFood_delete(Food f) {		
		if(foodService.delete(f)) {
			return "success";
		}				
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("adminFood_add")
	public String adminFood_add(Food f) {		
		if(foodService.add(f)) {
			return "success";
		}				
		return "fail";
	}
	
	
	
	
		
	@ResponseBody
	@RequestMapping(value = "upload", method = RequestMethod.POST)
    public Map<String, Object> upload(HttpServletRequest req, @RequestParam("file") MultipartFile file,Food f) {
				
		Map<String, Object> maps = new HashMap<>();
		
		System.out.println(f.getId());
		System.out.println(f.getCid());
		
	    try {
	    	String fileName = "c"+f.getCid()+"_"+"f"+f.getId();
	        //String fileName = System.currentTimeMillis()+file.getOriginalFilename();
	        String destFileName=req.getServletContext().getRealPath("")+"img"+File.separator+"food"+File.separator+fileName+".jpg";	        
	        File destFile = new File(destFileName);
	        destFile.getParentFile().mkdirs();
	        file.transferTo(destFile);
	        
	        //更新图片名字
	        f.setImg(fileName);
	        foodService.updateFoodImg(f);
	        
	        maps.put("code", "0");
			maps.put("msg", "上传成功");
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();	        
	        maps.put("msg", "上传失败");
	        return maps;
	    } catch (IOException e) {
	        e.printStackTrace();
	        maps.put("msg", "上传失败");
	        return maps;
	    }	     	    
		return maps;
    }   

}
