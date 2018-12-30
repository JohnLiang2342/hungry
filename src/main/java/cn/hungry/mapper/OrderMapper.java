package cn.hungry.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.hungry.pojo.Order;

@Mapper
public interface OrderMapper {
	
	List<Order> listByUser(int uid);
	
	List<Order> list();
	
	boolean setPay(int oid);
		
	int add(Order order);

    boolean delete(Order order);

    Order get(int id);

    boolean update(Order order);
    
    Float getTotalPrice(int oid);
    
    boolean delivery(Order order);
    
    boolean setConfirm_date(Order order);

	
    
    
    		 
}
