package cn.hungry.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hungry.mapper.CategoryMapper;

import cn.hungry.pojo.Category;
import cn.hungry.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
    CategoryMapper categoryMapper;

	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
		return categoryMapper.list();
	}

	@Override
	public boolean add(Category category) {
		return categoryMapper.add(category);
		
	}

	@Override
	public boolean delete(Category category) {
		return categoryMapper.delete(category);
		
	}

	@Override
	public Category get(int id) {		
		return categoryMapper.get(id);
	}

	@Override
	public boolean update(Category category) {
		
		return categoryMapper.update(category);
	}
	
}
