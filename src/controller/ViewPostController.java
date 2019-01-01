package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Comment;
import model.bean.User;
import model.bo.CommentBO;
import model.bo.PostBO;
import model.bo.SubjectBO;

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
		HttpSession session = ((HttpServletRequest) request).getSession(false);
		
		int idPost = Integer.parseInt(request.getParameter("idp"));
		PostBO postBO = new PostBO();
		CommentBO commentBO =new CommentBO();		
		int view = postBO.getViewPost(idPost)+1;
		System.out.println("view"+view);
		postBO.setViewPost(idPost, view);
		SubjectBO subjectBO =new SubjectBO();
		ArrayList<Comment> listComment = commentBO.getListComment(idPost);
		for(Comment objComment : listComment) {
			objComment.setLike(postBO.countLikeComment(objComment.getId_comment()));
		}
		request.setAttribute("listsubject", subjectBO.getListSubject());
		request.setAttribute("listComment", listComment);
		request.setAttribute("listpost",postBO.getListPost());
		request.setAttribute("post", postBO.getPost(idPost));
		request.setAttribute("countLikePost", postBO.countLike(idPost));
		request.setAttribute("listLikedComment", postBO.getListLikedComment(idPost));
		request.setAttribute("listoutstanding", postBO.getListOutStanding());
		if(session.getAttribute("user")!=null) {
			User user = (User) session.getAttribute("user");
			request.setAttribute("likedByUser", postBO.likedByUser(idPost, user.getId_user()));
			request.setAttribute("followedByUser", postBO.followedByUser(idPost, user.getId_user()));
		}
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
