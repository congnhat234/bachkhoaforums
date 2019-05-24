package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.bo.UserBO;
import utils.Constants;
import utils.CryptoUtils;

/**
 * Servlet implementation class LoginController
 */

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		HttpSession session = request.getSession(false);
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String token = CryptoUtils.md5(username + password);
		
		UserBO userService = new UserBO();
		User user = userService.findByToken(token);
		if(user != null) {
			Cookie cookie = new Cookie("token", token);
			response.addCookie(cookie);
			session.setAttribute("user", user);
			if(user.getId_role() == 1) {
				response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_HOME);
			} else {
				response.sendRedirect(request.getHeader("referer"));
			}
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.SHOW_LOGIN + "?msg=0");
		}
	}

}
