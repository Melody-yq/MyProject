package com.register.service;


import com.register.dao.UserDao;
import com.register.domain.User;

public class UserService {
	private UserDao userDao = new UserDao();

	public User selectUser(String username, String password) {
		return userDao.selectUser(username, password);
	}

	public User selectUsername(String username) {

		 return userDao.selectUsername(username);
			}

	public void addUser(String username, String password) {
		userDao.insertUser(username,password);
		
	}

}
