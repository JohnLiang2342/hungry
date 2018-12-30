package cn.hungry.service;

import java.util.List;

import cn.hungry.pojo.Category;
import cn.hungry.pojo.Food;



public interface FoodService {
	List<Food> list(int cid);
	
	boolean add(Food f);
    
	boolean delete(Food f);
    
	boolean update(Food f);
    
	Food get(int id);
	
	void fill(List<Category> cs);

    void fill(Category c);
    
    boolean updateFoodImg(Food f);
    
    List<Food> search(String keyword);
    
}
