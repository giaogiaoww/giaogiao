package com.wyj.pojo;

import java.text.DateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class House {
	private int hid;
	private String title;
	private String address;
	private int typeid;
	private double price;
	private int area;
	private String phone;
	private Date housedate;
	private String detailed;
	private String img;
	private HouseType housetype;
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getHousedate() {
		return housedate;
	}
	public void setHousedate(Date housedate) {
		this.housedate = housedate;
	}
	public String getDetailed() {
		return detailed;
	}
	public void setDetailed(String detailed) {
		this.detailed = detailed;
	}
	public HouseType getHousetype() {
		return housetype;
	}
	public void setHousetype(HouseType housetype) {
		this.housetype = housetype;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "House [hid=" + hid + ", title=" + title + ", address=" + address + ", typeid=" + typeid + ", price="
				+ price + ", area=" + area + ", phone=" + phone + ", housedate=" + housedate + ", detailed=" + detailed
				+ ", img=" + img + ", housetype=" + housetype + "]";
	}
	
}
