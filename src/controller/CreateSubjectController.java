package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Subject;
import model.bo.SubjectBO;
import model.bo.UserBO;
import utils.Constants;

/**
 * Servlet implementation class CreateSubjectController
 */
public class CreateSubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateSubjectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			UserBO userBO = new UserBO();
			int usersDisabled = userBO.countItems() - userBO.countItemsEnabled();
			request.setAttribute("countUserDisabled", usersDisabled);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/addSub.jsp");
			rd.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newSub= new String( request.getParameter("newSub").getBytes("ISO-8859-1"), "UTF-8");
		String describeSub= new String( request.getParameter("describeSub").getBytes("ISO-8859-1"), "UTF-8");
		SubjectBO subBO= new SubjectBO();
		Subject sub = new Subject(0,newSub,describeSub);
		if( !"".equals(newSub)&& subBO.addSubject(sub)){
			response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_SUBJECT+ "?msg=1");
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.ADD_SUBJECT + "?msg=0");
		}
	}

}
