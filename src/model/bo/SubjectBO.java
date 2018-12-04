package model.bo;

import java.util.ArrayList;

import model.bean.Post;
import model.bean.Subject;
import model.dao.SubjectDAO;

public class SubjectBO {
	SubjectDAO subjectDAO= new SubjectDAO();
	public ArrayList<Subject> getListSubject() {
		return subjectDAO.getListSubject();
	}
	public Subject getSubject(int idSub) {
		return subjectDAO.getSubject(idSub);
	}
	public boolean addSubject(Subject sub) {
		return subjectDAO.addSubject(sub);
	}
	public boolean editSubject(Subject sub) {
		return subjectDAO.edit(sub);
	}
	public boolean deleteSubject(int idSub) {
		return subjectDAO.delete(idSub);
	}
	public int countItems() {
		return subjectDAO.countItems();
	}
	public ArrayList<Subject> getListSubjectOffset(int offset) {
		return subjectDAO.getListSubjectOffset(offset);
	}

}
