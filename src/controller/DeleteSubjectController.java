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
import model.bo.SubjectBO;
import utils.Constants;

/**
 * Servlet implementation class DeleteSubjectController
 */
public class DeleteSubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSubjectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idSub=Integer.parseInt(request.getParameter("del"));
		SubjectBO subBO= new SubjectBO();
		PostBO postBO= new PostBO();
		FollowBO followBO= new FollowBO();
		CommentBO cmtBO= new CommentBO();
		ArrayList<Post> listpost= postBO.getPostSubject(idSub);
		ArrayList<Comment> listComment= null;
		for(Post objPost : listpost) {
			//xoa like_comment by comment_id
			listComment= cmtBO.getListComment(objPost.getId_post());
			for(Comment objCmt :listComment){
				cmtBO.deleteLikeCommentByComment(objCmt.getId_comment());
			}
			//xoa follow theo id_post
			followBO.deleteFollowByPost(objPost.getId_post());
			//xoa like_post theo id_post
			postBO.deleteLikePostByPost(objPost.getId_post());
			//xoa comment by id_post
			cmtBO.deleteCommentByPost(objPost.getId_post());
			//xoa post by idsub
			postBO.deletePostByIdSub(idSub);
		}
		if( subBO.deleteSubject(idSub)){
			response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_SUBJECT+"?msg=2");	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
