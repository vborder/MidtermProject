package com.skilldistillery.brushr.data;

import com.skilldistillery.brushr.entities.User;

public interface UserDAO {
	public User createUser(User user);
	public User findUserByUserName(String name);
	public User updateUser(int id, User user);
	public boolean deleteUser(User user);
}
