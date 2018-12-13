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
import model.bo.PostBO;
import model.bo.UserBO;

/**
 * Servlet implementation class ProfileMemberController
 */

public class ProfileMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileMemberController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("idUC") != null) {
			int idUserComment = Integer.parseInt(request.getParameter("idUC"));
			UserBO userBO = new UserBO();
			User user = userBO.findByIDUser(idUserComment);
			request.setAttribute("member", user);
			PostBO postBO = new PostBO();
			request.setAttribute("listpost", postBO.getListPostByUser(user.getUsername()));
			RequestDispatcher rd = request.getRequestDispatcher("/profilemember.jsp");
			rd.forward(request, response);
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
