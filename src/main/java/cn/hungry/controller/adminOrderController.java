package cn.hungry.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.hungry.pojo.Order;
import cn.hungry.service.OrderService;
import cn.hungry.util.Page;

@Controller
public class adminOrderController {
	
	@Autowired
	OrderService orderService;
	
	
	/*@RequestMapping("adminOrder")
    public String adminOrder(Model model) {
		List<Order> os = orderService.list();
		os.get(0).getId();
		model.addAttribute("os", os);
		return "admin/adminOrder";		
	}*/
	
	
	@RequestMapping("adminOrder")
    public String adminOrder(Model model,Page page) {
		PageHelper.offsetPage(page.getStart(),page.getCount());
		List<Order> os = orderService.list();
		int total = (int) new PageInfo<>(os).getTotal();
		page.setTotal(total);		
		model.addAttribute("os", os);
		model.addAttribute("page", page);
		return "admin/adminOrder";		
	}
	
	@ResponseBody
	@RequestMapping("adminOrder_delete")
	public String adminOrer_delete(Order o) {		
		if(orderService.delete(o)) {
			return "success";
		}
		
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("adminOrder_delivery")
	public String adminOrder_delivery(Order o) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		o.setDelivery_date(df.format(new Date()));
		if(orderService.delivery(o)) {
			return "success";
		}
		
		return "fail";
	}

}
