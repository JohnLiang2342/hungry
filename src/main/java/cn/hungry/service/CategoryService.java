package cn.hungry.service;

import java.util.List;

import cn.hungry.pojo.Category;

public interface CategoryService {
	List<Category> list();
	
	boolean add(Category category);
	
	boolean delete(Category category);

    Category get(int id);

    boolean update(Category category);
	

}
