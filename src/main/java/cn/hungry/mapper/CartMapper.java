package cn.hungry.mapper;

import org.apache.ibatis.annotations.Mapper;

import cn.hungry.pojo.Cart;
@Mapper
public interface CartMapper {
	
	boolean addCart(Cart cart);
	
	Cart getByFid(int fid);
	
	boolean updateCount(Cart cart);
	
	Integer getCartCountByUid(int uid);

}
