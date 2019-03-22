package com.u2.test;

import java.sql.SQLException;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.u2.db.data.DBPoolConnection;

public class ConnectionTest {

	
	public static void main(String[] args) throws SQLException {
		
		
		DruidPooledConnection c = DBPoolConnection.getInstance().getConnection();
		System.out.println(c);
	}
}
