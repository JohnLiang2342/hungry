package cn.hungry.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hungry.mapper.FoodMapper;

import cn.hungry.mapper.OrderItemMapper;
import cn.hungry.mapper.OrderMapper;
import cn.hungry.pojo.Category;
import cn.hungry.pojo.Food;
import cn.hungry.pojo.OrderItem;
import cn.hungry.service.OrderItemService;

@Service
public class OrderItemServiceImpl implements OrderItemService {
	
	@Autowired
	OrderItemMapper orderItemMapper;
	@Autowired
	FoodMapper foodMapper;

	@Override
	public List<OrderItem> listCartByUser(int uid) {
		List<OrderItem> ois = orderItemMapper.listCartByUser(uid);
		fill(ois);
		return ois;
	}

	@Override
	public void fill(List<OrderItem> ois) {
		for (OrderItem oi : ois) {
            fill(oi);
        }		
	}


	@Override
	public void fill(OrderItem oi) {
		Food f = foodMapper.get(oi.getFid());
		oi.setFood(f);		
	}

	
	@Override
	public Float getTotalPrice(List<OrderItem> ois) {
		Float totalPrice = 0f;		
		for(OrderItem oi : ois) {
			Float temp;
			//System.out.println(oi.getFood().getPrice());
			temp = oi.getFood().getPrice()*oi.getNumber();
			totalPrice += temp;
			
		}
		System.out.println("getTotalPrice()"+totalPrice);
		return totalPrice;
	}

	@Override
	public Integer getCartCountByUid(int uid) {
		return orderItemMapper.getCartCountByUid(uid);
	}

	@Override
	public boolean creatOrder(int oid, int uid) {
		return orderItemMapper.creatOrder(oid, uid);
	}

	@Override
	public OrderItem checkFidExistCart(int uid, int fid) {
		
		return orderItemMapper.checkFidExistCart(uid, fid);
	}

	@Override
	public boolean addCart(OrderItem orderItem) {
		return orderItemMapper.addCart(orderItem);
	}

	@Override
	public boolean updateNumber(OrderItem orderItem) {		
		return orderItemMapper.updateNumber(orderItem);
	}

	@Override
	public List<OrderItem> listOrderByUser(int uid, int oid) {
		List<OrderItem> ois = orderItemMapper.listOrderByUser(uid,oid);
		fill(ois);
		return ois;
	}

	@Override
	public boolean deleteCartItem(int uid, int oiid) {
		return orderItemMapper.deleteCartItem(uid, oiid);
	}

}
