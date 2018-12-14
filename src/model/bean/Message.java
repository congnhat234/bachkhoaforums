package model.bean;

public class Message {
	private int id_message;
	private int id_user;
	private String email;
	private String message_content;
	private String reply;
	private String date_create;
	private int notify_user;
	private int notify_admin;
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Message(int id_message, int id_user, String email, String message_content, String reply, String date_create,
			int notify_user, int notify_admin) {
		super();
		this.id_message = id_message;
		this.id_user = id_user;
		this.email = email;
		this.message_content = message_content;
		this.reply = reply;
		this.date_create = date_create;
		this.notify_user = notify_user;
		this.notify_admin = notify_admin;
	}

	public int getId_message() {
		return id_message;
	}
	public void setId_message(int id_message) {
		this.id_message = id_message;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getDate_create() {
		return date_create;
	}
	public void setDate_create(String date_create) {
		this.date_create = date_create;
	}
	public int getNotify_user() {
		return notify_user;
	}
	public void setNotify_user(int notify_user) {
		this.notify_user = notify_user;
	}
	public int getNotify_admin() {
		return notify_admin;
	}
	public void setNotify_admin(int notify_admin) {
		this.notify_admin = notify_admin;
	}
	
}
