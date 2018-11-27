package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.PostBO;

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
		
		
//		NewsDAO newsDAO = new NewsDAO();
//		int countNews = newsDAO.countItems();
//		int row_count = 5;
//		int sumPage = (int)Math.ceil((float)countNews/row_count);
//		request.setAttribute("sumPage", sumPage);
//		int page = 1;
//		if(request.getParameter("current_page")!=null){
//			page = Integer.parseInt(request.getParameter("current_page"));
//		}
//		request.setAttribute("page", page);
//		int offset = (page-1)*row_count;
//		
		PostBO postBO = new PostBO();
		request.setAttribute("listPost", postBO.getListPost());
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/indexPost.jsp");
		rd.forward(request, response);
	}

}
