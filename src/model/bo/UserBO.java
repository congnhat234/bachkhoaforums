package model.bo;

import model.bean.User;
import model.dao.UserDAO;

public class UserBO {
	UserDAO userDAO = new UserDAO();
	public User findByToken(String token) {
		return userDAO.findByToken(token);
	}
	public boolean add(User user) {
		return userDAO.add(user);
	}
}
