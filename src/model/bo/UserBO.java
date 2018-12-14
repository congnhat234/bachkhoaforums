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
	public User findByUserName(String username) {
		return userDAO.findByUserName(username);
	}
	public int findByUserNameAndEmail(String username, String email) {
		return userDAO.findByUserNameAndEmail(username, email);
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
	public int countItemsEnabled() {
		return userDAO.countItemsEnabled();
	}
	public int getStatus(int idUser) {
		return userDAO.getStatus(idUser);
	}
	public boolean setStatus(int idUser, int i) {
		return userDAO.setStatus(idUser, i);
	}
	public boolean changePassWord(int userid,String token,String password) {
		
		return userDAO.changePassWord(userid,token,password);
	}

	public int getRate(int idUser) {
		return userDAO.getRate(idUser);
	}
	public boolean setRate(int idUser, int rate) {
		return userDAO.setRate(idUser, rate);
	}
	public boolean resetPassword(String username, String uuid) {
		return userDAO.resetPassword(username, uuid);
	}
}
