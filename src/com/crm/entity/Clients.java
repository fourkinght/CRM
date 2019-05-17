﻿package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
public class Clients {//客户表 

	private Integer Cs_Id;//客户编号
	private String Cs_Name;//客户姓名
	private String Cs_Img;//客户相片
	private Integer Cs_Sex;//性别
	private Integer Cs_Age;//年龄
	private String Cs_Phone;//电话
	private String Cs_Xueli;//学历
	private String Cs_Email;//邮箱
	private String Cs_QQ;//QQ号
	private String Cs_WeiXin;//微信号
	private String Cs_Source;//客户来源
	private Integer Cs_ClientState;//客户状态(正式、续保、流失)
	private Integer Cs_FenPei;//分配(已分配、未分配)
	private String Cs_SiteSheng;//地址（省）
	private String Cs_SiteShi;//地址（市）
	private String Cs_SiteXian;//地址（县）
	private String Cs_SiteXiangXi;//地址（详细地址）
	private Integer Cs_IsJiaoFei;//是否缴费（已交、未交）
	private Integer Cs_IsHuiFang;//是否回访（已回访、未回访）
	private Integer Cs_IsValid;//是否有效（有效、无效）
	private Integer Cs_IsVisit;//是否上门（是、	否）
	private Integer Cs_IsBaoBei;//是否报备（已报备、未报备）	
	private Integer Cs_IsTuiFen;//是否退费（是、否）
	private String Cs_TuiFenInfo;//退费原因
	private Integer Cs_IsJinBan;//是否进班（是、否）
	private String Cs_HuiFangInfo;//回访情况
	private Integer Cs_Courses;//课程
	private Double Cs_Money;//课程费用
	private String Cs_Grade;//课程打分
	private String Cs_IsValidInfo;//无效原因
	private String Cs_HuiFangTime;//首次回访时间
	private String Cs_VisitTime;//上门时间
	private String Cs_JiaoFeiTime;//缴费时间
	private String Cs_FoundTime;//创建时间
	private String Cs_JinBanTime;//进班时间
	private String Cs_ShenFenZheng;//身份证号
	private String Cs_BirthTime;//出生时间
	private String Cs_ConsultantRemark;//咨询师备注
	private String Cs_Remark;//备注
	private Integer C_Id;//咨询师id
	private Integer Cs_Weight;//客户权重
	private ClientUserRecord clientUserRecord;
	private Users users;
	
