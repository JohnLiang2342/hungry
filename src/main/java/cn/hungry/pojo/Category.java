package cn.hungry.pojo;

import java.util.List;



public class Category {
	private Integer id;

    private String name;
    /*非数据库字段*/
    private List<Food> foods;
	
    public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Food> getFoods() {
		return foods;
	}
	public void setFood(List<Food> foods) {
		this.foods = foods;
	}
    

}
