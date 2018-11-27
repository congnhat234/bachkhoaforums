package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.SubjectBO;

/**
 * Servlet implementation class IndexCatAdminController
 */

public class SubjectAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectAdminController() {
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
		
		
//		int page = 1;
//		CatDAO catDAO = new CatDAO();
//		
//		int countCat = catDAO.countItems();
//		int row_count = 5;
//		int sumPage = (int)Math.ceil((float)countCat/row_count);
//		request.setAttribute("sumPage", sumPage);
//		//lấy trang hiện tại
//		if(request.getParameter("current_page")!=null){
//			page = Integer.parseInt(request.getParameter("current_page"));
//		}
//		request.setAttribute("page", page);
//		//tính offset
//		int offset = (page-1)*row_count;
//		
//		request.setAttribute("listCat", catDAO.getItemsPagition(offset,row_count));
		
		SubjectBO subjectBO = new SubjectBO();
		
		request.setAttribute("listCat", subjectBO.getListSubject());
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/indexSubject.jsp");
		rd.forward(request, response);
	}

}
