package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.PostBO;
import model.bo.SubjectBO;

/**
 * Servlet implementation class IndexNewsAdminController
 */
public class PostAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PostBO postBO = new PostBO();
		SubjectBO subBO= new SubjectBO();
		request.setAttribute("listPost", postBO.getListPostAll());
		request.setAttribute("listSub", subBO.getListSubject());
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/indexPost.jsp");
		rd.forward(request, response);
	}

}
