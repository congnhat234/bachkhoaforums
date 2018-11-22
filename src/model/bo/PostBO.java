package model.bo;

import java.util.ArrayList;

import model.bean.Post;
import model.dao.PostDAO;

public class PostBO {
	PostDAO postBAO= new PostDAO();
	public ArrayList<Post> getListPost(){
		return postBAO.getListPost();
	}

}
