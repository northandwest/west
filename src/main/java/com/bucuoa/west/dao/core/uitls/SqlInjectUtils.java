package com.bucuoa.west.dao.core.uitls;

public class SqlInjectUtils {
	public static String filterSql(String str)
    {
          return str.replaceAll(".*([';]+|(--)+).*", " ");
    }
}
