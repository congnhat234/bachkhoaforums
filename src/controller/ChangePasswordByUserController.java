package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
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
		doPost(request, response);
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
		if(request.getParameter("password").equals(request.getParameter("repassword"))) {
		String password = (String) request.getParameter("password");
		String passwordCryp = CryptoUtils.md5(password);
		String token = CryptoUtils.md5(user.getUsername() + password);	
		 User userid = new User(0,user.getId_role(),user.getUsername(),passwordCryp,token,user.getFullname(),user.getAddress(),user.getCity(),user.getGender(),user.getEmail(),user.getPhone(),user.getBirthhday(),user.getDate_join(),user.getAvatar(),0,0);
		 if(userBO.edit(userid)){
				User userEdited = userBO.findByToken(user.getToken());
				request.setAttribute("user", userEdited);
				response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE  + "?msg=1");
			} else {
				response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE  + "?msg=0");
			}
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE  + "?msg=3");	
		}
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE  + "?msg=2");
		}
	} else {
		 response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE  + "?msg=0");
	}

	}

}
