/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package org.swc.bestpratise.order.web.account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.swc.bestpratise.order.entity.TProject;
import org.swc.bestpratise.order.service.TProjectService;

/**
 * 用户注册的Controller.
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterController {

	@Autowired
	private TProjectService tProjectService;

	@RequestMapping(method = RequestMethod.GET)
	public String registerForm() {
		return "account/register";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String register(RedirectAttributes redirectAttributes) {
		String userId = "201406241237574868672d";
		List<TProject> myEntityList = null;
		try {
			myEntityList = tProjectService.myEntityList(userId);
			for (TProject project : myEntityList) {
				System.out.println(project.getName() + "=========>"
						+ project.getUuid());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		redirectAttributes.addFlashAttribute("myEntityList", myEntityList);
		return "redirect:/login";
	}

	@RequestMapping(value="/actlist")
	public String actlist(RedirectAttributes redirectAttributes) {
//		String userId = "201406241237574868672d";
//		List<TProject> myEntityList = null;
//		try {
//			myEntityList = tProjectService.myEntityList(userId);
//			for (TProject project : myEntityList) {
//				System.out.println(project.getName() + "=========>"
//						+ project.getUuid());
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		redirectAttributes.addFlashAttribute("myEntityList", myEntityList);
		return "/activity/list";
	}

}
