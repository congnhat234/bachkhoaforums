package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Comment;
import model.bean.Post;
import model.bo.CommentBO;
import model.bo.FollowBO;
import model.bo.PostBO;
import utils.Constants;

/**
 * Servlet implementation class DeletePostController
 */
public class DeletePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idPost=Integer.parseInt(request.getParameter("del"));
		System.out.println("kkkkkkkkkkkkk"+idPost);
		PostBO postBO= new PostBO();
		FollowBO followBO= new FollowBO();
		CommentBO cmtBO= new CommentBO();
		ArrayList<Comment> listComment= null;
			//xoa like_comment by comment_id
			listComment= cmtBO.getListComment(idPost);
			for(Comment objCmt :listComment){
				cmtBO.deleteLikeCommentByComment(objCmt.getId_comment());
			}
			//xoa follow theo id_post
			followBO.deleteFollowByPost(idPost);
			//xoa like_post theo id_post
			postBO.deleteLikePostByPost(idPost);
			//xoa comment by id_post
			cmtBO.deleteCommentByPost(idPost);
		if(postBO.deletePost(idPost)){
			response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_POST);	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
