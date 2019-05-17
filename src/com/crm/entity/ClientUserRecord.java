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
	
	
	
	
}
