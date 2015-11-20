 package org.swc.bestpratise.order.web;

import java.util.List;

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
@RequestMapping(value = "/table")
public class TTableController {
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
	
	@RequestMapping(value = "/init")
	public String add() {
		
		String target = "jdbc:mysql://localhost:3306/food_order?useUnicode=true&characterEncoding=utf-8";
		String source ="jdbc:mysql://localhost:3306/food_order?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
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
		for(TTable table:tables){
			Object tablk = 0 ;
			try {
				table.setProjectId(project.getId());
				tablk = tTableService.checkSave(table);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			try {
				List<TColumn> columns = tColumnService.getColumns(source, user, password,table.getName());
				for(TColumn column : columns)
				{
					column.setTableId(Integer.parseInt(tablk+""));
					tColumnService.checkSave(column);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "/activity/add-food";
	}
}

								