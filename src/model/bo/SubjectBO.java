package model.bo;

import java.util.ArrayList;

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

}
