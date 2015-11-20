package org.swc.bestpratise.order.web;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.swc.bestpratise.order.entity.Activity;
import org.swc.bestpratise.order.service.ActivityService;
/**
 * 活动
 * @author jake
 *
 */
@Controller
@RequestMapping(value = "/activity")
public class ActivityController {
	
	@Autowired
	private ActivityService activityService;
	
	@RequestMapping(value = "/add")
	public String add(RedirectAttributes redirectAttributes,Activity entity) {
		

		return "/activity/add";
	}
	
	@RequestMapping(value = "/save")
	public String save(RedirectAttributes redirectAttributes,Activity entity) {
		entity.setPlaceName("半亩园");
		entity.setTitle(new Date().toLocaleString()+"-"+entity.getPlaceName());
		entity.setCreater("");
		entity.setCreateTime(new Date());
		entity.setUuid(getUUID());
		try {
			Object idx = activityService.saveEntity(entity);
			
			System.out.println("id======>"+idx);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:list";
	}

	private String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	@RequestMapping(value = "/list")
	public String list(RedirectAttributes redirectAttributes,Model model) {
		
		try {
			String[] keyName = new String[]{};
			String[] operate= new String[]{};
			Object[] keyValue= new Object[]{};
			
			String[] orderby= new String[]{"id"};
			String[] pattern= new String[]{"desc"};
			
			List<Activity> findEntityList = activityService.findEntityList(keyName, operate, keyValue,orderby, pattern,100, 1);
			
			model.addAttribute("allactivity", findEntityList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/activity/list";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("id") Long id) {
		
		try {
			
			boolean deleteEntityById = activityService.deleteEntityById(id);			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:list";
	}

}