package buy;

import java.sql.Timestamp;

public class BuyBean {
	private Long buy_id;
	private String buyer;
	private int kit_id;
	private String kit_title;
	private int buy_price;
	private byte buy_count;
	private String kit_img;
	private Timestamp buy_date;
	private String account;
	private String deliveryName;
	private String deliveryTel;
	private String deliveryAddress;
	private String sanction;
	
	public Long getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(Long buy_id) {
		this.buy_id = buy_id;
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
	public Timestamp getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Timestamp buy_date) {
		this.buy_date = buy_date;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getDeliveryName() {
		return deliveryName;
	}
	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}
	public String getDeliveryTel() {
		return deliveryTel;
	}
	public void setDeliveryTel(String deliveryTel) {
		this.deliveryTel = deliveryTel;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public String getSanction() {
		return sanction;
	}
	public void setSanction(String sanction) {
		this.sanction = sanction;
	}
	
	
}
