package model.bo;

import java.util.ArrayList;

import model.bean.Comment;
import model.dao.CommentDAO;

public class CommentBO {
	CommentDAO commentDAO= new CommentDAO();
	public ArrayList<Comment> getListComment(int idPost){
		return commentDAO.getListComment(idPost);
	}
	public Comment getComment(int idComment){
		return commentDAO.get(idComment);
	}
	public boolean addComment(Comment comment) {
		return commentDAO.add(comment);
	}
//	public boolean editComment(Comment comment) {
//		return commentDAO.edit(comment);
//	}
	public boolean deleteComment(int idComment) {
		return commentDAO.delete(idComment);
	}
	public boolean deleteLikeCommentByComment(int id_comment) {
		return commentDAO.deleteLikeCommentByComment(id_comment);
		
	}
	public boolean deleteCommentByPost(int id_post) {
		return commentDAO.deleteCommentByPost(id_post);
		
	}
	public boolean deleteCommentByUser(int idUser) {
		return commentDAO.deleteCommentByUser(idUser);
		
	}
	public boolean deleteLikeCommentByUser(int idUser) {
		return commentDAO.deleteLikeCommentByUser(idUser);	
	}
	public boolean editNotifyComment(int idPost, int id_user) {
		return commentDAO.editNotifyComment(idPost,id_user);
		
	}
	public boolean seenNotitication(int id_comment) {
		return commentDAO.seenNotitication(id_comment);
		
	}

}