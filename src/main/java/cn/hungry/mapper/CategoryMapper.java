package cn.hungry.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.hungry.pojo.Category;
@Mapper
public interface CategoryMapper {
	List<Category> list();

    boolean add(Category category);

    boolean delete(Category category);

    Category get(int id);

    boolean update(Category category);

}
