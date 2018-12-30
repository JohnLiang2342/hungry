package cn.hungry.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hungry.mapper.OrderMapper;
import cn.hungry.pojo.Category;
import cn.hungry.pojo.Order;
import cn.hungry.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderMapper orderMapper;
	
	@Override
	public List<Order> listByUser(int uid) {
		
		return orderMapper.listByUser(uid);
	}

	@Override
	public int add(Order order) {
		int a = orderMapper.add(order);
		System.out.println(a+"返回的id");
		
		return a;
		
	}

	@Override
	public boolean delete(Order order) {
		return orderMapper.delete(order);
		
	}

	@Override
	public Order get(int id) {		
		return orderMapper.get(id);
	}

	@Override
	public boolean update(Order order) {
		
		return orderMapper.update(order);
	}

	@Override
	public Float getTotalPrice(int oid) {
		
		return orderMapper.getTotalPrice(oid);
	}

	@Override
	public boolean setPay(int oid) {
		
		return orderMapper.setPay(oid);
	}

	@Override
	public List<Order> list() {
		
		return orderMapper.list();
	}

	@Override
	public boolean delivery(Order order) {
		
		return orderMapper.delivery(order);
	}

	@Override
	public boolean setConfirm_date(Order order) {
		return orderMapper.setConfirm_date(order);
	}

	

}
