package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Post;
import model.bean.User;
import model.bo.CommentBO;
import model.bo.PostBO;
import model.bo.UserBO;


/**
 * Servlet implementation class ShowPostFollowUserController
 */

public class ShowPostFollowUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPostFollowUserController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int idUser= user.getId_user();
			PostBO postBO = new PostBO();
			UserBO userBO= new UserBO();
			request.setAttribute("listpostfl",postBO.getListPostFolowUser(idUser));
			ArrayList<Post> listpostfl=postBO.getListPostFolowUser(idUser);
			int []amoutAnwser= new int [listpostfl.size()];
			int []idLastUser= new int [listpostfl.size()];
			String []lastUser= new String [listpostfl.size()];
			for(int i=0;i<listpostfl.size();i++){
				amoutAnwser[i]=postBO.getAmountAnwserPost(listpostfl.get(i).getId_post());
				idLastUser[i]=postBO.getIdUserLastComment(listpostfl.get(i).getId_post());
				if(idLastUser[i]==0)
					lastUser[i]="";
				else
				lastUser[i]=userBO.findByIDUser(idLastUser[i]).getUsername();	
			}
			request.setAttribute("listAmountAnswer",amoutAnwser);
			request.setAttribute("listLastUser",lastUser);
			RequestDispatcher rd = request.getRequestDispatcher("/followArticle.jsp");
			rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
