package com.skilldistillery.brushr.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.brushr.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User createUser(User user) {
		em.persist(user);
		em.flush();
		return user;

	}

	@Override
	public User findUserByUserName(String name) {
		String jpql = "SELECT u from User u WHERE u.loginName = :login";
		User u = null;

		if (em.createQuery(jpql, User.class).setParameter("login", name).getResultList().size() != 0) {
			u = em.createQuery(jpql, User.class).setParameter("login", name).getResultList().get(0);
		}
		return u;
	}

	@Override
	public User updateUser(int id, User user) {
		User u = em.find(User.class, id);
		
		u.setLoginName(user.getLoginName());
		u.setPassword(user.getPassword());
		
		em.persist(u);
		em.flush();
		
		return u;
	}

	@Override
	public boolean deleteUser(User user) {
		boolean deletedUser = false;
		
		User u = em.find(User.class, user.getId());
		
		
		em.remove(u);
		em.flush();
		deletedUser = true;
		em.close();
		
		return !em.contains(u);
	}

}
