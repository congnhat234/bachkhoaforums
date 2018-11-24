package model.bo;

import java.util.ArrayList;

import model.bean.Post;
import model.dao.PostDAO;

public class PostBO {
	PostDAO postDAO= new PostDAO();
	public ArrayList<Post> getListPost(){
		return postDAO.getListPost();
	}

}
