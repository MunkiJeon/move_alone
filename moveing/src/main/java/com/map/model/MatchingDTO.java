package com.map.model;

import java.util.Date;


public class MatchingDTO {
	int res_num,cost;
	String user_ID;
	String driver_ID;
	Date reservat_date;
	String start_point;
	String start_op;
	String end_point;
	String end_op;
	String luggage_list;
	int box;
	String requests;
	int req_state;
	Date req_date;
	
	
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getDriver_ID() {
		return driver_ID;
	}
	public void setDriver_ID(String driver_ID) {
		this.driver_ID = driver_ID;
	}
	public Date getReservat_date() {
		return reservat_date;
	}
	public void setReservat_date(Date reservat_date) {
		this.reservat_date = reservat_date;
	}
	public String getStart_point() {
		return start_point;
	}
	public void setStart_point(String start_point) {
		this.start_point = start_point;
	}
	public String getStart_op() {
		return start_op;
	}
	public void setStart_op(String start_op) {
		this.start_op = start_op;
	}
	public String getEnd_point() {
		return end_point;
	}
	public void setEnd_point(String end_point) {
		this.end_point = end_point;
	}
	public String getEnd_op() {
		return end_op;
	}
	public void setEnd_op(String end_op) {
		this.end_op = end_op;
	}
	public String getLuggage_list() {
		return luggage_list;
	}
	public void setLuggage_list(String luggage_list) {
		this.luggage_list = luggage_list;
	}
	public int getBox() {
		return box;
	}
	public void setBox(int box) {
		this.box = box;
	}
	public String getRequests() {
		return requests;
	}

	public void setRequests(String repuests) {
		this.requests = repuests;
	}
	public int getReq_state() {
		return req_state;
	}
	public void setReq_state(int req_state) {
		this.req_state = req_state;
	}
	public Date getReq_date() {
		return req_date;
	}
	public void setReq_date(Date req_date) {
		this.req_date = req_date;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	  
	
	
}
