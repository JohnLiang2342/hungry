package cn.hungry.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hungry.mapper.FoodMapper;
import cn.hungry.pojo.Category;
import cn.hungry.pojo.Food;
import cn.hungry.service.FoodService;

@Service
public class FoodServiceImpl implements FoodService {
	
	@Autowired
	FoodMapper foodMapper;

	@Override
	public List<Food> list(int cid) {
		
		return foodMapper.list(cid);
	}

	@Override
	public boolean add(Food f) {
		return foodMapper.add(f);
		
	}

	@Override
	public boolean delete(Food f) {
		return foodMapper.delete(f);
		
	}

	@Override
	public boolean update(Food f) {
		return foodMapper.update(f);
		
	}

	@Override
	public Food get(int id) {
		
		return foodMapper.get(id);
	}

	@Override
	public void fill(List<Category> cs) {
		for (Category c : cs) {
            fill(c);
        }
		
	}

	@Override
	public void fill(Category c) {
		List<Food> fs = list(c.getId());
        c.setFood(fs);
		
	}

	@Override
	public boolean updateFoodImg(Food f) {		
		return foodMapper.updateFoodImg(f);
	}

	@Override
	public List<Food> search(String keyword) {
		return foodMapper.search(keyword);
	}
	
	

}
