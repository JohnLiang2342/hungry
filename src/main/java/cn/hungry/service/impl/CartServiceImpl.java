package cn.hungry.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hungry.mapper.CartMapper;
import cn.hungry.pojo.Cart;
import cn.hungry.service.CartService;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartMapper cartMapper;

	@Override
	public boolean addCart(Cart cart) {		
		return cartMapper.addCart(cart);
	}

	@Override
	public Cart getByFid(int fid) {
		
		return cartMapper.getByFid(fid);
	}

	@Override
	public boolean updateCount(Cart cart) {
		
		return cartMapper.updateCount(cart);
	}

	@Override
	public Integer getCartCountByUid(int uid) {		
		return cartMapper.getCartCountByUid(uid);
	}

	
	

}
