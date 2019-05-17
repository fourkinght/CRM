package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class Consultant {//咨询师表
private Integer c_Id;//编号
private Integer c_UserId;//用户表
private Integer c_Weight;//权重
private Integer c_Remark;//备注
private Integer c_Ext1;//预留字段
private Integer c_Ext2;//预留字段
public Integer getC_Id() {
	return c_Id;
}
public void setC_Id(Integer c_Id) {
	this.c_Id = c_Id;
}
public Integer getC_UserId() {
	return c_UserId;
}
public void setC_UserId(Integer c_UserId) {
	this.c_UserId = c_UserId;
}
public Integer getC_Weight() {
	return c_Weight;
}
public void setC_Weight(Integer c_Weight) {
	this.c_Weight = c_Weight;
}
public Integer getC_Remark() {
	return c_Remark;
}
public void setC_Remark(Integer c_Remark) {
	this.c_Remark = c_Remark;
}
public Integer getC_Ext1() {
	return c_Ext1;
}
public void setC_Ext1(Integer c_Ext1) {
	this.c_Ext1 = c_Ext1;
}
public Integer getC_Ext2() {
	return c_Ext2;
}
public void setC_Ext2(Integer c_Ext2) {
	this.c_Ext2 = c_Ext2;
}
@Override
public String toString() {
	return "Consultant [c_Id=" + c_Id + ", c_UserId=" + c_UserId + ", c_Weight=" + c_Weight + ", c_Remark=" + c_Remark
			+ ", c_Ext1=" + c_Ext1 + ", c_Ext2=" + c_Ext2 + "]";
}
	
}
