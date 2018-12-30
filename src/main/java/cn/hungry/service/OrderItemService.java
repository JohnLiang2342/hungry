package cn.hungry.service;

import java.util.List;

import cn.hungry.pojo.Category;
import cn.hungry.pojo.OrderItem;

public interface OrderItemService {
	
	List<OrderItem> listCartByUser(int uid);
	
	List<OrderItem> listOrderByUser(int uid,int oid);
	
	OrderItem checkFidExistCart(int uid,int fid);
	
	boolean addCart(OrderItem orderItem);
	
	boolean updateNumber(OrderItem orderItem);
	
	void fill(List<OrderItem> ois);

    void fill(OrderItem oi);
    
    Float getTotalPrice(List<OrderItem> ois);
    
    Integer getCartCountByUid(int uid);
    
    boolean creatOrder(int oid,int uid);
    
    boolean deleteCartItem(int uid,int oiid);
}
