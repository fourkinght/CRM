package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.dao.RoleModulesMapper;
import com.crm.entity.RoleModules;
import com.crm.entity.Roles;
import com.crm.service.RoleModulesService;
import com.crm.service.RolesService;

@Controller
public class RolesController {
	
	@Resource
	private RolesService rolesService;
	@Resource
	private RoleModulesService roleModulesService;
	
	
	@RequestMapping(value="/selectRolesAll",method=RequestMethod.POST)
	@ResponseBody
	public List<Roles> selectRolesAll(){
		System.out.println();
		List<Roles> selectRolesAll = rolesService.selectRolesAll();
		return selectRolesAll;
	}

	
	@RequestMapping(value="/selectUserRolesById",method=RequestMethod.POST)
	@ResponseBody
	public List<Roles> selectUserRolesById(Integer usersId){
		List<Roles> selectUserRolesById = rolesService.selectUserRolesById(usersId);
		return selectUserRolesById;
	}
	
	@RequestMapping(value="/deleteRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteRoles(Integer rolesId){
		Integer selectRoleModulesByRolesId = roleModulesService.selectRoleModulesByRolesId(rolesId);
		if(selectRoleModulesByRolesId==0) {
			Integer deleteRoles = rolesService.deleteRoles(rolesId);
			return deleteRoles;
		}else {
			return 2;
		}
		
	}
	
	@RequestMapping(value="/insertRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertRoles(Roles roles){
		//根据角色名查询该用户输入的角色名是否存在
		Integer i = rolesService.selectRolesByName(roles.getRs_Name());
		System.out.println(i);
		if(i==0) {
			Integer insertRoles = rolesService.insertRoles(roles);
			return insertRoles;
		}else {
			return 2;
		}
	}
	
	@RequestMapping(value="/updateRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateRoles(Roles roles){
		//根据角色名查询该用户输入的角色名是否存在
		Integer i = rolesService.selectRolesByName(roles.getRs_Name());
		if(i>0) {
			return 2;
		}else {
			Integer updateRoles = rolesService.updateRoles(roles);
			return updateRoles;
		}
	}
	
	
}
