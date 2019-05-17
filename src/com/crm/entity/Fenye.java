package com.crm.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Fenye {
	//分页参数
	private Integer total;
	private Integer page;
	private Integer pageSize;
	private List<?> rows;
	//多条件搜索参数
	private Clients clients;
	private Users users;
	private String Name;
	private Integer minNumber;//最小值
	private Integer maxNumber;//最大值
	private String minTime;//最小日期
	private String maxTime;//最大日期
	
	
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public Integer getMinNumber() {
		return minNumber;
	}
	public void setMinNumber(Integer minNumber) {
		this.minNumber = minNumber;
	}
	public Integer getMaxNumber() {
		return maxNumber;
	}
	public void setMaxNumber(Integer maxNumber) {
		this.maxNumber = maxNumber;
	}
	public String getMinTime() {
		return minTime;
	}
	public void setMinTime(String minTime) {
		this.minTime = minTime;
	}
	public String getMaxTime() {
		return maxTime;
	}
	public void setMaxTime(String maxTime) {
		this.maxTime = maxTime;
	}
	
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	public Clients getClients() {
		return clients;
	}
	public void setClients(Clients clients) {
		this.clients = clients;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = (page-1)*pageSize;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
