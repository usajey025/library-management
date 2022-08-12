package com.nagarro.LibraryManagement.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nagarro.LibraryManagement.model.User;
import com.nagarro.LibraryManagement.services.UserService;

@Controller
public class LibraryController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/home")
	public String home(HttpServletRequest request)
	{
		request.setAttribute("mode", "MODE_HOME");
		return "homepage";
	}
	@RequestMapping("/register")
	public String registration(HttpServletRequest request)
	{
		request.setAttribute("mode", "MODE_REGISTER");
		return "homepage";
	}
	
	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute User user,BindingResult bindingResult,HttpServletRequest request)
	{
		userService.saveMyUser(user);
		request.setAttribute("mode", "MODE_HOME");
		return "homepage";
	}
	@GetMapping("/show-user")
	public String showAllUsers(HttpServletRequest request)
	{
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "homepage";
	}
	@RequestMapping("/delete-user")
	public String delete(@RequestParam int id,HttpServletRequest request) 
	{
		userService.deleteMyUser(id);
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "homepage";
	}
	@RequestMapping("/edit-user")
	public String edit(@RequestParam int id,HttpServletRequest request) 
	{
		userService.deleteMyUser(id);
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "MODE_EDIT");
		return "homepage";
	}
	@RequestMapping("/logout")
	public String login(HttpServletRequest request)
	{
		request.setAttribute("mode", "MODE_LOGIN");
		return "homepage";
	}
	@RequestMapping(path = {"/","/login-user"})
	public String loginUser(@ModelAttribute User user,HttpServletRequest request)
	{
		if(userService.findByUsernameAndPassword(user.getUsername(),user.getPassword())!=null)
		{
			request.setAttribute("mode", "MODE_HOME");
		return "homepage";
		
		}
		else {
			request.setAttribute("error", "invaild Username or Password");
			request.setAttribute("mode","MODE_LOGIN");
			return "homepage";
		}
	}
	

}
