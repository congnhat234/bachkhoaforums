package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.MessageBO;
import model.bo.PostBO;
import model.bo.UserBO;

/**
 * Servlet implementation class IndexAdminController
 */

public class IndexAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexAdminController() {
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
		UserBO userBO = new UserBO();
		PostBO postBO = new PostBO();
		request.setAttribute("listPost", postBO.getListPostAll());
		int usersDisabled = userBO.countItems() - userBO.countItemsEnabled();
		request.setAttribute("countUserDisabled", usersDisabled);
		request.setAttribute("title", "Admin");
		MessageBO messageBO = new MessageBO();
		request.setAttribute("countUnseenMessage", messageBO.countUnseenMessage());
		RequestDispatcher rd = request.getRequestDispatcher("/admin/index.jsp");
		rd.forward(request, response);
	}

}
