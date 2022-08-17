package com.map.model;

import java.util.Date;

public class EstimateDTO {
  int order; 
  String id; 
  String pw; 
  String name; 
  int SV_Type; 
  Date DateTime;
  String Start_Point; 
  String End_Point; 
  int Furniture; 
  int Home_App; 
  int Other; 
  String Furniture_Det; 
  String Home_App_Det; 
  String Other_Det; 
  int box; 
  String request;
public int getOrder() {
	return order;
}
public void setOrder(int order) {
	this.order = order;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getSV_Type() {
	return SV_Type;
}
public void setSV_Type(int sV_Type) {
	SV_Type = sV_Type;
}
public Date getDateTime() {
	return DateTime;
}
public void setDateTime(Date dateTime) {
	DateTime = dateTime;
}
public String getStart_Point() {
	return Start_Point;
}
public void setStart_Point(String start_Point) {
	Start_Point = start_Point;
}
public String getEnd_Point() {
	return End_Point;
}
public void setEnd_Point(String end_Point) {
	End_Point = end_Point;
}
public int getFurniture() {
	return Furniture;
}
public void setFurniture(int furniture) {
	Furniture = furniture;
}
public int getHome_App() {
	return Home_App;
}
public void setHome_App(int home_App) {
	Home_App = home_App;
}
public int getOther() {
	return Other;
}
public void setOther(int other) {
	Other = other;
}
public String getFurniture_Det() {
	return Furniture_Det;
}
public void setFurniture_Det(String furniture_Det) {
	Furniture_Det = furniture_Det;
}
public String getHome_App_Det() {
	return Home_App_Det;
}
public void setHome_App_Det(String home_App_Det) {
	Home_App_Det = home_App_Det;
}
public String getOther_Det() {
	return Other_Det;
}
public void setOther_Det(String other_Det) {
	Other_Det = other_Det;
}
public int getBox() {
	return box;
}
public void setBox(int box) {
	this.box = box;
}
public String getRequest() {
	return request;
}
public void setRequest(String request) {
	this.request = request;
}
  
}
