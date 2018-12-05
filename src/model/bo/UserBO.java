package model.bo;

import java.util.ArrayList;

import model.bean.Subject;
import model.bean.User;
import model.dao.UserDAO;

public class UserBO {
	UserDAO userDAO = new UserDAO();
	public User findByToken(String token) {
		return userDAO.findByToken(token);
	}
	public User findByIDUser(int idUser) {
		return userDAO.findByIDUser(idUser);
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

		return userDAO.getListUsers();
	}
	public int countItems() {
		return userDAO.countItems();
	}
	public ArrayList<User> getListUserOffset(int offset, int row_count) {
		return userDAO.getListUserOffset(offset, row_count);
	}
	public int getStatus(int idUser) {
		return userDAO.getStatus(idUser);
	}
	public boolean setStatus(int idUser, int i) {
		return userDAO.setStatus(idUser, i);
	}

}
