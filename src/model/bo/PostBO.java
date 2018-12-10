package model.bo;

import java.util.ArrayList;

import model.bean.Post;
import model.dao.PostDAO;

public class PostBO {
	PostDAO postDAO= new PostDAO();
	public ArrayList<Post> getListPost(){
		return postDAO.getAllPostEnabled();
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
	public ArrayList<Post> getPostSubject(int idSub) {	
		return postDAO.getPostSubject(idSub);
	
	}
	public ArrayList<Post> getListPostFolowUser(int idUser) {
		return postDAO.getListPostFolowUser(idUser);
	}
	public ArrayList<Post> getListPostByUser(String username){
		return postDAO.getListPostByUser(username);
	}
	public int countItems() {
		return postDAO.countItems();
	}
	public ArrayList<Post> getListPostOffset(int offset, int row_count) {
		return postDAO.getListPostOffset(offset,row_count);
	}
	public int countLike(int idPost) {
		// TODO Auto-generated method stub
		return postDAO.countLike(idPost);
	}
	public int likedByUser(int idPost, int idUser) {
		// TODO Auto-generated method stub
		return postDAO.likedByUser(idPost, idUser);
	}
	public boolean likePost(int idPost, int idUser) {
		// TODO Auto-generated method stub
		return postDAO.likePost(idPost, idUser);
	}
	public boolean deleteLikedPostByUser(int idPost, int idUser) {
		// TODO Auto-generated method stub
		return postDAO.deleteLikedPostByUser(idPost, idUser);
	}
	public int getStatus(int idPost) {
		return postDAO.getStatus(idPost);
	}
	public boolean setStatus(int idPost, int i) {
		return postDAO.setStatus(idPost, i);
	}
	public boolean changeSubjectPost(int idSub,int idPost) {
		return postDAO.changeSubjectPost(idSub,idPost);
		
	}
	public boolean deleteLikePostByPost(int id_post) {
		return postDAO.deleteLikePostByPost(id_post);
		
	}
	public boolean deletePostByUser(String userName) {
		return postDAO.deletePostByUser(userName);
		
	}
	public boolean deleteLikePostByUser(int idUser) {
		return postDAO.deleteLikePostByUser(idUser);
		
	}
	public boolean deletePostByIdSub(int idSub) {
		return postDAO.deletePostByIdSub(idSub);
		
	}

}
