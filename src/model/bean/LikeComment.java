package model.bean;

public class LikeComment {
	private int id_like_comment;
	private int id_comment;
	private int id_user;
	public LikeComment(int id_like_comment, int id_comment, int id_user) {
		super();
		this.id_like_comment = id_like_comment;
		this.id_comment = id_comment;
		this.id_user = id_user;
	}
	public LikeComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId_comment() {
		return id_comment;
	}
	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
}
