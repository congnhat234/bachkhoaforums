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
	public boolean editComment(Comment comment) {
		return commentDAO.edit(comment);
	}
	public boolean deleteComment(int idComment) {
		return commentDAO.delete(idComment);
	}

}