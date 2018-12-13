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
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		FollowBO flBO= new FollowBO();
		int idUser = user.getId_user();
		if("yes".equals((String) request.getParameter("view"))) {
			flBO.seenNotitication(idUser);	
		}
		ArrayList<Notification> listNotify = flBO.getListNotify(idUser);
		Gson gson = new Gson();
        JsonElement element = gson.toJsonTree(listNotify, new TypeToken<List<Notification>>(){}.getType());
        JsonArray jsonArray = element.getAsJsonArray();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(jsonArray);
		}


}
