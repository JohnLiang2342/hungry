package cn.hungry.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.hungry.pojo.Food;

@Mapper
public interface FoodMapper {
	List<Food> list(int cid);
	
	boolean add(Food f);
    
	boolean delete(Food f);
    
	boolean update(Food f);
    
	Food get(int id);
	
	boolean updateFoodImg(Food f);
	
	List<Food> search(String keyword);
	
	

}
