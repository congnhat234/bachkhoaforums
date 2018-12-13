package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.PostBO;
import model.bo.SubjectBO;

/**
 * Servlet implementation class ViewSubjectController
 */
public class ShowPostsBySearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPostsBySearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String searchText = new String(((String) session.getAttribute("searchText")).getBytes("ISO-8859-1"), "UTF-8");
		int page = 1;
		SubjectBO subBO= new SubjectBO();
		PostBO postBO = new PostBO();
		int countPost = postBO.countPostsBySearch(searchText);
		int row_count = 5;
		int sumPage = (int)Math.ceil((float)countPost/row_count);
		request.setAttribute("sumPage", sumPage);

		if(request.getParameter("current_page")!=null){
			page = Integer.parseInt(request.getParameter("current_page"));
		}
		request.setAttribute("page", page);

		int offset = (page-1)*row_count;
		
		request.setAttribute("listpost", postBO.getListPostsBySearch(offset, row_count, searchText));
		request.setAttribute("listsubject", subBO.getListSubject());
		request.setAttribute("listoutstanding", postBO.getListOutStanding());
		RequestDispatcher rd = request.getRequestDispatcher("/posts_search.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		session.removeAttribute("searchText");
		String searchText = new String( request.getParameter("search").getBytes("ISO-8859-1"), "UTF-8");
		int page = 1;
		SubjectBO subBO= new SubjectBO();
		PostBO postBO = new PostBO();
		int countPost = postBO.countPostsBySearch(searchText);
		int row_count = 5;
		int sumPage = (int)Math.ceil((float)countPost/row_count);
		request.setAttribute("sumPage", sumPage);

		if(request.getParameter("current_page")!=null){
			page = Integer.parseInt(request.getParameter("current_page"));
		}
		request.setAttribute("page", page);

		int offset = (page-1)*row_count;
		session.setAttribute("searchText", searchText);
		request.setAttribute("listoutstanding", postBO.getListOutStanding());
		request.setAttribute("listpost", postBO.getListPostsBySearch(offset, row_count, searchText));
		request.setAttribute("listsubject", subBO.getListSubject());
		RequestDispatcher rd = request.getRequestDispatcher("/posts_search.jsp");
		rd.forward(request, response);
	}

}
