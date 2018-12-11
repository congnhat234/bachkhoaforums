package model.bo;

import model.bean.Follow;
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
}
