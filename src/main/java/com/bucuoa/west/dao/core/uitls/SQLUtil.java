package com.bucuoa.west.dao.core.uitls;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

//import jdbc.po.TProject;

import com.bucuoa.west.dao.core.ExcetueManager;
import com.bucuoa.west.dao.extend.annotations.Column;
import com.bucuoa.west.dao.extend.annotations.Id;

public class SQLUtil {

	public SQLUtil() {
	}

/*	public static void main(String[] args) {
		// test();
		// for(int i = 0 ;i < 100; i ++)
//		 testInsert();
		
		  try {
			selectSql(TProject.class,new  String[]{"id","name","create_date"},new String[]{"="," like ",">"},new String[]{"1","'%wu'","'2015-1-1'"});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


//		testJdbc();
	}

	private static void testJdbc() {
		TProject queryOne = JdbcBase.queryOne("select * from t_project", TProject.class);
		System.out.println(queryOne.getName());
		System.out.println(queryOne.getCreateDate());
		System.out.println(queryOne.getCaseUuid());
		System.out.println("------------select one-----------------");

		List<TProject> queryList = JdbcBase.queryList("select * from t_project", TProject.class);
		for (TProject pro : queryList) {
			System.out.println(pro.getName());
			System.out.println(pro.getCreateDate());
			System.out.println(pro.getCaseUuid());

		}
		System.out.println("------------select all---" + queryList.size()+ "--------------");
	}

	
	  private static void testInsert() {
		  
	  TProject project = new TProject();
	  project.setCaseUuid(UUID.randomUUID().toString());
	  project.setCode("2015-10202"); project.setCreateDate(new Date());
	  project.setCreaterId(""); 
	  project.setDone("");
	  project.setName("中国第一项目"+new Random().nextLong());
	  project.setTenantId(12);
	  
	  long start = System.currentTimeMillis();
	  
	  try { 
		  insertSql(project);  
//		  ?JdbcBase.autoInsert("t_project",project); 
		  String insertSql = insertSql(project);
	  
		  long start2 = System.currentTimeMillis();
//		  JdbcBase.executeUpdateSql(insertSql);
		  
		  long end2 =  System.currentTimeMillis();
		  System.out.println("insert jdbc use : "+(end2-start2)+"ms"); //
		  updateSql(project); // // 
		  selectSql(TProject.class,new  String[]{"id","name"},new String[]{"=","like"},new String[]{"1","wu"});
		  // insertSql(project); // // updateSql(project); // //
		  insertSql(project); // // updateSql(project); 
	  }
	  catch
	  (Exception e) 
	  {
		  e.printStackTrace(); 
	  }
	  long end = System.currentTimeMillis();
	  
	  System.out.println("create insert sql use : "+(end-start)+"ms"); }
	  
	  private static void test() { TProject project = new TProject();
	  project.setCaseUuid(UUID.randomUUID().toString());
	  project.setCode("2015-10202"); project.setCreateDate(new Date());
	  project.setCreaterId(""); project.setDone(""); project.setName("中国第一项目");
	  
	  long start = System.currentTimeMillis();
	  
	  try {
		  insertSql(project);
	  
		  updateSql(project);
	  
		  selectSql(TProject.class,new String[]{"id","name"},new  String[]{"="," like "},new String[]{"1","%wu%"}); // insertSql(project); //
	  // updateSql(project); // // insertSql(project); // //
		  updateSql(project); 
	  }
	  catch (Exception e) {
	  e.printStackTrace(); } 
	  long end = System.currentTimeMillis();
	  
	  System.out.println("create insert sql use : "+(end-start)+"ms");
	  }*/
	 

