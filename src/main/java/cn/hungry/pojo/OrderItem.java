package cn.hungry.pojo;

public class OrderItem {
	private Integer id;
	private Integer fid;
	private Integer oid;
	private Integer uid;
	private Integer number;
	private Float orderItemPrice;
	
	/*非数据库字段*/
	private Food food;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	public Float getOrderItemPrice() {
		return orderItemPrice;
	}

	public void setOrderItemPrice(Float orderItemPrice) {
		this.orderItemPrice = orderItemPrice;
	}
	
	

}
