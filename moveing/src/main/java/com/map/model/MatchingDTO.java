package com.map.model;

import java.util.Date;


public class MatchingDTO {
	int res_num; // 예약번호
	String user_ID; // 고객아이디
	String driver_ID; // 기사아이디
	Date reservat_date; //이사날짜
	String start_point; //출발주소
	String start_op; //출발지옵션
	String end_point; //도착주소
	String end_op; // 도착옵션
	String luggage_list; //짐목록
	String shopping_list; // 쇼핑리스트
	String requests; //요창사항
	int req_state; // 매칭상태
	Date req_date; //예약날짜
	int cost; // 총가격
	
	
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
	public String getShopping_list() {
		return shopping_list;
	}
	public void setShopping_list(String shopping_list) {
		this.shopping_list = shopping_list;
	}
	public String getRequests() {
		return requests;
	}
	public void setRequests(String requests) {
		this.requests = requests;
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
