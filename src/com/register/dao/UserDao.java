package com.register.dao;

import java.sql.SQLException;






import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.register.domain.User;
import com.register.service.UserService;
import com.utils.C3P0Utils;

public class UserDao {

	public User selectUser(String username, String password) {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from user where username=? and password=?";
		try {
			return  qr.query(sql, new BeanHandler<User>(User.class), username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
   
	public User selectUsername(String username) {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select username from user where username=?";
		try {
			return   qr.query(sql, new BeanHandler<User>(User.class), username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public  void insertUser(String username, String password) {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into user(username,password) values(?,?)";
		try {
			qr.update(sql, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
}
