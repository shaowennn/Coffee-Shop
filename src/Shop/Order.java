package Shop;

public class Order {
	
	private String _username;
	private int _pro_id;
	private int _amount;
	private String _status;
	

	public Order(String username, int pro_id, int amount, String status) {
		// 这是构造函数
		this._username = username;
		this._pro_id = pro_id;
		this._amount = amount;
		this._status = status;
	}

	public int getProduct_id() {
		// 这是获取私有属性_pro_id的函数
		return this._pro_id;
	}

	public int getAmount() {
		// TODO Auto-generated method stub
		return this._amount;
	}
	
//	public int getPrice() {
//		// TODO Auto-generated method stub
//		return this._price;
//	}
//	
//	public int getTotal() {
//		// TODO Auto-generated method stub
//		return this._total;
//	}
//	
//	public String getProductName() {
//		// TODO Auto-generated method stub
//		return this._productName;
//	}s

	public String getUsername() {
		// TODO Auto-generated method stub
		return this._username;
	}
	
	public String getStatus(){
		return this._status;
	}

}
