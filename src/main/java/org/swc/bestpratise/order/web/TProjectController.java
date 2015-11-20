 package org.swc.bestpratise.order.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.swc.bestpratise.order.entity.TColumn;
import org.swc.bestpratise.order.entity.TDatasource;
import org.swc.bestpratise.order.entity.TProject;
import org.swc.bestpratise.order.entity.TTable;
import org.swc.bestpratise.order.service.ActivityOrderDetailService;
import org.swc.bestpratise.order.service.TColumnService;
import org.swc.bestpratise.order.service.TDatasourceService;
import org.swc.bestpratise.order.service.TProjectService;
import org.swc.bestpratise.order.service.TTableService;
/**
 * 数据库结构比较工具
 * @author jake
 *
 */
@Controller
@RequestMapping(value = "/project")
public class TProjectController {
	@Autowired
	private ActivityOrderDetailService activityOrderDetailService;
	@Autowired
	TTableService tTableService;
	@Autowired
	TColumnService tColumnService;
	@Autowired
	TDatasourceService datasourceService;
	@Autowired
	TProjectService projectService;
	
	@RequestMapping(value = "/compare")
	public String compare() {
		
		String source ="";
		String user = "";
		String password = "";
		TProject project = null;
		try {
			project = projectService.findEntityById(1L);
			long datasourceId = project.getDatasourceId();
			TDatasource datasource = datasourceService.findEntityById(datasourceId);
			source = datasource.getUrl();
			user = datasource.getUsername();
			password = datasource.getPassword();
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		List<TTable> tables = null;
		try {
			tables = tTableService.getTable(source, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String,List<TColumn>> colmap = new HashMap<String,List<TColumn>>();
		for(TTable table:tables){

			try {
				List<TColumn> columns = tColumnService.getColumns(source, user, password,table.getName());
				colmap.put(table.getName(), columns);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/// target
		
		String target ="";
		String targetuser = "";
		String targetpassword = "";
		TProject targetproject = null;
		try {
			targetproject = projectService.findEntityById(2L);
			long datasourceId = targetproject.getDatasourceId();
			TDatasource datasource = datasourceService.findEntityById(datasourceId);
			target = datasource.getUrl();
			targetuser = datasource.getUsername();
			targetpassword = datasource.getPassword();
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		List<TTable> targettables = null;
		try {
			targettables = tTableService.getTable(target, targetuser, targetpassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String,List<TColumn>> targetcolmap = new HashMap<String,List<TColumn>>();
		for(TTable targettable:targettables){

			try {
				List<TColumn> targetcolumns = tColumnService.getColumns(target, targetuser, targetpassword,targettable.getName());
				targetcolmap.put(targettable.getName(), targetcolumns);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/////////////compare
		
		List<TTable> newlist = new ArrayList<TTable>();
		
		for(TTable table:targettables)
		{
			boolean have = false;
			for(TTable tablek:tables)
			{
				if(table.getName().equals(tablek.getName()))
				{
					newlist.add(table);
					tables.remove(tablek);
					
					have = true;
					break;
				}
			}
			if(!have)
			{
				System.out.println("原库缺失表==>"+table.getName());
			}
		}
		
		if(tables.size()> 0)
		{
			for(TTable table:tables)
			{
				System.out.println("原库多表==>"+table.getName());
			}
		}else
		{
				System.out.println("原库和目标库没有差异");
		}
		System.out.println("--------------------------------------------------");
		
		for(int k = 0; k <newlist.size(); k ++)
		{
			TTable tablek = (TTable)newlist.get(k);
			Object name = tablek.getName();
			System.out.println("--------------------"+name+"-----------------------------");
			List<TColumn> targetlist = targetcolmap.get(name);
			List<TColumn> sourcelist = colmap.get(name);
			boolean isequals = false;
			for(int i = 0; i< targetlist.size(); i ++)
			{
				
				TColumn tt = (TColumn)targetlist.get(i);
					String resultk = compare(tt,sourcelist);
					if(resultk != null)
					{
						System.out.println(tablek.getName()+"字段=>"+resultk+"====>"+tt.getName()+" 不一致字段==>");
					}else
					{
//						System.out.println(tablek.getName()+"一致==>"+tt.getName());
					}
					targetlist.remove(tt);
			}
			
			System.out.println("--------------------------------------------------");
			for(TColumn tt : targetlist)
			{
				System.out.println(tablek.getName()+"=>缺失字段==>"+tt.getName());
			}
			
			newlist.remove(tablek);
		}
		

		System.out.println("--------------------------------------------------");

		return "/activity/add-food";
	}
	
	public String compare(TColumn target , List<TColumn> sources)
	{
		String restult = null;
		for(TColumn source :sources )
		{
			restult = source.getName();
			if(source.getName().equals(target.getName()) 
					&& source.getRemark().equals(target.getRemark())
					&& source.getLength()==target.getLength()
					&& source.getTypex().equals(target.getTypex()
							))
			{
				restult =  null;
				break;
			}
		}
		
		return restult;
	}
}

								