	public ClientUserRecord getClientUserRecord() {
		return clientUserRecord;
	}
	public void setClientUserRecord(ClientUserRecord clientUserRecord) {
		this.clientUserRecord = clientUserRecord;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Integer getCs_Weight() {
		return Cs_Weight;
	}
	public void setCs_Weight(Integer cs_Weight) {
		Cs_Weight = cs_Weight;
	}
	public Integer getC_Id() {
		return C_Id;
	}
	public void setC_Id(Integer c_Id) {
		C_Id = c_Id;
	}
	private Integer Cs_Ext1;//预留字段
	private String Cs_Ext2;//预留字段
	public Integer getCs_Id() {
		return Cs_Id;
	}
	public void setCs_Id(Integer cs_Id) {
		Cs_Id = cs_Id;
	}
	public String getCs_Name() {
		return Cs_Name;
	}
	public void setCs_Name(String cs_Name) {
		Cs_Name = cs_Name;
	}
	public String getCs_Img() {
		return Cs_Img;
	}
	public void setCs_Img(String cs_Img) {
		Cs_Img = cs_Img;
	}
	public Integer getCs_Sex() {
		return Cs_Sex;
	}
	public void setCs_Sex(Integer cs_Sex) {
		Cs_Sex = cs_Sex;
	}
	public Integer getCs_Age() {
		return Cs_Age;
	}
	public void setCs_Age(Integer cs_Age) {
		Cs_Age = cs_Age;
	}
	public String getCs_Phone() {
		return Cs_Phone;
	}
	public void setCs_Phone(String cs_Phone) {
		Cs_Phone = cs_Phone;
	}
	public String getCs_Xueli() {
		return Cs_Xueli;
	}
	public void setCs_Xueli(String cs_Xueli) {
		Cs_Xueli = cs_Xueli;
	}
	public String getCs_Email() {
		return Cs_Email;
	}
	public void setCs_Email(String cs_Email) {
		Cs_Email = cs_Email;
	}
	public String getCs_QQ() {
		return Cs_QQ;
	}
	public void setCs_QQ(String cs_QQ) {
		Cs_QQ = cs_QQ;
	}
	public String getCs_WeiXin() {
		return Cs_WeiXin;
	}
	public void setCs_WeiXin(String cs_WeiXin) {
		Cs_WeiXin = cs_WeiXin;
	}
	public String getCs_Source() {
		return Cs_Source;
	}
	public void setCs_Source(String cs_Source) {
		Cs_Source = cs_Source;
	}
	public Integer getCs_ClientState() {
		return Cs_ClientState;
	}
	public void setCs_ClientState(Integer cs_ClientState) {
		Cs_ClientState = cs_ClientState;
	}
	public Integer getCs_FenPei() {
		return Cs_FenPei;
	}
	public void setCs_FenPei(Integer cs_FenPei) {
		Cs_FenPei = cs_FenPei;
	}
	public String getCs_SiteSheng() {
		return Cs_SiteSheng;
	}
	public void setCs_SiteSheng(String cs_SiteSheng) {
		Cs_SiteSheng = cs_SiteSheng;
	}
	public String getCs_SiteShi() {
		return Cs_SiteShi;
	}
	public void setCs_SiteShi(String cs_SiteShi) {
		Cs_SiteShi = cs_SiteShi;
	}
	public String getCs_SiteXian() {
		return Cs_SiteXian;
	}
	public void setCs_SiteXian(String cs_SiteXian) {
		Cs_SiteXian = cs_SiteXian;
	}
	public String getCs_SiteXiangXi() {
		return Cs_SiteXiangXi;
	}
	public void setCs_SiteXiangXi(String cs_SiteXiangXi) {
		Cs_SiteXiangXi = cs_SiteXiangXi;
	}
	public Integer getCs_IsJiaoFei() {
		return Cs_IsJiaoFei;
	}
	public void setCs_IsJiaoFei(Integer cs_IsJiaoFei) {
		Cs_IsJiaoFei = cs_IsJiaoFei;
	}
	public Integer getCs_IsHuiFang() {
		return Cs_IsHuiFang;
	}
	public void setCs_IsHuiFang(Integer cs_IsHuiFang) {
		Cs_IsHuiFang = cs_IsHuiFang;
	}
	public Integer getCs_IsValid() {
		return Cs_IsValid;
	}
	public void setCs_IsValid(Integer cs_IsValid) {
		Cs_IsValid = cs_IsValid;
	}
	public Integer getCs_IsVisit() {
		return Cs_IsVisit;
	}
	public void setCs_IsVisit(Integer cs_IsVisit) {
		Cs_IsVisit = cs_IsVisit;
	}
	public Integer getCs_IsBaoBei() {
		return Cs_IsBaoBei;
	}
	public void setCs_IsBaoBei(Integer cs_IsBaoBei) {
		Cs_IsBaoBei = cs_IsBaoBei;
	}
	public Integer getCs_IsTuiFen() {
		return Cs_IsTuiFen;
	}
	public void setCs_IsTuiFen(Integer cs_IsTuiFen) {
		Cs_IsTuiFen = cs_IsTuiFen;
	}
	public String getCs_TuiFenInfo() {
		return Cs_TuiFenInfo;
	}
	public void setCs_TuiFenInfo(String cs_TuiFenInfo) {
		Cs_TuiFenInfo = cs_TuiFenInfo;
	}
	public Integer getCs_IsJinBan() {
		return Cs_IsJinBan;
	}
	public void setCs_IsJinBan(Integer cs_IsJinBan) {
		Cs_IsJinBan = cs_IsJinBan;
	}
	public String getCs_HuiFangInfo() {
		return Cs_HuiFangInfo;
	}
	public void setCs_HuiFangInfo(String cs_HuiFangInfo) {
		Cs_HuiFangInfo = cs_HuiFangInfo;
	}
	public Integer getCs_Courses() {
		return Cs_Courses;
	}
	public void setCs_Courses(Integer cs_Courses) {
		Cs_Courses = cs_Courses;
	}
	public Double getCs_Money() {
		return Cs_Money;
	}
	public void setCs_Money(Double cs_Money) {
		Cs_Money = cs_Money;
	}
	public String getCs_Grade() {
		return Cs_Grade;
	}
	public void setCs_Grade(String cs_Grade) {
		Cs_Grade = cs_Grade;
	}
	public String getCs_IsValidInfo() {
		return Cs_IsValidInfo;
	}
	public void setCs_IsValidInfo(String cs_IsValidInfo) {
		Cs_IsValidInfo = cs_IsValidInfo;
	}
	public String getCs_HuiFangTime() {
		return Cs_HuiFangTime;
	}
	public void setCs_HuiFangTime(String cs_HuiFangTime) {
		Cs_HuiFangTime = cs_HuiFangTime;
	}
	public String getCs_VisitTime() {
		return Cs_VisitTime;
	}
	public void setCs_VisitTime(String cs_VisitTime) {
		Cs_VisitTime = cs_VisitTime;
	}
	public String getCs_JiaoFeiTime() {
		return Cs_JiaoFeiTime;
	}
	public void setCs_JiaoFeiTime(String cs_JiaoFeiTime) {
		Cs_JiaoFeiTime = cs_JiaoFeiTime;
	}
	public String getCs_FoundTime() {
		return Cs_FoundTime;
	}
	public void setCs_FoundTime(String cs_FoundTime) {
		Cs_FoundTime = cs_FoundTime;
	}
	public String getCs_JinBanTime() {
		return Cs_JinBanTime;
	}
	public void setCs_JinBanTime(String cs_JinBanTime) {
		Cs_JinBanTime = cs_JinBanTime;
	}
	public String getCs_ShenFenZheng() {
		return Cs_ShenFenZheng;
	}
	public void setCs_ShenFenZheng(String cs_ShenFenZheng) {
		Cs_ShenFenZheng = cs_ShenFenZheng;
	}
	public String getCs_BirthTime() {
		return Cs_BirthTime;
	}
	public void setCs_BirthTime(String cs_BirthTime) {
		Cs_BirthTime = cs_BirthTime;
	}
	public String getCs_ConsultantRemark() {
		return Cs_ConsultantRemark;
	}
	public void setCs_ConsultantRemark(String cs_ConsultantRemark) {
		Cs_ConsultantRemark = cs_ConsultantRemark;
	}
	public String getCs_Remark() {
		return Cs_Remark;
	}
	public void setCs_Remark(String cs_Remark) {
		Cs_Remark = cs_Remark;
	}
	public Integer getCs_Ext1() {
		return Cs_Ext1;
	}
	public void setCs_Ext1(Integer cs_Ext1) {
		Cs_Ext1 = cs_Ext1;
	}
	public String getCs_Ext2() {
		return Cs_Ext2;
	}
	public void setCs_Ext2(String cs_Ext2) {
		Cs_Ext2 = cs_Ext2;
	}
	@Override
	public String toString() {
		return "Clients [Cs_Id=" + Cs_Id + ", Cs_Name=" + Cs_Name + ", Cs_Img=" + Cs_Img + ", Cs_Sex=" + Cs_Sex
				+ ", Cs_Age=" + Cs_Age + ", Cs_Phone=" + Cs_Phone + ", Cs_Xueli=" + Cs_Xueli + ", Cs_Email=" + Cs_Email
				+ ", Cs_QQ=" + Cs_QQ + ", Cs_WeiXin=" + Cs_WeiXin + ", Cs_Source=" + Cs_Source + ", Cs_ClientState="
				+ Cs_ClientState + ", Cs_FenPei=" + Cs_FenPei + ", Cs_SiteSheng=" + Cs_SiteSheng + ", Cs_SiteShi="
				+ Cs_SiteShi + ", Cs_SiteXian=" + Cs_SiteXian + ", Cs_SiteXiangXi=" + Cs_SiteXiangXi + ", Cs_IsJiaoFei="
				+ Cs_IsJiaoFei + ", Cs_IsHuiFang=" + Cs_IsHuiFang + ", Cs_IsValid=" + Cs_IsValid + ", Cs_IsVisit="
				+ Cs_IsVisit + ", Cs_IsBaoBei=" + Cs_IsBaoBei + ", Cs_IsTuiFen=" + Cs_IsTuiFen + ", Cs_TuiFenInfo="
				+ Cs_TuiFenInfo + ", Cs_IsJinBan=" + Cs_IsJinBan + ", Cs_HuiFangInfo=" + Cs_HuiFangInfo
				+ ", Cs_Courses=" + Cs_Courses + ", Cs_Money=" + Cs_Money + ", Cs_Grade=" + Cs_Grade
				+ ", Cs_IsValidInfo=" + Cs_IsValidInfo + ", Cs_HuiFangTime=" + Cs_HuiFangTime + ", Cs_VisitTime="
				+ Cs_VisitTime + ", Cs_JiaoFeiTime=" + Cs_JiaoFeiTime + ", Cs_FoundTime=" + Cs_FoundTime
				+ ", Cs_JinBanTime=" + Cs_JinBanTime + ", Cs_ShenFenZheng=" + Cs_ShenFenZheng + ", Cs_BirthTime="
				+ Cs_BirthTime + ", Cs_ConsultantRemark=" + Cs_ConsultantRemark + ", Cs_Remark=" + Cs_Remark + ", C_Id="
				+ C_Id + ", Cs_Weight=" + Cs_Weight + ", Cs_Ext1=" + Cs_Ext1 + ", Cs_Ext2=" + Cs_Ext2 + "]";
	}
	
	

	private Integer cs_Id;//客户编号
	private String cs_Name;//客户姓名
	private String cs_Img;//客户相片
	private Integer cs_Sex;//性别
	private Integer cs_Age;//年龄
	private String cs_Phone;//电话
	private String cs_Xueli;//学历
	private String cs_Email;//邮箱
	private String cs_QQ;//QQ号
	private String cs_WeiXin;//微信号
	private String cs_Source;//客户来源
	private Integer cs_ClientState;//客户状态(正式、续保、流失)
	private Integer cs_FenPei;//分配(已分配、未分配)
	private String cs_SiteSheng;//地址（省）
	private String cs_SiteShi;//地址（市）
	private String cs_SiteXian;//地址（县）
	private String cs_SiteXiangXi;//地址（详细地址）
	private Integer cs_IsJiaoFei;//是否缴费（已交、未交）
	private Integer cs_IsHuiFang;//是否回访（已回访、未回访）
	private Integer cs_IsValid;//是否有效（有效、无效）
	private Integer cs_IsVisit;//是否上门（是、	否）
	private Integer cs_IsBaoBei;//是否报备（已报备、未报备）	
	private Integer cs_IsTuiFen;//是否退费（是、否）
	private String cs_TuiFenInfo;//退费原因
	private Integer cs_IsJinBan;//是否进班（是、否）
	private String cs_HuiFangInfo;//回访情况
	private Integer cs_Courses;//课程
	private Double cs_Money;//课程费用
	private String cs_Grade;//课程打分
	private String cs_IsValidInfo;//无效原因
	private String cs_HuiFangTime;//首次回访时间
	private String cs_VisitTime;//上门时间
	private String cs_JiaoFeiTime;//缴费时间
	private String cs_FoundTime;//创建时间
	private String cs_JinBanTime;//进班时间
	private String cs_ShenFenZheng;//身份证号
	private String cs_BirthTime;//出生时间
	private String cs_ConsultantRemark;//咨询师备注
	private String cs_Remark;//备注
	private Integer cs_ConsultantId;//咨询师id
	private Integer cs_Weight;//客户权重
	private Integer cs_Ext1;//预留字段
	private String cs_Ext2;//预留字段
	public Integer getCs_Id() {
		return cs_Id;
	}
	public void setCs_Id(Integer cs_Id) {
		this.cs_Id = cs_Id;
	}
	public String getCs_Name() {
		return cs_Name;
	}
	public void setCs_Name(String cs_Name) {
		this.cs_Name = cs_Name;
	}
	public String getCs_Img() {
		return cs_Img;
	}
	public void setCs_Img(String cs_Img) {
		this.cs_Img = cs_Img;
	}
	public Integer getCs_Sex() {
		return cs_Sex;
	}
	public void setCs_Sex(Integer cs_Sex) {
		this.cs_Sex = cs_Sex;
	}
	public Integer getCs_Age() {
		return cs_Age;
	}
	public void setCs_Age(Integer cs_Age) {
		this.cs_Age = cs_Age;
	}
	public String getCs_Phone() {
		return cs_Phone;
	}
	public void setCs_Phone(String cs_Phone) {
		this.cs_Phone = cs_Phone;
	}
	public String getCs_Xueli() {
		return cs_Xueli;
	}
	public void setCs_Xueli(String cs_Xueli) {
		this.cs_Xueli = cs_Xueli;
	}
	public String getCs_Email() {
		return cs_Email;
	}
	public void setCs_Email(String cs_Email) {
		this.cs_Email = cs_Email;
	}
	public String getCs_QQ() {
		return cs_QQ;
	}
	public void setCs_QQ(String cs_QQ) {
		this.cs_QQ = cs_QQ;
	}
	public String getCs_WeiXin() {
		return cs_WeiXin;
	}
	public void setCs_WeiXin(String cs_WeiXin) {
		this.cs_WeiXin = cs_WeiXin;
	}
	public String getCs_Source() {
		return cs_Source;
	}
	public void setCs_Source(String cs_Source) {
		this.cs_Source = cs_Source;
	}
	public Integer getCs_ClientState() {
		return cs_ClientState;
	}
	public void setCs_ClientState(Integer cs_ClientState) {
		this.cs_ClientState = cs_ClientState;
	}
	public Integer getCs_FenPei() {
		return cs_FenPei;
	}
	public void setCs_FenPei(Integer cs_FenPei) {
		this.cs_FenPei = cs_FenPei;
	}
	public String getCs_SiteSheng() {
		return cs_SiteSheng;
	}
	public void setCs_SiteSheng(String cs_SiteSheng) {
		this.cs_SiteSheng = cs_SiteSheng;
	}
	public String getCs_SiteShi() {
		return cs_SiteShi;
	}
	public void setCs_SiteShi(String cs_SiteShi) {
		this.cs_SiteShi = cs_SiteShi;
	}
	public String getCs_SiteXian() {
		return cs_SiteXian;
	}
	public void setCs_SiteXian(String cs_SiteXian) {
		this.cs_SiteXian = cs_SiteXian;
	}
	public String getCs_SiteXiangXi() {
		return cs_SiteXiangXi;
	}
	public void setCs_SiteXiangXi(String cs_SiteXiangXi) {
		this.cs_SiteXiangXi = cs_SiteXiangXi;
	}
	public Integer getCs_IsJiaoFei() {
		return cs_IsJiaoFei;
	}
	public void setCs_IsJiaoFei(Integer cs_IsJiaoFei) {
		this.cs_IsJiaoFei = cs_IsJiaoFei;
	}
	public Integer getCs_IsHuiFang() {
		return cs_IsHuiFang;
	}
	public void setCs_IsHuiFang(Integer cs_IsHuiFang) {
		this.cs_IsHuiFang = cs_IsHuiFang;
	}
	public Integer getCs_IsValid() {
		return cs_IsValid;
	}
	public void setCs_IsValid(Integer cs_IsValid) {
		this.cs_IsValid = cs_IsValid;
	}
	public Integer getCs_IsVisit() {
		return cs_IsVisit;
	}
	public void setCs_IsVisit(Integer cs_IsVisit) {
		this.cs_IsVisit = cs_IsVisit;
	}
	public Integer getCs_IsBaoBei() {
		return cs_IsBaoBei;
	}
	public void setCs_IsBaoBei(Integer cs_IsBaoBei) {
		this.cs_IsBaoBei = cs_IsBaoBei;
	}
	public Integer getCs_IsTuiFen() {
		return cs_IsTuiFen;
	}
	public void setCs_IsTuiFen(Integer cs_IsTuiFen) {
		this.cs_IsTuiFen = cs_IsTuiFen;
	}
	public String getCs_TuiFenInfo() {
		return cs_TuiFenInfo;
	}
	public void setCs_TuiFenInfo(String cs_TuiFenInfo) {
		this.cs_TuiFenInfo = cs_TuiFenInfo;
	}
	public Integer getCs_IsJinBan() {
		return cs_IsJinBan;
	}
	public void setCs_IsJinBan(Integer cs_IsJinBan) {
		this.cs_IsJinBan = cs_IsJinBan;
	}
	public String getCs_HuiFangInfo() {
		return cs_HuiFangInfo;
	}
	public void setCs_HuiFangInfo(String cs_HuiFangInfo) {
		this.cs_HuiFangInfo = cs_HuiFangInfo;
	}
	public Integer getCs_Courses() {
		return cs_Courses;
	}
	public void setCs_Courses(Integer cs_Courses) {
		this.cs_Courses = cs_Courses;
	}
	public Double getCs_Money() {
		return cs_Money;
	}
	public void setCs_Money(Double cs_Money) {
		this.cs_Money = cs_Money;
	}
	public String getCs_Grade() {
		return cs_Grade;
	}
	public void setCs_Grade(String cs_Grade) {
		this.cs_Grade = cs_Grade;
	}
	public String getCs_IsValidInfo() {
		return cs_IsValidInfo;
	}
	public void setCs_IsValidInfo(String cs_IsValidInfo) {
		this.cs_IsValidInfo = cs_IsValidInfo;
	}
	public String getCs_HuiFangTime() {
		return cs_HuiFangTime;
	}
	public void setCs_HuiFangTime(String cs_HuiFangTime) {
		this.cs_HuiFangTime = cs_HuiFangTime;
	}
	public String getCs_VisitTime() {
		return cs_VisitTime;
	}
	public void setCs_VisitTime(String cs_VisitTime) {
		this.cs_VisitTime = cs_VisitTime;
	}
	public String getCs_JiaoFeiTime() {
		return cs_JiaoFeiTime;
	}
	public void setCs_JiaoFeiTime(String cs_JiaoFeiTime) {
		this.cs_JiaoFeiTime = cs_JiaoFeiTime;
	}
	public String getCs_FoundTime() {
		return cs_FoundTime;
	}
	public void setCs_FoundTime(String cs_FoundTime) {
		this.cs_FoundTime = cs_FoundTime;
	}
	public String getCs_JinBanTime() {
		return cs_JinBanTime;
	}
	public void setCs_JinBanTime(String cs_JinBanTime) {
		this.cs_JinBanTime = cs_JinBanTime;
	}
	public String getCs_ShenFenZheng() {
		return cs_ShenFenZheng;
	}
	public void setCs_ShenFenZheng(String cs_ShenFenZheng) {
		this.cs_ShenFenZheng = cs_ShenFenZheng;
	}
	public String getCs_BirthTime() {
		return cs_BirthTime;
	}
	public void setCs_BirthTime(String cs_BirthTime) {
		this.cs_BirthTime = cs_BirthTime;
	}
	public String getCs_ConsultantRemark() {
		return cs_ConsultantRemark;
	}
	public void setCs_ConsultantRemark(String cs_ConsultantRemark) {
		this.cs_ConsultantRemark = cs_ConsultantRemark;
	}
	public String getCs_Remark() {
		return cs_Remark;
	}
	public void setCs_Remark(String cs_Remark) {
		this.cs_Remark = cs_Remark;
	}
	public Integer getCs_ConsultantId() {
		return cs_ConsultantId;
	}
	public void setCs_ConsultantId(Integer cs_ConsultantId) {
		this.cs_ConsultantId = cs_ConsultantId;
	}
	public Integer getCs_Weight() {
		return cs_Weight;
	}
	public void setCs_Weight(Integer cs_Weight) {
		this.cs_Weight = cs_Weight;
	}
	public Integer getCs_Ext1() {
		return cs_Ext1;
	}
	public void setCs_Ext1(Integer cs_Ext1) {
		this.cs_Ext1 = cs_Ext1;
	}
	public String getCs_Ext2() {
		return cs_Ext2;
	}
	public void setCs_Ext2(String cs_Ext2) {
		this.cs_Ext2 = cs_Ext2;
	}
	@Override
	public String toString() {
		return "Clients [cs_Id=" + cs_Id + ", cs_Name=" + cs_Name + ", cs_Img=" + cs_Img + ", cs_Sex=" + cs_Sex
				+ ", cs_Age=" + cs_Age + ", cs_Phone=" + cs_Phone + ", cs_Xueli=" + cs_Xueli + ", cs_Email=" + cs_Email
				+ ", cs_QQ=" + cs_QQ + ", cs_WeiXin=" + cs_WeiXin + ", cs_Source=" + cs_Source + ", cs_ClientState="
				+ cs_ClientState + ", cs_FenPei=" + cs_FenPei + ", cs_SiteSheng=" + cs_SiteSheng + ", cs_SiteShi="
				+ cs_SiteShi + ", cs_SiteXian=" + cs_SiteXian + ", cs_SiteXiangXi=" + cs_SiteXiangXi + ", cs_IsJiaoFei="
				+ cs_IsJiaoFei + ", cs_IsHuiFang=" + cs_IsHuiFang + ", cs_IsValid=" + cs_IsValid + ", cs_IsVisit="
				+ cs_IsVisit + ", cs_IsBaoBei=" + cs_IsBaoBei + ", cs_IsTuiFen=" + cs_IsTuiFen + ", cs_TuiFenInfo="
				+ cs_TuiFenInfo + ", cs_IsJinBan=" + cs_IsJinBan + ", cs_HuiFangInfo=" + cs_HuiFangInfo
				+ ", cs_Courses=" + cs_Courses + ", cs_Money=" + cs_Money + ", cs_Grade=" + cs_Grade
				+ ", cs_IsValidInfo=" + cs_IsValidInfo + ", cs_HuiFangTime=" + cs_HuiFangTime + ", cs_VisitTime="
				+ cs_VisitTime + ", cs_JiaoFeiTime=" + cs_JiaoFeiTime + ", cs_FoundTime=" + cs_FoundTime
				+ ", cs_JinBanTime=" + cs_JinBanTime + ", cs_ShenFenZheng=" + cs_ShenFenZheng + ", cs_BirthTime="
				+ cs_BirthTime + ", cs_ConsultantRemark=" + cs_ConsultantRemark + ", cs_Remark=" + cs_Remark
				+ ", cs_ConsultantId=" + cs_ConsultantId + ", cs_Weight=" + cs_Weight + ", cs_Ext1=" + cs_Ext1
				+ ", cs_Ext2=" + cs_Ext2 + "]";
	}
	
	
}
