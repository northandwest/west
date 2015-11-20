package com.bucuoa.west.dao.core;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.bucuoa.west.dao.core.uitls.AnnoationUtil;
import com.bucuoa.west.dao.extend.annotations.Column;
/**
 * sql执行器
 * @author jake
 *
 */
public class ExcetueManager {
	
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public  int doDML(String sql, Object[] objects) {
		Connection conn = null;
		PreparedStatement pst = null;
		int flag = 0;
		try {
			Session session = sessionFactory.getSession();
			conn = session.getConnection();
			if(conn.isClosed())
			{
				conn = session.getConnection();
			}
			
			pst = conn.prepareStatement(sql);
			if (objects != null) {
				for (int i = 0; i < objects.length; i++) {
					pst.setObject(i + 1, objects[i]);
				}
			}
			flag = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SessionFactory.closeObject(pst);
			SessionFactory.closeObject(conn);
		}
		return flag;
	}



	
	public  Object executeUpdateSql(String sql) {
		
		Connection conn = null;
		PreparedStatement pst = null;
	
		Long id = 0L;
		try {
//			conn = sessionFactory.getWriter();
			Session session = sessionFactory.getSession();
			conn = session.getConnection();
			if(conn.isClosed())
			{
				conn = session.getConnection();
			}
			pst = conn.prepareStatement(sql.toString(),Statement.RETURN_GENERATED_KEYS);
			
			pst.executeUpdate();
			
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();

		}
		
		ResultSet rs = null;
		try {
			 rs = pst.getGeneratedKeys();  
			if (rs.next()) {  
			    id = rs.getLong(1);   
			}
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("id return is error");
			
		}finally
		{
			SessionFactory.closeObject(rs);
			SessionFactory.closeObject(conn);
			SessionFactory.closeObject(pst);
		}
		return id;
	}

