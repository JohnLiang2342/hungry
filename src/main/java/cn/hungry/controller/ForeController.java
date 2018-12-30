package cn.hungry.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hungry.pojo.Cart;
import cn.hungry.pojo.Category;
import cn.hungry.pojo.Food;
import cn.hungry.pojo.Order;
import cn.hungry.pojo.OrderItem;
import cn.hungry.pojo.User;
import cn.hungry.service.CartService;
import cn.hungry.service.CategoryService;
import cn.hungry.service.FoodService;
import cn.hungry.service.OrderItemService;
import cn.hungry.service.OrderService;
import cn.hungry.service.UserService;


@Controller
public class ForeController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	FoodService foodService;
	@Autowired
	UserService userService;
	@Autowired
	CartService cartService;
	@Autowired
	OrderItemService orderItemService;
	@Autowired
	OrderService orderService;
	
	
		
	@RequestMapping("home")
	public String home(Model model,HttpSession session) {
		List<Category> cs = categoryService.list();
		//分类填充食物
		foodService.fill(cs);		
		User user = (User) session.getAttribute("user");
		model.addAttribute("user",user);
		model.addAttribute("cs",cs);
		
		return "fore/home";
	}
	
	@RequestMapping("shoppingCart")
	public String shoppingCart(Model model,HttpSession session) {
		//session 获取用户id	
		User user = (User) session.getAttribute("user");
		
		
		List<OrderItem> ois = orderItemService.listCartByUser(user.getId());
		Float totalPrice = orderItemService.getTotalPrice(ois);
		/*for(OrderItem oi : ois) {
			Float orderItemPrice = (Float)(oi.getNumber()*oi.getFood().getPrice());
			System.out.println(orderItemPrice);
			oi.setOrderItemPrice(orderItemPrice);
		}*/
		int foodNumber = orderItemService.getCartCountByUid(user.getId());
		model.addAttribute("user",user);
		model.addAttribute("foodNumber",foodNumber);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("ois", ois);		
		return "fore/shoppingCart";
	}
	
	@RequestMapping("search")
	public String search() {		
		return "fore/search";
	}
		
	@RequestMapping("toSearch")
	public String toSearch(Model model,HttpSession session,String keyword) {		
		List<Food> fs = foodService.search(keyword);
		User user = (User) session.getAttribute("user");
		model.addAttribute("user",user);
		model.addAttribute("fs",fs);		
		return "fore/showSearch";
	}
	
	@RequestMapping("order")
	public String order(Model model,HttpSession session) {
		//session 获取用户id
		User user = (User) session.getAttribute("user");
		
		List<Order> os = orderService.listByUser(user.getId());
		//有查询所有有oid的orderitem
		for(Order o : os) {
			o.setOis(orderItemService.listOrderByUser(user.getId(),o.getId()));
		}
		
		model.addAttribute("user",user);
		model.addAttribute("os", os);
						
		return "fore/order";
	}
	
	@RequestMapping("confirmReceive")
	public String confirmReceive(Order o) {	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		o.setConfirm_date(df.format(new Date()));	
		orderService.setConfirm_date(o);			
		return "redirect:order";
	}
	
	@RequestMapping("deleteOrder")
	public String deleteOrder(Order o) {		
		orderService.delete(o);			
		return "redirect:order";
	}
	
	
	
	@RequestMapping("confirmPay")
	public String confirmPay(int oid) {
		
		orderService.setPay(oid);
		
		return "redirect:order";
		
	}
	
	@RequestMapping("pay")
	public String pay(int oid,Model model) {
		System.out.println("pay"+oid);
		//List<OrderItem> ois = orderItemService.listByUser(1);
		
		Float totalPrice = orderService.getTotalPrice(oid);
		
		System.out.println("Float"+totalPrice);
		model.addAttribute("oid", oid);
		model.addAttribute("totalPrice", totalPrice);
		return "fore/pay";
	}
	
	@RequestMapping("deleteCartItem")
	public String deleteCartItem(int oiid,HttpSession session) {
		//session 获取用户id
		User user = (User) session.getAttribute("user");
		//根据用户id,oiid删除购物车
		orderItemService.deleteCartItem(user.getId(),oiid);
		return "redirect:shoppingCart";	
	}
	
	
	@ResponseBody
	@RequestMapping("creatOrder")
	public int creatOrder(Order order,HttpSession session) {		
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");//设置日期格式
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		
		//session 获取用户id
		User user = (User) session.getAttribute("user");
		
		order.setUid(user.getId());
		// + (int)((Math.random()*9+1)*1000000)+""
		order.setOrder_code(df.format(new Date()) + (int)((Math.random()*9+1)*1000));
		order.setCreate_date(df2.format(new Date()));// new Date()为获取当前系统时间
				
		
		orderService.add(order);
		System.out.println(order.getId());
		if(orderItemService.creatOrder(order.getId(), user.getId())) {
			return order.getId();
		}else {
			return 0;
		}
		
		
	}
	
	@RequestMapping("forefood")
    public String food(int id, Model model,HttpSession session) {
		
		//session 获取用户id
		User user = (User) session.getAttribute("user");	
		int cartCount = orderItemService.getCartCountByUid(user.getId());
		
		Food fs = foodService.get(id);	
		model.addAttribute("cartCount", cartCount);
		model.addAttribute("fs",fs);
		return "fore/food";		
	}
	
	/*
	 * 添加到购物车
	 */
	@ResponseBody
	@RequestMapping("addCart")
	public Integer addCart(OrderItem orderItem,HttpSession session) {
		
		//session 获取用户id
		User user = (User) session.getAttribute("user");
		
		
		//检查orderItem是否已存在商品
		OrderItem oi = orderItemService.checkFidExistCart(user.getId(), orderItem.getFid());
		if(oi==null) {
			orderItem.setUid(user.getId());
			//添加到购物车
			if(orderItemService.addCart(orderItem)) {
				//添加成功后根据uid返回购物车数量
				int cartCount = orderItemService.getCartCountByUid(user.getId());
				System.out.println(cartCount);
				
				return cartCount;
			}else {
				return null;
			}
		}else {
			orderItem.setUid(user.getId());
			//若购物车已存在商品，修改数量
			orderItem.setNumber(oi.getNumber()+orderItem.getNumber());
			//更新商品数量
			if(orderItemService.updateNumber(orderItem)) {
				//更新成功后根据uid返回购物车数量
				int cartCount = orderItemService.getCartCountByUid(user.getId());
				System.out.println(cartCount);
				
				return cartCount;
			}
			return null;			
		}
		
		
	}
		
	@RequestMapping("CategoryPage")
	public String CategoryPage(Food f,Model model) {		
		List<Food> fs = foodService.list(f.getCid());
		Category cs = categoryService.get(f.getCid());
		model.addAttribute("cs",cs);
		model.addAttribute("fs",fs);				
		return "fore/CategoryPage";
	}
	
	
	
}
