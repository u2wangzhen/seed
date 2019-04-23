package com.u2.db.data;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.pool.DruidPooledConnection;

/**
 * 要实现单例模式，保证全局只有一个数据库连接池
 */
public class DBPoolConnection {
	private static DBPoolConnection dbPoolConnection = null;
	private static DruidDataSource druidDataSource = null;

	static {
		//Properties properties = loadPropertiesFile("resource/db_server.properties");
		
		Map<String,String> map=new HashMap<String, String>();
		map.put("driverClassName", "com.mysql.jdbc.Driver");
		map.put("url", "jdbc:mysql://127.0.0.1:3306/seed_hx?characterEncoding=utf-8");
		map.put("username", "root");
		map.put("password", "123456");
		map.put("filters", "stat");
		map.put("initialSize", "2");
		map.put("maxActive", "300");
		map.put("maxWait", "60000");
		map.put("timeBetweenEvictionRunsMillis", "60000");
		map.put("minEvictableIdleTimeMillis", "300000");
		map.put("validationQuery", "SELECT 1");
		map.put("testWhileIdle", "true");
		map.put("testOnBorrow", "false");
		map.put("testOnReturn", "false");
		map.put("poolPreparedStatements", "false");
		map.put("maxPoolPreparedStatementPerConnectionSize", "200");
		
		try {
			druidDataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(map); // DruidDataSrouce工厂模式
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 数据库连接池单例
	 * 
	 * @return
	 */
	public static synchronized DBPoolConnection getInstance() {
		if (null == dbPoolConnection) {
			dbPoolConnection = new DBPoolConnection();
		}
		return dbPoolConnection;
	}

	/**
	 * 返回druid数据库连接
	 * 
	 * @return
	 * @throws SQLException
	 */
	public DruidPooledConnection getConnection() throws SQLException {
		return druidDataSource.getConnection();
	}

	/**
	 * @param string
	 *            配置文件名
	 * @return Properties对象
	 */
	private static Properties loadPropertiesFile(String fullFile) {
		String webRootPath = null;
		if (null == fullFile || fullFile.equals("")) {
			throw new IllegalArgumentException("Properties file path can not be null" + fullFile);
		}
		webRootPath = DBPoolConnection.class.getClassLoader().getResource("").getPath();
		webRootPath = new File(webRootPath).getParent();
		InputStream inputStream = null;
		Properties p = null;
		try {
			inputStream = new FileInputStream(new File(webRootPath + File.separator + fullFile));
			p = new Properties();
			p.load(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != inputStream) {
					inputStream.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return p;
	}

}