package com.crm.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Clients;
import com.crm.entity.Fenye;
import com.crm.entity.Roles;
import com.crm.entity.UserRoles;
import com.crm.entity.Users;
import com.crm.service.UserRolesService;


@Controller
public class UserRolesController {
	
	@Autowired
	private UserRolesService userRolesService;
	
	
	//查询页面显示
	@RequestMapping(value="/SelectUserRoles",method=RequestMethod.POST)
	@ResponseBody
	public Fenye  SelectClientsUsers(HttpServletRequest s,@RequestParam(value="rows") Integer pageSize,Fenye fenye) {
		fenye.setPageSize(pageSize);;
		fenye.setPage((fenye.getPage()-1)*pageSize);
		Fenye selectClientsUsers = userRolesService.SelectUserRoles(fenye);
		List<Roles> selectRoles = userRolesService.SelectRoles();
		HttpSession  session=s.getSession(true);
		Users usersLoginState = userRolesService.UsersLoginState(fenye);
		session.setAttribute("usersLoginState", usersLoginState);
		session.setAttribute("selectRoles", selectRoles);
		return selectClientsUsers;
		
	}
	//签到
	@RequestMapping(value="/ConsultantLabelsStart",method=RequestMethod.POST)
	@ResponseBody()
	public Integer ConsultantLabelsStart(Integer C_UserId){
		Integer ConsultantLabelsStart = userRolesService.ConsultantLabelsStart(C_UserId);
		return ConsultantLabelsStart;
	}
	//签退
	@RequestMapping(value="/UsersQianTui",method=RequestMethod.POST)
	@ResponseBody()
	public Integer UsersQianTui(HttpServletRequest s,Integer Us_Ida){
		 String Us_Ids=s.getParameter("Us_Id");
			String[] Us_Id = Us_Ids.split(",");
			Integer ConsultantLabelsStart=null;
	        for(int i=0;i<Us_Id.length;i++){
	        	ConsultantLabelsStart = userRolesService.UsersQianTui(Integer.parseInt(Us_Id[i]));
	            
	        }
		
		return ConsultantLabelsStart;
	}
}
