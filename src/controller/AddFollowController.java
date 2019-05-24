package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.bean.Follow;
import model.bo.UserBO;
import model.bo.FollowBO;
import model.bo.PostBO;


/**
 * Servlet implementation class AddFollowController
 */
public class AddFollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFollowController() {
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
		int idUser = user.getId_user();
		int idPost = Integer.parseInt(request.getParameter("aid"));
		PostBO postBO = new PostBO();
		 Follow follow = new Follow(0,idPost,idUser,0);
		 FollowBO flBO = new FollowBO();
		 
			if(postBO.followedByUser(idPost, user.getId_user()) != 0) {
				if(flBO.deleteFollowPostByUser(idPost, user.getId_user())) {
					response.setContentType("text/html");
			        response.setCharacterEncoding("UTF-8");
			        response.getWriter().print( " Theo dõi");
				}
			} else if(flBO.add(follow)) {
				response.setContentType("text/html");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().print( "Đã theo dõi");
			}

	}

}
