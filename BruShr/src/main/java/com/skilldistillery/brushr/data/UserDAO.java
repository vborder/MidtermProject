package com.skilldistillery.brushr.data;

public interface UserDAO {
	public void createUser(User user);
	public User findUserByUserName(String name);
	public User updateUser(int id, User user);
	public boolean deleteUser(User user);
}
