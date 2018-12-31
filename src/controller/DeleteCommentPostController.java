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
import model.bo.PostBO;

/**
 * Servlet implementation class DeleteCommentPostController
 */
public class DeleteCommentPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCommentPostController() {
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
		int idComment = Integer.parseInt(request.getParameter("aidComment"));
		int idPost = Integer.parseInt(request.getParameter("aidPost"));
		CommentBO commentBO = new CommentBO();
		PostBO postBO = new PostBO();
		Comment comment = commentBO.getComment(idComment);
		if(user.getId_role() == 1 || user.getId_role() == 2 || comment.getId_user() == user.getId_user()) {
			
			if(commentBO.deleteComment(idComment)) {
				ArrayList<Comment> listComment = commentBO.getListComment(idPost);
				for(Comment objComment : listComment) {
					objComment.setLike(postBO.countLikeComment(objComment.getId_comment()));
				}
				request.setAttribute("listComment", listComment);
				request.setAttribute("listLikedComment", postBO.getListLikedComment(idPost));
				Gson gson = new Gson();
		        JsonElement element = gson.toJsonTree(listComment, new TypeToken<List<Comment>>(){}.getType());
		        JsonArray jsonArray = element.getAsJsonArray();
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().println(jsonArray);
			}
		} else {
//			JsonArray jsonArray = null;
//			response.setContentType("application/json");
//	        response.setCharacterEncoding("UTF-8");
//	        response.getWriter().println(jsonArray);
		}
	}

}