	public static <T> String insertSql(T t) throws Exception {

		Class<? extends Object> class1 = t.getClass();
		long start = System.currentTimeMillis();
		String tableName = AnnoationUtil.getTablename(class1);
		long end = System.currentTimeMillis();
		System.out.println("get tablename use : " + (end - start) + "ms");

		StringBuffer sql = new StringBuffer();
		StringBuffer param = new StringBuffer();
		StringBuffer values = new StringBuffer();
		sql.append("insert into ").append(tableName).append(" (");

		try {
			long start2 = System.currentTimeMillis();
			Field[] fields = class1.getDeclaredFields();
			for (Field field : fields) {
				String key = field.getName();

				PropertyDescriptor pd = new PropertyDescriptor(key, class1);
				Method getMethod = pd.getReadMethod();
				Object value = getMethod.invoke(t);

				Column coumn = (Column) field.getAnnotation(Column.class);

				if (value == null) // 属性的值为null equals比较会抛异常
				{
					continue;
				}

				if (!field.isAnnotationPresent(Id.class)) {

					param.append(coumn.name()).append(",");

					if (value instanceof Integer || value instanceof Double || value instanceof Long) {
						values.append("").append(value).append(",");
					} else if (value instanceof Date) {
						values.append("'")
								.append(((Date) value).toLocaleString())
								.append("',");
					} else {
						values.append("'").append(value).append("',");
					}
				}
			}

			long end2 = System.currentTimeMillis();

			System.out.println("get propertylist use : " + (end2 - start2)
					+ "ms");
			String paramk = param.toString().substring(0,
					param.toString().lastIndexOf(","));
			String valuek = values.toString().substring(0,
					values.toString().lastIndexOf(","));
			sql.append(paramk).append(") values ( ").append(valuek)
					.append(" )");

			System.out.println(sql.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sql.toString();

	}
	
	public static <T> String selectSql(Class<T> class1, String[] filedk,
			String[] wheres, Object[] valuek,int pageSize, int pageNo)
			throws Exception {

		// Class<? extends Object> class1 = t.getClass();
		long start = System.currentTimeMillis();
		String tableName = AnnoationUtil.getTablename(class1);

		StringBuffer sql = new StringBuffer();

		sql.append("select * from ").append(tableName).append(" where ");
		for (int i = 0; i < wheres.length; i++) {
			String where = wheres[i];
			String filed = filedk[i];
			Object value = valuek[i];
			if (i != 0) {
				sql.append(" and ");
			}
//			if (where.indexOf("like") != -1) {
//				sql.append(" ").append(filed).append(" ").append(where)
//						.append(" '").append(value).append("'");
//			} else 
//			{
				sql.append(" ").append(filed).append(where).append(value);
//			}

		}
		int pstart = (pageNo - 1) * pageSize;
		int pend = pageNo;
		sql.append(" limit ").append(pstart).append(",").append(pend);
		long end = System.currentTimeMillis();
		System.out.println("select sql use : " + (end - start) + "ms");
		System.out.println("select sql ==> : " + sql.toString());

		return sql.toString();
	}
	
	public static <T> String selectSql(Class<T> class1, String[] filedk,
			String[] wheres, Object[] valuek)
			throws Exception {

		// Class<? extends Object> class1 = t.getClass();
		long start = System.currentTimeMillis();
		String tableName = AnnoationUtil.getTablename(class1);

		StringBuffer sql = new StringBuffer();

		sql.append("select * from ").append(tableName);
		if(filedk != null && filedk.length > 0)
		{
			sql.append(" where ");
			for (int i = 0; i < wheres.length; i++) {
				String where = wheres[i];
				String filed = filedk[i];
				Object value = valuek[i];
				if (i != 0) {
					sql.append(" and ");
				}
	//			if (where.indexOf("like") != -1) {
	//				sql.append(" ").append(filed).append(" ").append(where)
	//						.append(" '").append(value).append("'");
	//			} else 
	//			{
					sql.append(" ").append(filed).append(where).append(value);
	//			}
	
			}
		}

		long end = System.currentTimeMillis();
		System.out.println("select sql use : " + (end - start) + "ms");
		System.out.println("select sql ==> : " + sql.toString());

		return sql.toString();
	}
	
	public static <T> String selectSql(Class<T> class1, String[] filedk,
			String[] wheres, Object[] valuek,String[] orderby,String[] patterns)
			throws Exception {

		// Class<? extends Object> class1 = t.getClass();
		long start = System.currentTimeMillis();
		String tableName = AnnoationUtil.getTablename(class1);

		StringBuffer sql = new StringBuffer();

		sql.append("select * from ").append(tableName);
		if(filedk != null && filedk.length > 0)
		{
			sql.append(" where ");
			for (int i = 0; i < wheres.length; i++) {
				String where = wheres[i];
				String filed = filedk[i];
				Object value = valuek[i];
				if (i != 0) {
					sql.append(" and ");
				}
	//			if (where.indexOf("like") != -1) {
	//				sql.append(" ").append(filed).append(" ").append(where)
	//						.append(" '").append(value).append("'");
	//			} else 
	//			{
					sql.append(" ").append(filed).append(where).append(value);
	//			}
	
			}
		}
		if(orderby !=null && orderby.length > 0)
		{
			sql.append(" order by ");
			for(int i =0 ;i < orderby.length; i ++)
			{
				sql.append(orderby[i] + " " + patterns[i]);
				if (i < orderby.length - 1) {
					sql.append(", ");
				}
			}
		}

		long end = System.currentTimeMillis();
		System.out.println("select sql use : " + (end - start) + "ms");
		System.out.println("select sql ==> : " + sql.toString());

		return sql.toString();
	}

	public static <T> String updateSql(T t) throws Exception {

		Class<? extends Object> class1 = t.getClass();
		long start = System.currentTimeMillis();
		String tableName = AnnoationUtil.getTablename(class1);
		long end = System.currentTimeMillis();
		System.out
				.println("get update tablename use : " + (end - start) + "ms");

		StringBuffer sql = new StringBuffer();
		StringBuffer sets = new StringBuffer();
		sql.append("update ").append(tableName).append(" set ");
		Object id = "";
		try {
			long start2 = System.currentTimeMillis();
			Field[] fields = class1.getDeclaredFields();
			for (Field field : fields) {
				String key = field.getName();

				PropertyDescriptor pd = new PropertyDescriptor(key, class1);
				Method getMethod = pd.getReadMethod();
				Object value = getMethod.invoke(t);

				Column coumn = (Column) field.getAnnotation(Column.class);

				if (value == null || value.equals("")) // 属性的值为null equals比较会抛异常
				{
					continue;
				}

				if (!field.isAnnotationPresent(Id.class)) {

					sets.append(coumn.name()).append("=");

					if (value instanceof Integer) {
						sets.append("").append(value).append(",");
					} else if (value instanceof Date) {
						sets.append("'")
								.append(((Date) value).toLocaleString())
								.append("',");
					} else {
						sets.append("'").append(value).append("',");
					}
				} else {
					id = value;
				}
			}

			if (Integer.valueOf(id + "") == 0) { //id=0的时候 新建该对象
				return insertSql(t);
			}
			long end2 = System.currentTimeMillis();

			System.out.println("get update propertylist use : "
					+ (end2 - start2) + "ms");
			String paramk = sets.toString().substring(0,
					sets.toString().lastIndexOf(","));

			sql.append(paramk).append(" where id=" + id);

			System.out.println(sql.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sql.toString();
	}

}
