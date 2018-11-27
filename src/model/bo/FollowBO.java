package model.bo;

import model.bean.Follow;
import model.dao.FollowDAO;

public class FollowBO {
	FollowDAO followDAO = new FollowDAO();
	public boolean add(Follow follow) {
		return followDAO.add(follow);
	}
}
