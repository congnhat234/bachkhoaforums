package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.bo.PostBO;
import model.bo.UserBO;

/**
 * Servlet implementation class LikePostController
 */
public class LikeCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = ((HttpServletRequest) request).getSession(false);
		User user = (User) session.getAttribute("user");
		int idComment = Integer.parseInt(request.getParameter("aidcomment"));
		PostBO postBO = new PostBO();
		if(postBO.likedCommentByUser(idComment, user.getId_user()) > 0) {
			if(postBO.deleteLikedCommentByUser(idComment, user.getId_user())) {
				response.setContentType("text/html");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().print(postBO.countLikeComment(idComment) + " Thích");
			}
		} else
		if(postBO.likeComment(idComment, user.getId_user())) {
			response.setContentType("text/html");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().print(postBO.countLikeComment(idComment) + " Thích");
		}
	}

}
