package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class ConsultantLabels {//咨询师签到表
	private Integer cls_Id;//编号
	private Integer cls_ConsultantId;//咨询师表
	private Integer cls_State;//签到状态（上班、下班）
	private String cls_StartTime;//签到时间
	private String cls_FinishTime;//签退时间
	private String cls_Remark;//备注
	private Integer cls_Ext1;//预留字段
	private String cls_Ext2;//预留字段
	public Integer getCls_Id() {
		return cls_Id;
	}
	public void setCls_Id(Integer cls_Id) {
		this.cls_Id = cls_Id;
	}
	public Integer getCls_ConsultantId() {
		return cls_ConsultantId;
	}
	public void setCls_ConsultantId(Integer cls_ConsultantId) {
		this.cls_ConsultantId = cls_ConsultantId;
	}
	public Integer getCls_State() {
		return cls_State;
	}
	public void setCls_State(Integer cls_State) {
		this.cls_State = cls_State;
	}
	public String getCls_StartTime() {
		return cls_StartTime;
	}
	public void setCls_StartTime(String cls_StartTime) {
		this.cls_StartTime = cls_StartTime;
	}
	public String getCls_FinishTime() {
		return cls_FinishTime;
	}
	public void setCls_FinishTime(String cls_FinishTime) {
		this.cls_FinishTime = cls_FinishTime;
	}
	public String getCls_Remark() {
		return cls_Remark;
	}
	public void setCls_Remark(String cls_Remark) {
		this.cls_Remark = cls_Remark;
	}
	public Integer getCls_Ext1() {
		return cls_Ext1;
	}
	public void setCls_Ext1(Integer cls_Ext1) {
		this.cls_Ext1 = cls_Ext1;
	}
	public String getCls_Ext2() {
		return cls_Ext2;
	}
	public void setCls_Ext2(String cls_Ext2) {
		this.cls_Ext2 = cls_Ext2;
	}
	@Override
	public String toString() {
		return "ConsultantLabels [cls_Id=" + cls_Id + ", cls_ConsultantId=" + cls_ConsultantId + ", cls_State="
				+ cls_State + ", cls_StartTime=" + cls_StartTime + ", cls_FinishTime=" + cls_FinishTime
				+ ", cls_Remark=" + cls_Remark + ", cls_Ext1=" + cls_Ext1 + ", cls_Ext2=" + cls_Ext2 + "]";
	}
	
	
}
