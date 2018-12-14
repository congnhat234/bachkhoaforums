package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Subject;
import model.bo.SubjectBO;
import model.bo.UserBO;
import utils.Constants;

/**
 * Servlet implementation class EditSubjectController
 */
public class EditSubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSubjectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int idSub= Integer.parseInt(request.getParameter("cid")) ;	
			SubjectBO subBO= new SubjectBO();
			request.setAttribute("nameSub", subBO.getSubject(idSub));
			UserBO userBO = new UserBO();
			int usersDisabled = userBO.countItems() - userBO.countItemsEnabled();
			request.setAttribute("countUserDisabled", usersDisabled);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editSub.jsp");
			rd.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newSub= new String(request.getParameter("newSub").getBytes("ISO-8859-1"), "UTF-8") ;
		String describeSub= new String(request.getParameter("describeSub").getBytes("ISO-8859-1"), "UTF-8") ;
		System.out.println(describeSub);
		int idSub= Integer.parseInt(request.getParameter("cid")) ;	
		SubjectBO subBO= new SubjectBO();
		Subject sub = new Subject(idSub,newSub,describeSub);
		System.out.println(sub.getDescribe());
		if( !"".equals(newSub) && subBO.editSubject(sub)){
			response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_SUBJECT+"?msg=1");			
		}else {
			response.sendRedirect(request.getContextPath() + Constants.URL.EDIT_SUBJECT+"?msg=0"+"&cid="+idSub);
		}
	}

}
