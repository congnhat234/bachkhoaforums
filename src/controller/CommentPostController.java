package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import model.bo.UserBO;

/**
 * Servlet implementation class CommentPostController
 */
public class CommentPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentPostController() {
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
		int idPost = Integer.parseInt(request.getParameter("aid"));
		String commentContent = request.getParameter("acmt");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		UserBO userBO = new UserBO();
		int rate = userBO.getRate(user.getId_user()) + 1;
		userBO.setRate(user.getId_user(), rate);
		User userEdited = userBO.findByToken(user.getToken());
		session.setAttribute("user", userEdited);
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");  
	    Date datef = new Date();  
	    String date_create = formatter.format(datef);
		
		Comment comment = new Comment(0,idPost,user.getId_user(),date_create,commentContent,user.getUsername(),1);
		
		CommentBO commentBO =new CommentBO();
		if(commentBO.addComment(comment)) {
		ArrayList<Comment> listComment = commentBO.getListComment(idPost);
		request.setAttribute("listComment", listComment);
		Gson gson = new Gson();
        JsonElement element = gson.toJsonTree(listComment, new TypeToken<List<Comment>>(){}.getType());
        JsonArray jsonArray = element.getAsJsonArray();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(jsonArray);
		} else {
			
		}
	}

}
