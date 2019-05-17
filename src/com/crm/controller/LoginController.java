package com.crm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.crm.entity.Users;
import com.crm.service.UsersService;
import com.crm.util.MD5Util;
import com.crm.util.RandomValidateCode;

@Controller
public class LoginController {

	@Resource
	private UsersService usersService;
	@Autowired
	private Users users;

	// 获取生成验证码
    @RequestMapping(value="/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");
        
        // 设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            // 输出图片方法
            randomValidateCode.getRandcode(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //
	@RequestMapping(value = "/selectUserRolesLogin", method = RequestMethod.POST)
	public String selectUserRolesLogin(Model model,String us_LoginName, String us_PassWord,String yanzheng,HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {
		//转换提日期输出格式     获取当前时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//获取随机产生的验证码
		String verificationCode = (String)session.getAttribute("randomcode_key");
		//把用户输入的用户名存到users中
		users.setUs_LoginName(us_LoginName);
		// 把用户输入的密码用MD5加密
		String pwd = MD5Util.getPwd(us_PassWord); 
		if(yanzheng!=""&&yanzheng!=null) {//判断验证码是否为空
			if(us_LoginName!=""&&us_LoginName!=null){//判断用户名是否为空
				if(us_PassWord!=""&&us_PassWord!=null){//判断密码是否为空
					//查询用户名是否存在
					Users selectUsersLogin = usersService.selectUsersLogin(users);
					//判断验证码是否正确
					if(verificationCode.toLowerCase().equals(yanzheng.toLowerCase())==true) {
						//判断用户名是否跟查询到的数据用户名一样
						 if(selectUsersLogin!=null) {  
							//判定是否锁定
							if(selectUsersLogin.getUs_IsLockout() != 1) {
								//判断密码是否正确
		                    	if(selectUsersLogin.getUs_PassWord().equals(pwd)) {
			                    		model.addAttribute("msg","登陆成功");
				                    	//记录最后一次登录时间,密码错误次数为0,
				                    	users.setUs_LastLoginTime(dateFormat.format(date));
				                    	users.setUs_PsdWrongNum(0);
				                    	users.setUs_Id(selectUsersLogin.getUs_Id());
				                    	usersService.updateUsers(users);
				                    	//request.setAttribute("selectUserRolesByName", selectUserRolesByName);
				                    	request.getSession().setAttribute("usersName", selectUsersLogin.getUs_LoginName());
				                    	request.getSession().setAttribute("usersId", selectUsersLogin.getUs_Id());
				                    	
				                    	return "index"; 
		                    	}else{
									   if(selectUsersLogin.getUs_PsdWrongNum()>=3) {//判断密码错误次数
										   //if(selectUsersLogin.getRs_Name().equals("管理员")==false) {
											   //密码错误次数太多进行锁定,记录时间
											   users.setUs_IsLockout(1);	
											   users.setUs_LockTime(dateFormat.format(date));
											   users.setUs_Id(selectUsersLogin.getUs_Id());
											   usersService.updateUsers(users);
										   //}else {
											   //model.addAttribute("msg","密码错误！");
										   //}
									   }else {
										   //记录密码错误次数
										   users.setUs_PsdWrongNum(selectUsersLogin.getUs_PsdWrongNum()+1);
										   users.setUs_Id(selectUsersLogin.getUs_Id());
										   usersService.updateUsers(users);
										   model.addAttribute("msg","密码错误！");
									   }
								}}else {
									model.addAttribute("msg","该用户已经锁定，请联系管理员！");
								}
							}else {
								model.addAttribute("msg","用户名不存在");
							}
						}else {
							model.addAttribute("msg","验证码不正确");
						}
					}else{
						 model.addAttribute("msg","请输入密码");
					}
				}else{
					 model.addAttribute("msg","请输入账号");
				}
			}else {
				model.addAttribute("msg","请输入验证码");
			}
		return "login";
	}
}

