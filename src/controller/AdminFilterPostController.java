package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Post;
import model.bo.MessageBO;
import model.bo.PostBO;
import model.bo.SubjectBO;
import model.bo.UserBO;

/**
 * Servlet implementation class IndexNewsAdminController
 */
public class AdminFilterPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFilterPostController() {
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
		PostBO postBO = new PostBO();
		SubjectBO subBO= new SubjectBO();
		ArrayList<Post> list = postBO.getListPostByFilter();
		for(Post objPost : list) {
			postBO.setStatus(objPost.getId_post(), 0);
		}
		request.setAttribute("listPost", list);
		request.setAttribute("listSub", subBO.getListSubject());
		request.setAttribute("title", "Post");
		UserBO userBO = new UserBO();
		int usersDisabled = userBO.countItems() - userBO.countItemsEnabled();
		request.setAttribute("countUserDisabled", usersDisabled);
		MessageBO messageBO = new MessageBO();
		request.setAttribute("countUnseenMessage", messageBO.countUnseenMessage());
		RequestDispatcher rd = request.getRequestDispatcher("/admin/filterPost.jsp");
		rd.forward(request, response);
	}

}
