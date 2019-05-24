package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bo.CommentBO;
import model.bo.FollowBO;
import model.bo.PostBO;
import model.bo.SubjectBO;
import model.bo.UserBO;
import utils.Constants;

/**
 * Servlet implementation class DeleteUserController
 */
@WebServlet("/DeleteUserController")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idUser=Integer.parseInt(request.getParameter("uid"));
		UserBO userBO= new UserBO();
		User user=userBO.findByIDUser(idUser);
		PostBO postBO= new PostBO();
		CommentBO cmtBO= new CommentBO();
		FollowBO followBO= new FollowBO();
		//xoa post by id_user
		postBO.deletePostByUser(user.getUsername());
		//xoa comment by id_user
		cmtBO.deleteCommentByUser(idUser);
		//xoa follow by id_user
		followBO.deleteFollowByUser(idUser);
		//xoa like_post by id_user
		postBO.deleteLikePostByUser(idUser);
		//xoa like_comment by id_user
		cmtBO.deleteLikeCommentByUser(idUser);
		if(userBO.delete(idUser)){
			response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_USER+"?msg=2");	
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
