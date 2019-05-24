package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.UserBO;
import utils.Constants;
import utils.ConvertString;
import utils.MailUtil;

/**
 * Servlet implementation class ForgotPassWordController
 */
@WebServlet("/ForgotPassWordController")
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("forgot_password.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = (String) request.getParameter("email");
		String username = (String) request.getParameter("username");
		UserBO userBO = new UserBO();
		String uuid = ConvertString.randomString(16);
	    System.out.println("uuid = " + uuid);
		if(userBO.findByUserNameAndEmail(username, email) > 0) {
			if(userBO.resetPassword(username, uuid)) MailUtil.sendMail(email, uuid);
			response.sendRedirect(request.getContextPath() + Constants.URL.SHOW_LOGIN + "?msg=3");
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.FORGOT_PASSWORD + "?msg=0");
		}
	}

}
