package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class ClientUserRecord {//客户、用户的记录表
	private  Integer cur_Id;//编号
	private  String cur_Title;//记录标题
	private  Integer cur_ClientId;//客户表
	private  Integer cur_UserId;//用户表
	private  Integer cur_ZhuangTai;//意向状态（意向中、意向中 一般、意向中 中强、意向中 强）
	private  String cur_LianXiFangShi;//联系方式（来电、邮箱、短信、来访）
	private  String cur_RecordTime;//记录时间
	private  String cur_Remark;//备注
	private  Integer cur_Ext1;//预留字段
	private  String cur_Ext2;//预留字段
	public Integer getCur_Id() {
		return cur_Id;
	}
	public void setCur_Id(Integer cur_Id) {
		this.cur_Id = cur_Id;
	}
	public String getCur_Title() {
		return cur_Title;
	}
	public void setCur_Title(String cur_Title) {
		this.cur_Title = cur_Title;
	}
	public Integer getCur_ClientId() {
		return cur_ClientId;
	}
	public void setCur_ClientId(Integer cur_ClientId) {
		this.cur_ClientId = cur_ClientId;
	}
	public Integer getCur_UserId() {
		return cur_UserId;
	}
	public void setCur_UserId(Integer cur_UserId) {
		this.cur_UserId = cur_UserId;
	}
	public Integer getCur_ZhuangTai() {
		return cur_ZhuangTai;
	}
	public void setCur_ZhuangTai(Integer cur_ZhuangTai) {
		this.cur_ZhuangTai = cur_ZhuangTai;
	}
	public String getCur_LianXiFangShi() {
		return cur_LianXiFangShi;
	}
	public void setCur_LianXiFangShi(String cur_LianXiFangShi) {
		this.cur_LianXiFangShi = cur_LianXiFangShi;
	}
	public String getCur_RecordTime() {
		return cur_RecordTime;
	}
	public void setCur_RecordTime(String cur_RecordTime) {
		this.cur_RecordTime = cur_RecordTime;
	}
	public String getCur_Remark() {
		return cur_Remark;
	}
	public void setCur_Remark(String cur_Remark) {
		this.cur_Remark = cur_Remark;
	}
	public Integer getCur_Ext1() {
		return cur_Ext1;
	}
	public void setCur_Ext1(Integer cur_Ext1) {
		this.cur_Ext1 = cur_Ext1;
	}
	public String getCur_Ext2() {
		return cur_Ext2;
	}
	public void setCur_Ext2(String cur_Ext2) {
		this.cur_Ext2 = cur_Ext2;
	}
	@Override
	public String toString() {
		return "ClientUserRecord [cur_Id=" + cur_Id + ", cur_Title=" + cur_Title + ", cur_ClientId=" + cur_ClientId
				+ ", cur_UserId=" + cur_UserId + ", cur_ZhuangTai=" + cur_ZhuangTai + ", cur_LianXiFangShi="
				+ cur_LianXiFangShi + ", cur_RecordTime=" + cur_RecordTime + ", cur_Remark=" + cur_Remark
				+ ", cur_Ext1=" + cur_Ext1 + ", cur_Ext2=" + cur_Ext2 + "]";
	}
	
}
