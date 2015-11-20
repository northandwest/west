package com.bucuoa.west.dao.core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Map;

import javax.sql.DataSource;

public class SessionFactory {
	static ThreadLocal<Map<DataSource,Connection>> conns = new  ThreadLocal<Map<DataSource,Connection>>();

	private  DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public  Session getSession() {
		Session session = new Session();
		Connection conn = null;
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			String url = "jdbc:mysql://localhost:3306/pmsonline?Unicode=true&characterEncoding=utf-8";
//			String user = "root";
//			String password = "";
			conn = dataSource.getConnection();// DriverManager.getConnection(url, user, password);
			
			if(conn.isClosed())
			{
				conn = dataSource.getConnection();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setConnection(conn);
		session.setCreateTime(new Date());
		session.setUseNum(1);
		return session;
	}

	public  Connection getWriter2() {
		Connection conn = null;
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			String url = "jdbc:mysql://localhost:3306/pmsonline?Unicode=true&characterEncoding=utf-8";
//			String user = "root";
//			String password = "";
			conn = dataSource.getConnection();// DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
//	public static Connection getWriterByPool() {
//		Connection conn = null;
//		ReaderConnectionPool readerPool = new ReaderConnectionPool(
//				new String[]{"com.mysql.jdbc.Driver"}, new String[]{"jdbc:mysql://localhost:3306/pmsonline?Unicode=true&characterEncoding=utf-8"},
//						new String[]{"root"}, new String[]{""});
//
//		try {
//			readerPool.createPool();
//			
//			conn = readerPool.getConnection();
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}
//		return conn;
//	}
//
//	public static Connection getConnByJNDI() {
//		Connection conn = null;
//		try {
//			Context initContext = new InitialContext();
//			Context envContext = (Context) initContext.lookup("java:/comp/env");
//			DataSource ds = (DataSource) envContext
//					.lookup("neushopDataSourceJNDI");
//			conn = ds.getConnection();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return conn;
//	}
//
//	public static Connection getReaderByPool() {
//		Connection conn = null;
//		
//			ReaderConnectionPool readerPool = new ReaderConnectionPool(
//					new String[]{"com.mysql.jdbc.Driver"}, new String[]{"jdbc:mysql://localhost:3306/pmsonline?Unicode=true&characterEncoding=utf-8"},
//							new String[]{"root"}, new String[]{""});
//
//			try {
//				readerPool.createPool();
//				
//				conn = readerPool.getConnection();
//			} catch (Exception ex) {
//				ex.printStackTrace();
//			}
//			
//		return conn;
//	}
	

	public  Connection getReader2() {
		Connection conn = null;
		
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			String url = "jdbc:mysql://localhost:3306/pmsonline?Unicode=true&characterEncoding=utf-8";
//			String user = "root";
//			String password = "";
			conn = dataSource.getConnection();// DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}


	public static void closeObject(Object o) {
		if (o != null) {
			if (o instanceof Connection) {
				try {
					((Connection) o).close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (o instanceof Statement) {
				try {
					((Statement) o).close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (o instanceof PreparedStatement) {
				try {
					((PreparedStatement) o).close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (o instanceof ResultSet) {
				try {
					((ResultSet) o).close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (o instanceof Session) {
				try {
					((Session) o).close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
