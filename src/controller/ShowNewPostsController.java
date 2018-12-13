package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.PostBO;
import model.bo.SubjectBO;

/**
 * Servlet implementation class ViewSubjectController
 */
public class ShowNewPostsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowNewPostsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		SubjectBO subBO= new SubjectBO();
		PostBO postBO = new PostBO();
		int countPost = postBO.countItemsNewPosts();
		int row_count = 5;
		int sumPage = (int)Math.ceil((float)countPost/row_count);
		request.setAttribute("sumPage", sumPage);

		if(request.getParameter("current_page")!=null){
			page = Integer.parseInt(request.getParameter("current_page"));
		}
		request.setAttribute("page", page);

		int offset = (page-1)*row_count;
		
		request.setAttribute("listpost", postBO.getListNewPosts(offset, row_count));
		request.setAttribute("listsubject", subBO.getListSubject());
		RequestDispatcher rd = request.getRequestDispatcher("/newposts.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
