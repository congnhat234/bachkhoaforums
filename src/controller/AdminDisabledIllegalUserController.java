package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Comment;
import model.bean.Post;
import model.bean.User;
import model.bo.CommentBO;
import model.bo.PostBO;
import model.bo.UserBO;
import utils.Constants;

/**
 * Servlet implementation class EnableUserAdminController
 */

public class AdminDisabledIllegalUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDisabledIllegalUserController() {
        super();

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
		String type = request.getParameter("type");
		UserBO userBO = new UserBO();
		PostBO postBO = new PostBO();
		CommentBO commentBO = new CommentBO();
		if("post".equals(type)) {
			ArrayList<Post> list = postBO.getListPostByFilter();
			for(Post objPost : list) {
				if(!userBO.setStatus(objPost.getId_user(), 0)) {
					response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_FILTER_POST + "?msg=0");
					return;
				}
			}
			response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_FILTER_POST + "?msg=1");
		} else {
			if("comment".equals(type)) {
				ArrayList<Comment> list = commentBO.getListCommentByFilter();
				for(Comment objComment : list) {
					if(!userBO.setStatus(objComment.getId_user(), 0)) {
						response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_FILTER_COMMENT + "?msg=0");
						return;
					}
				}
				response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_FILTER_COMMENT + "?msg=1");
			}
		}
	}

}
