package model.bo;

import java.util.ArrayList;

import model.bean.Follow;
import model.bean.Notification;
import model.dao.FollowDAO;

public class FollowBO {
	FollowDAO followDAO = new FollowDAO();
	public boolean add(Follow follow) {
		return followDAO.add(follow);
	}
	public boolean deleteFollowByPost(int id_post) {
		return followDAO.deleteFollowByPost(id_post);
		
	}
	public boolean deleteFollowByUser(int idUser) {
		return followDAO.deleteFollowByUser(idUser);
		
	}
	public boolean deleteFollowPostByUser(int idPost, int id_user) {
		
		return followDAO.deleteFollowPostByUser(idPost,id_user);
	}
	public ArrayList<Notification> getListNotify(int idUser,int offset,int row_count) {
		
		return followDAO.getListNotify(idUser,offset,row_count);
	}
	public int getCountUnSeenNoti(int idUser) {
		
		return followDAO.getCountUnSeenNoti(idUser);
	}
	public boolean editNotityFollow(int idPost) {
		
		return followDAO.editNotityFollow(idPost);
		
	}
	public int getCountNoti(int idUser) {
	
		return followDAO.getCountNoti(idUser);
	}
}
