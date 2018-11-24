package model.bo;

import java.util.ArrayList;

import model.bean.Post;
import model.dao.PostDAO;

public class PostBO {
	PostDAO postDAO= new PostDAO();
	public ArrayList<Post> getListPost(){
		return postDAO.getListPost();
	}
	public Post getPost(int idPost){
		return postDAO.get(idPost);
	}
	public boolean addPost(Post post) {
		return postDAO.add(post);
	}
	public boolean editPost(Post post) {
		return postDAO.edit(post);
	}
	public boolean deletePost(int idPost) {
		return postDAO.delete(idPost);
	}

}
