package cart;

public class CartBean {
	private int cart_id;
	private String buyer;
	private int kit_id;
	private String kit_title;
	private int buy_price;
	private byte buy_count;
	private String kit_img;
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public int getKit_id() {
		return kit_id;
	}
	public void setKit_id(int kit_id) {
		this.kit_id = kit_id;
	}
	public String getKit_title() {
		return kit_title;
	}
	public void setKit_title(String kit_title) {
		this.kit_title = kit_title;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public byte getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(byte buy_count) {
		this.buy_count = buy_count;
	}
	public String getKit_img() {
		return kit_img;
	}
	public void setKit_img(String kit_img) {
		this.kit_img = kit_img;
	} 	
	
	
}
