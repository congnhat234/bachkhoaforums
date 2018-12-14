package model.bo;

import java.util.ArrayList;

import com.google.gson.JsonArray;

import model.bean.LikeComment;
import model.bean.Post;
import model.dao.PostDAO;

public class PostBO {
	PostDAO postDAO= new PostDAO();
	public ArrayList<Post> getListPost(){
		return postDAO.getAllPostEnabled();
	}
	public ArrayList<Post> getListPostAll(){
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
	public ArrayList<Post> getPostSubject(int idSub) {	
		return postDAO.getPostSubject(idSub);
	
	}
	public ArrayList<Post> getListPostFolowUser(int idUser) {
		return postDAO.getListPostFolowUser(idUser);
	}
	public ArrayList<Post> getListPostByUser(String username,int offset, int row_count){
		return postDAO.getListPostByUser(username,offset,row_count);
	}
	public ArrayList<Post> getListOutStanding(){
		return postDAO.getListOutStanding();
	}
	public int countLike(int idPost) {
		return postDAO.countLike(idPost);
	}
	public int likedByUser(int idPost, int idUser) {
		return postDAO.likedByUser(idPost, idUser);
	}
	public boolean likePost(int idPost, int idUser) {
		return postDAO.likePost(idPost, idUser);
	}
	public boolean deleteLikedPostByUser(int idPost, int idUser) {
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

	public int likedCommentByUser(int idComment, int id_user) {
		return postDAO.likedCommentByUser(idComment, id_user);
	}
	public boolean deleteLikedCommentByUser(int idComment, int idUser) {
		return postDAO.deleteLikedCommentByUser(idComment, idUser);
	}
	public boolean likeComment(int idComment, int idUser) {
		return postDAO.likeComment(idComment, idUser);
	}
	public int countLikeComment(int idComment) {
		return postDAO.countLikeComment(idComment);
	}
	public ArrayList<LikeComment> getListLikedComment(int idPost) {
		return postDAO.getListLikedComment(idPost);
	}
	public int followedByUser(int idPost, int id_user) {
		
		return postDAO.followedByUser(idPost,id_user);
	}
	public int getAmountAnwserPost(int id_post) {
		
		return postDAO.getAmountAnwserPost(id_post);
	}
	public int getIdUserLastComment(int id_post) {
		
		return postDAO.getIdUserLastComment(id_post);
	}
	public ArrayList<Post> getListPostSubjectOffset(int idSub, int offset, int row_count) {
		
		return postDAO.getListPostSubjectOffset(idSub,offset,row_count);
	}
	public int countItemsPost(int idSub) {

		return postDAO.countItemsPost(idSub);
	}
	public int getViewPost(int id_post) {
		return postDAO.getViewPost(id_post);
	}
	public boolean setViewPost(int id_post, int view) {
		return postDAO.setViewPost(id_post,view);
	}
	public int countItemsNewPosts() {
		return postDAO.countNewPosts();
	}
	public Object getListNewPosts(int offset, int row_count) {
		return postDAO.getListNewPosts(offset, row_count);
	}
	public int countPostsBySearch(String searchText) {
		return postDAO.countPostsBySearch(searchText);
	}
	public Object getListPostsBySearch(int offset, int row_count, String searchText) {
		return postDAO.getListPostsBySearch(offset, row_count, searchText);
	}
	public int getCountPostUser(int idUser) {
		
		return postDAO.getCountPostUser(idUser);
	}

}
