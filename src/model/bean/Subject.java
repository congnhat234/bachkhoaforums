package model.bean;

public class Subject {
	private int id_subject;
	private String name;
	private String describe;
	public Subject() {
		super();
	}
	public Subject(int id_subject, String name) {
		super();
		this.id_subject = id_subject;
		this.name = name;
	}
	public Subject(int id_subject, String name, String describe) {
		super();
		this.id_subject = id_subject;
		this.name = name;
		this.describe = describe;
	}
	public int getId_subject() {
		return id_subject;
	}
	public void setId_subject(int id_subject) {
		this.id_subject = id_subject;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	

}
