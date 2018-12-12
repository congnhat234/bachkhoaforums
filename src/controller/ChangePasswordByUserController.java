package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
 * Servlet implementation class ChangePasswordByUserController
 */
@MultipartConfig
public class ChangePasswordByUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordByUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/changepassword.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int idUser= user.getId_user();
		System.out.println(idUser);
		UserBO userBO = new UserBO();
		String oldpassword = (String) request.getParameter("oldpassword");
		if(request.getParameter("oldpassword")!= null ){
		if(user.getPassword().equals(CryptoUtils.md5(oldpassword))){
		String password = (String) request.getParameter("password");
		String passwordCryp = CryptoUtils.md5(password);
		String token = CryptoUtils.md5(user.getUsername() + password);	
		 if(userBO.changePassWord(idUser,token,passwordCryp)){
				User userEdited = userBO.findByToken(token);
				request.setAttribute("user", userEdited);
				Cookie cookie = new Cookie("token", token);
				response.addCookie(cookie);
				session.setAttribute("user", user);
				response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE  + "?msg=1");
			} else {
				response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE  + "?msg=0");
			}
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.CHANGE_PASS_USER  + "?msg=3");	
		}
	} else {
		 response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE  + "?msg=0");
	}

	}

}
