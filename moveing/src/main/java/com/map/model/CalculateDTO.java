package com.map.model;

import java.util.Date;

public class CalculateDTO {
	  Date c_date; 
	  String po_code; 
	  String po_wname; 
	  String po_name; 
	  int quantity; 
	  int unit_price; 
	  int price; 
	  String cal_type;
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public String getPo_code() {
		return po_code;
	}
	public void setPo_code(String po_code) {
		this.po_code = po_code;
	}
	public String getPo_wname() {
		return po_wname;
	}
	public void setPo_wname(String po_wname) {
		this.po_wname = po_wname;
	}
	public String getPo_name() {
		return po_name;
	}
	public void setPo_name(String po_name) {
		this.po_name = po_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(int unit_price) {
		this.unit_price = unit_price;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCal_type() {
		return cal_type;
	}
	public void setCal_type(String cal_type) {
		this.cal_type = cal_type;
	} 
	  
	  
}
