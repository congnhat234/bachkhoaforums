package model.bean;

public class Post {
	private int id_post;
	private int id_subject;
	private String username;
	private String date_create;
	private String title;
	private String preview_image;
	private String preview_content;
	private String content;
	private int view;
	private int enable;

	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(int id_post, int id_subject, String username, String date_create, String title, String preview_image,
			String preview_content, String content, int view, int enable) {
		super();
		this.id_post = id_post;
		this.id_subject = id_subject;
		this.username = username;
		this.date_create = date_create;
		this.title = title;
		this.preview_image = preview_image;
		this.preview_content = preview_content;
		this.content = content;
		this.view = view;
		this.enable = enable;
	}

	public int getId_post() {
		return id_post;
	}

	public void setId_post(int id_post) {
		this.id_post = id_post;
	}

	public int getId_subject() {
		return id_subject;
	}

	public void setId_subject(int id_subject) {
		this.id_subject = id_subject;
	}

	public String getUsername() {
		return username;
	}

	public void setId_user(String username) {
		this.username = username;
	}

	public String getDate_create() {
		return date_create;
	}

	public void setDate_create(String date_create) {
		this.date_create = date_create;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPreview_image() {
		return preview_image;
	}

	public void setPreview_image(String preview_image) {
		this.preview_image = preview_image;
	}

	public String getPreview_content() {
		return preview_content;
	}

	public void setPreview_content(String preview_content) {
		this.preview_content = preview_content;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

}
