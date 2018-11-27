package model.bean;

public class Follow {
	int id_follow;
	int id_post;
	int id_user;
	int notify;
	public Follow(int id_follow, int id_post, int id_user, int notify) {
		super();
		this.id_follow = id_follow;
		this.id_post = id_post;
		this.id_user = id_user;
		this.notify = notify;
	}
	public int getId_follow() {
		return id_follow;
	}
	public void setId_follow(int id_follow) {
		this.id_follow = id_follow;
	}
	public int getId_post() {
		return id_post;
	}
	public void setId_post(int id_post) {
		this.id_post = id_post;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public int getNotify() {
		return notify;
	}
	public void setNotify(int notify) {
		this.notify = notify;
	}
	
	
}
