package com.crm.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Clients;
import com.crm.entity.Fenye;
import com.crm.entity.Users;
import com.crm.service.ClientsUsersService;


@Controller
public class ClientsUsersController {
	@Autowired
	private  ClientsUsersService clientsUsersService;
	@Autowired
	private  Clients clients;
	@RequestMapping(value="/SelectClientsUsers",method=RequestMethod.POST)
	@ResponseBody
	public Fenye  SelectClientsUsers(HttpServletRequest s,@RequestParam(value="rows") Integer pageSize,Fenye fenye) {
		fenye.setPageSize(pageSize);;
		fenye.setPage((fenye.getPage()-1)*pageSize);
		Fenye selectClientsUsers = clientsUsersService.SelectClientsUsers(fenye);
		
		HttpSession  session=s.getSession(true);
	
		List<Users> ziXunSHiQianDaoFenLiangOption = clientsUsersService.ZiXunSHiQianDaoFenLiangOption();
		session.setAttribute("ziXunSHiQianDaoFenLiangOption", ziXunSHiQianDaoFenLiangOption);
		return selectClientsUsers;
	}
	//下拉框
		@RequestMapping(value="/selectUsers",method=RequestMethod.POST)
		@ResponseBody
		public List<Users> selectUsers( ) {
			List<Users> selectUsers = clientsUsersService.SelectUsers();
			return selectUsers;
			
		}
	@RequestMapping(value="/SelectUsersRolesClients",method=RequestMethod.POST)
	@ResponseBody
	public Fenye  SelectUsersRolesClients(HttpServletRequest s,@RequestParam(value="rows") Integer pageSize,Fenye fenye) {
		fenye.setPageSize(pageSize);;
		fenye.setPage((fenye.getPage()-1)*pageSize);
		Fenye selectClientsUsers = clientsUsersService.SelectUsersRolesClients(fenye);
		List<Users> selectUsers = clientsUsersService.SelectUsers();
		HttpSession  session=s.getSession(true);
		session.setAttribute("selectUsers", selectUsers);
		return selectClientsUsers;
	}
	@RequestMapping(value="/UsersQianDaoFenLiang",method=RequestMethod.POST)
	@ResponseBody
	public Integer UsersQianDaoFenLiang(HttpServletRequest s, Integer C_Id, String Cs_Id){
			String[] Cs_Idb = Cs_Id.split(",");
			Integer usersQianDaoFenLiang=null;
	        for(int i=0;i<Cs_Idb.length;i++){
	        	clients.setC_Id(C_Id);
	        	clients.setCs_Id(Integer.parseInt(Cs_Idb[i]));
	        	usersQianDaoFenLiang = clientsUsersService.UsersQianDaoFenLiang(clients);
	        }
	       
		return usersQianDaoFenLiang;
	}
	//添加
	@RequestMapping(value="/innsertClient",method=RequestMethod.POST)
	@ResponseBody
	public Integer innsertClient(Clients clients) {
		Integer innserClient = clientsUsersService.innserClient(clients);
		return innserClient;
		
	}
	

}
