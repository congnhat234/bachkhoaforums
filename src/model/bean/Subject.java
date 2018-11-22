package model.bean;

public class Subject {
	private int id_subject;
	private String name;
	public Subject() {
		super();
	}
	public Subject(int id_subject, String name) {
		super();
		this.id_subject = id_subject;
		this.name = name;
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
	

}
