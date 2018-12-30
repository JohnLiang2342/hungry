package cn.hungry.service;

import cn.hungry.pojo.Cart;

public interface CartService {
	
	boolean addCart(Cart cart);
	
	Cart getByFid(int fid);
	
	boolean updateCount(Cart cart);
	
	Integer getCartCountByUid(int uid);

}
