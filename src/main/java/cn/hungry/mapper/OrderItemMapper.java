package cn.hungry.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import cn.hungry.pojo.OrderItem;
@Mapper
public interface OrderItemMapper {
	
	List<OrderItem> listCartByUser(int uid);
	
	List<OrderItem> listOrderByUser(int uid,int oid);
	
	OrderItem checkFidExistCart(int uid,int fid);
	
	boolean addCart(OrderItem orderItem);
	
	boolean updateNumber(OrderItem orderItem);
	
	Integer getCartCountByUid(int uid);
	
	boolean creatOrder(int oid,int uid);
	
	boolean deleteCartItem(int uid,int oiid);

}
