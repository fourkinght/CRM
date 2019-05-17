package com.crm.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.UserRoles;
import com.crm.service.UserRolesService;
@Controller
public class UserRolesController {
	
	@Autowired
	private UserRolesService userRolesService;
	
	@RequestMapping(value="/insertUserRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertUserRoles(UserRoles userRoles){
		Integer insertUserRoles = userRolesService.insertUserRoles(userRoles);
		return insertUserRoles;
	}
	
	@RequestMapping(value="/deleteUserRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteUserRoles(UserRoles userRoles){
		Integer deleteUserRoles = userRolesService.deleteUserRoles(userRoles);
		return deleteUserRoles;
	}
	

}
