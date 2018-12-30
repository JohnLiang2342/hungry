package cn.hungry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hungry.pojo.Cart;
import cn.hungry.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	/*@ResponseBody
	@RequestMapping("addCart")
	public Integer addCart(Cart cart) {
		
		Cart c = cartService.getByFid(cart.getFid());
		if(c==null) {
			if(cartService.addCart(cart)) {
				int cartCount = cartService.getCartCountByUid(2);
				System.out.println(cartCount);
				
				return cartCount;
			}else {
				return null;
			}
		}else {			
			cart.setCount(c.getCount()+cart.getCount());
			if(cartService.updateCount(cart)) {
				int cartCount = cartService.getCartCountByUid(2);
				System.out.println(cartCount);
				
				return cartCount;
			}
			return null;			
		}				
	}*/
}
