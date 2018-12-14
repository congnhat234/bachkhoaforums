package model.bean;

public class Notification {
	String avatar;
	int id_comment;
	 int idPost;
	 String username;
	 String titlePost;
	 int countUnSeen;
	 int status;
	public Notification(String avatar,int id_comment,int idPost, String username, String titlePost,int countUnSeen,int status) {
		super();
		this.avatar = avatar;
		this.id_comment = id_comment;
		this.idPost = idPost;
		this.username = username;
		this.titlePost = titlePost;
		this.countUnSeen = countUnSeen;
		this.status = status;
	}
	public Notification(String username, String titlePost) {
		super();
		this.username = username;
		this.titlePost = titlePost;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTitlePost() {
		return titlePost;
	}
	public void setTitlePost(String titlePost) {
		this.titlePost = titlePost;
	}
	public int getCountUnSeen() {
		return countUnSeen;
	}
	public void setCountUnSeen(int countUnSeen) {
		this.countUnSeen = countUnSeen;
	}
	public int getIdPost() {
		return idPost;
	}
	public void setIdPost(int idPost) {
		this.idPost = idPost;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getId_comment() {
		return id_comment;
	}
	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	
	
	
}
