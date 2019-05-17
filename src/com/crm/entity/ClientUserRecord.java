package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class ClientUserRecord {//瀹㈡埛銆佺敤鎴风殑璁板綍琛�
	private  Integer Cur_Id;//缂栧彿
	private  String Cur_Title;//璁板綍鏍囬
	private  Integer Cur_ClientId;//瀹㈡埛琛�
	private  Integer Cur_UserId;//鐢ㄦ埛琛�
	private  Integer Cur_ZhuangTai;//鎰忓悜鐘舵�侊紙鎰忓悜涓�佹剰鍚戜腑 涓�鑸�佹剰鍚戜腑 涓己銆佹剰鍚戜腑 寮猴級
	private  Integer Cur_LianXiFangShi;//鑱旂郴鏂瑰紡锛堟潵鐢点�侀偖绠便�佺煭淇°�佹潵璁匡級
	private  String Cur_RecordTime;//璁板綍鏃堕棿
	private  Integer Cur_Remark;//澶囨敞
	private  Integer Cur_Ext1;//棰勭暀瀛楁
	private  String Cur_Ext2;//棰勭暀瀛楁
	
	public Integer getCur_Id() {
		return Cur_Id;
	}
	public void setCur_Id(Integer cur_Id) {
		Cur_Id = cur_Id;
	}
	public String getCur_Title() {
		return Cur_Title;
	}
	public void setCur_Title(String cur_Title) {
		Cur_Title = cur_Title;
	}
	public Integer getCur_ClientId() {
		return Cur_ClientId;
	}
	public void setCur_ClientId(Integer cur_ClientId) {
		Cur_ClientId = cur_ClientId;
	}
	public Integer getCur_UserId() {
		return Cur_UserId;
	}
	public void setCur_UserId(Integer cur_UserId) {
		Cur_UserId = cur_UserId;
	}
	public Integer getCur_ZhuangTai() {
		return Cur_ZhuangTai;
	}
	public void setCur_ZhuangTai(Integer cur_ZhuangTai) {
		Cur_ZhuangTai = cur_ZhuangTai;
	}
	public Integer getCur_LianXiFangShi() {
		return Cur_LianXiFangShi;
	}
	public void setCur_LianXiFangShi(Integer cur_LianXiFangShi) {
		Cur_LianXiFangShi = cur_LianXiFangShi;
	}
	public String getCur_RecordTime() {
		return Cur_RecordTime;
	}
	public void setCur_RecordTime(String cur_RecordTime) {
		Cur_RecordTime = cur_RecordTime;
	}
	public Integer getCur_Remark() {
		return Cur_Remark;
	}
	public void setCur_Remark(Integer cur_Remark) {
		Cur_Remark = cur_Remark;
	}
	public Integer getCur_Ext1() {
		return Cur_Ext1;
	}
	public void setCur_Ext1(Integer cur_Ext1) {
		Cur_Ext1 = cur_Ext1;
	}
	public String getCur_Ext2() {
		return Cur_Ext2;
	}
	public void setCur_Ext2(String cur_Ext2) {
		Cur_Ext2 = cur_Ext2;
	}

	@Override
	public String toString() {
		return "ClientUserRecord [Cur_Id=" + Cur_Id + ", Cur_Title=" + Cur_Title + ", Cur_ClientId=" + Cur_ClientId
				+ ", Cur_UserId=" + Cur_UserId + ", Cur_ZhuangTai=" + Cur_ZhuangTai + ", Cur_LianXiFangShi="
				+ Cur_LianXiFangShi + ", Cur_RecordTime=" + Cur_RecordTime + ", Cur_Remark=" + Cur_Remark
				+ ", Cur_Ext1=" + Cur_Ext1 + ", Cur_Ext2=" + Cur_Ext2
				+ "]";
	}
	
	
	
	
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
