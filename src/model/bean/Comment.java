package model.bean;

public class Comment {
	int id_comment;
	int id_post;
	int id_user;
	String date_create;
	String content;
	String username;
	int notify;
	String avatar;
	
	public Comment() {
		super();
	}

	public Comment(int id_comment, int id_post, int id_user, String date_create, String content,String username, int notify) {
		super();
		this.id_comment = id_comment;
		this.id_post = id_post;
		this.id_user = id_user;
		this.date_create = date_create;
		this.content = content;
		this.username=username;
		this.notify = notify;
	}





	public Comment(int id_comment, int id_post, int id_user, String date_create, String content, String username,
			int notify, String avatar) {
		super();
		this.id_comment = id_comment;
		this.id_post = id_post;
		this.id_user = id_user;
		this.date_create = date_create;
		this.content = content;
		this.username = username;
		this.notify = notify;
		this.avatar = avatar;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getId_comment() {
		return id_comment;
	}


	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
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





	public String getDate_create() {
		return date_create;
	}





	public void setDate_create(String date_create) {
		this.date_create = date_create;
	}





	public String getContent() {
		return content;
	}





	public void setContent(String content) {
		this.content = content;
	}
	
	public String getUserName() {
		return username;
	}


	public void setUserName(String username) {
		this.username = username;
	}


	public int getNotify() {
		return notify;
	}





	public void setNotify(int notify) {
		this.notify = notify;
	}

	



}
	

