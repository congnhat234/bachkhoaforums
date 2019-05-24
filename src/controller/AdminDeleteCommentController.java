package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import model.bean.Comment;
import model.bean.User;
import model.bo.CommentBO;
import utils.Constants;

/**
 * Servlet implementation class DeleteCommentPostController
 */
public class AdminDeleteCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteCommentController() {
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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int idComment = Integer.parseInt(request.getParameter("del"));
		CommentBO commentBO = new CommentBO();
		if(user.getId_role() == 1 || user.getId_role() == 2) {
			if(commentBO.deleteComment(idComment)) {
				response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_FILTER_COMMENT+"?msg=1");
			} else {
				response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_FILTER_COMMENT+"?msg=0");
			}
		} 
	}

}
