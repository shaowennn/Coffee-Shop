package Shop;

public class Cart {
	public Cart(String username, int product_id) {
		super();
		this.username = username;
		this.product_id = product_id;
	}
	private String username;
	private int product_id;
	private int amount;
	
	public Cart(String username, int product_id, int amount) {
		super();
		this.username = username;
		this.product_id = product_id;
		this.amount = amount;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