	public  int queryCount(String sql) {
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rst = null;
		int result = 0;
		try {
//			conn = sessionFactory.getReader();
			Session session = sessionFactory.getSession();
			conn = session.getConnection();
			if(conn.isClosed())
			{
				conn = session.getConnection();
			}
			pst = conn.prepareStatement(sql);
			rst = pst.executeQuery();
			if (rst.next()) {
				result = rst.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SessionFactory.closeObject(rst);
			SessionFactory.closeObject(pst);
			SessionFactory.closeObject(conn);
		}
		return result;
	}

	public  <T> T queryOne(String sql, Class<T> t) {
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rst = null;
		T obj = null;
		
		try {
			obj = t.newInstance();
		} catch (InstantiationException e1) {
			e1.printStackTrace();
		} catch (IllegalAccessException e1) {
			e1.printStackTrace();
		}
		try {
//			conn = sessionFactory.getReader();
			Session session = sessionFactory.getSession();
			conn = session.getConnection();
			if(conn.isClosed())
			{
				conn = session.getConnection();
			}
			pst = conn.prepareStatement(sql);
			rst = pst.executeQuery();
			if (rst.next()) {
				Field[] fields = obj.getClass().getDeclaredFields();
				for (Field field : fields) {
					
					String filedname = field.getName();
					 Column coumn = (Column) field.getAnnotation(Column.class);
					 String name = coumn.name();
					 
					if ("serialVersionUID".equalsIgnoreCase(filedname)) {
						continue;
					}

					try {
						Class<?> typex = field.getType();
						
						if(typex.getName().equals("java.util.Date"))
						{
							Date tempDate = rst.getTimestamp(name);
							if(tempDate !=null)
							{
							BeanUtils.setProperty(obj, filedname, new Date());
							}
						}else
						{
							Object tempStr = null;
							try {
								tempStr = rst.getString(name);
								BeanUtils.setProperty(obj, filedname, tempStr);
							} catch (Exception e) {
								System.out.println(t.getCanonicalName()+"--> miss "+name);
							}
						}
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
				}
			}else
			{
				obj = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SessionFactory.closeObject(rst);
			SessionFactory.closeObject(pst);
			SessionFactory.closeObject(conn);
		}
		return obj;
	}
	
	public   <T> List<T> queryList(String sql, Class<T> t) {
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rst = null;
		
		List<T> list = new ArrayList<T>();

		try {
//			conn = sessionFactory.getReader();
			Session session = sessionFactory.getSession();
			conn = session.getConnection();
			if(conn.isClosed())
			{
				conn = session.getConnection();
			}
			pst = conn.prepareStatement(sql);
		
			rst = pst.executeQuery();
			
			while (rst.next()) {
				
				T item = t.newInstance();
				Field[] fields = item.getClass().getDeclaredFields();
				
				for (Field field : fields) {
					
					String filedname = field.getName();
					 Column coumn = (Column) field.getAnnotation(Column.class);
					 String name = coumn.name();
					 
					if ("serialVersionUID".equalsIgnoreCase(filedname)) {
						continue;
					}

					try {
						Class<?> typex = field.getType();
						
						if(typex.getName().equals("java.util.Date"))
						{
							Date tempDate = rst.getTimestamp(name);
							if(tempDate !=null)
							{
							BeanUtils.setProperty(item, filedname, new Date());
							}
						}else
						{
							Object tempStr = rst.getString(name);
							BeanUtils.setProperty(item, filedname, tempStr);
						}
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
				list.add(item);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SessionFactory.closeObject(rst);
			SessionFactory.closeObject(pst);
			SessionFactory.closeObject(conn);
		}
		return list;
	}
	
	public   <T> List<Map<String,String>> queryListMap(String sql) {
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rst = null;
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();

		try {
//			conn = sessionFactory.getReader();
			Session session = sessionFactory.getSession();
			conn = session.getConnection();
			if(conn.isClosed())
			{
				conn = session.getConnection();
			}
			
			pst = conn.prepareStatement(sql);
			rst = pst.executeQuery();
			
//			boolean isMap = false;
			ResultSetMetaData metaData = rst.getMetaData();
			int numCols = metaData.getColumnCount(); 
			
			List<String> columns =  new ArrayList<String>();
			for(int i = 1; i <= numCols; i ++)
			{
				String columnName = metaData.getColumnName(i);
				columns.add(columnName);
			}
				
			while (rst.next()) {
				Map<String,String> map = new HashMap<String,String>();
				for (String column : columns) {

					try {
						String temp = rst.getString(column);
						if(temp !=null)
						{
							map.put(column, temp);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
				}
				list.add(map);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SessionFactory.closeObject(rst);
			SessionFactory.closeObject(pst);
			SessionFactory.closeObject(conn);
		}
		return list;
	}

	public  void addBatch(String sql, List<String[]> argsList) {
		Connection conn = null;
		PreparedStatement prest = null;
		try {
//			conn = sessionFactory.getWriter();
			Session session = sessionFactory.getSession();
			conn = session.getConnection();
			if(conn.isClosed())
			{
				conn = session.getConnection();
			}
			
			conn.setAutoCommit(false);
			
			prest = conn.prepareStatement(sql);

			for (String[] strings : argsList) {
				for (int i = 0; i < strings.length; i++) {
					prest.setString(i + 1, strings[i]);
				}
				prest.addBatch();
			}

			prest.executeBatch();
			conn.commit();
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			SessionFactory.closeObject(prest);
			SessionFactory.closeObject(conn);
		}
	}
	
	public  void deleteById(Class<?> classk,Object id) {
		Connection conn = null;
		PreparedStatement prest = null;
		String tableName = AnnoationUtil.getTablename(classk);
		String sql = "delete from "+tableName+" where id="+id;
		try {
//			conn = sessionFactory.getWriter();
			Session session = sessionFactory.getSession();
			conn = session.getConnection();
			if(conn.isClosed())
			{
				conn = session.getConnection();
			}
			conn.setAutoCommit(false);
			prest = conn.prepareStatement(sql);
			prest.executeUpdate();
			conn.commit();
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			SessionFactory.closeObject(prest);
			SessionFactory.closeObject(conn);
		}
	}
	
	public  void deleteById(Class<?> classk,String condtion) {
		Connection conn = null;
		PreparedStatement prest = null;
		String tableName = AnnoationUtil.getTablename(classk);
		String sql = "delete from "+tableName+" where "+condtion;
		try {
//			conn = sessionFactory.getWriter();
			Session session = sessionFactory.getSession();
			conn = session.getConnection();
			if(conn.isClosed())
			{
				conn = session.getConnection();
			}
			
			conn.setAutoCommit(false);
			prest = conn.prepareStatement(sql);
			prest.executeUpdate();
			conn.commit();
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			SessionFactory.closeObject(prest);
			SessionFactory.closeObject(conn);
		}
	}
}
