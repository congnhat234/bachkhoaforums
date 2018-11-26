package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.CommentBO;
import model.bo.PostBO;

/**
 * Servlet implementation class ViewPost
 */

public class ViewPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPostController() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idPost = Integer.parseInt(request.getParameter("idp"));
		PostBO postBO = new PostBO();
		CommentBO commentBO =new CommentBO();
		request.setAttribute("listComment", commentBO.getListComment(idPost));
		request.setAttribute("listpost",postBO.getListPost());
		request.setAttribute("post", postBO.getPost(idPost));
		
		RequestDispatcher rd = request.getRequestDispatcher("/xembai.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
