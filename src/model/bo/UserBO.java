package model.bo;

import java.util.ArrayList;

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
	public boolean edit(User user) {
		return userDAO.edit(user);
	}
	public boolean delete(int idUser) {
		return userDAO.delete(idUser);
	}
	public ArrayList<User> getListUsers() {
		// TODO Auto-generated method stub
		return userDAO.getListUsers();
	}
}
