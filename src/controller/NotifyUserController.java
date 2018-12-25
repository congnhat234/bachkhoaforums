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
import model.bean.Notification;
import model.bean.User;
import model.bo.CommentBO;
import model.bo.FollowBO;
import model.bo.MessageBO;

/**
 * Servlet implementation class NotifyUserController
 */
public class NotifyUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotifyUserController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("id_comment")!=null) {
			int id_comment=Integer.parseInt((String) request.getParameter("id_comment"));
			CommentBO commentBO =new CommentBO();
			commentBO.seenNotitication(id_comment);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		FollowBO flBO= new FollowBO();
		CommentBO commentBO =new CommentBO();
		MessageBO mesBO= new MessageBO();
		int idUser = user.getId_user();
		response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(flBO.getCountUnSeenNoti(idUser)+","+mesBO.getCountUnSeenMess(idUser));
	}
}
