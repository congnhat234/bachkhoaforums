package model.bean;

public class Notification {
	 int idPost;
	 String username;
	 String titlePost;
	 int countUnSeen;
	public Notification(int idPost, String username, String titlePost,int countUnSeen) {
		super();
		this.idPost = idPost;
		this.username = username;
		this.titlePost = titlePost;
		this.countUnSeen = countUnSeen;
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
	
	
	
	
}
