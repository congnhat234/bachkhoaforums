package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.UserBO;
import utils.Constants;

/**
 * Servlet implementation class EditUserController
 */
public class EditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int idUser= Integer.parseInt(request.getParameter("uid"));
			System.out.println(idUser);
			UserBO user= new UserBO();
			request.setAttribute("user",user.findByIDUser(idUser) );
			RequestDispatcher dr =request.getRequestDispatcher("/admin/editUser.jsp");
			dr.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dr =request.getRequestDispatcher(request.getContextPath()+Constants.URL.ADMIN_USER);
		dr.forward(request, response);
	}

}
