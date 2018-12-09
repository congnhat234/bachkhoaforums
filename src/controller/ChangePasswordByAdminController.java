package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bo.UserBO;
import utils.Constants;
import utils.CryptoUtils;

/**
 * Servlet implementation class ChangePasswordController
 */
@MultipartConfig
public class ChangePasswordByAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordByAdminController() {
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
		int idUser= Integer.parseInt(request.getParameter("uid"));
		System.out.println(idUser);
		UserBO userBO = new UserBO();
		User user=userBO.findByIDUser(idUser);
		if(request.getParameter("password").equals(request.getParameter("repassword"))){				
		String password = (String) request.getParameter("password");
		String passwordCryp = CryptoUtils.md5(password);
		String token = CryptoUtils.md5(user.getUsername() + password);	
		 User userid = new User(0,user.getId_role(),user.getUsername(),passwordCryp,token,user.getFullname(),user.getAddress(),user.getCity(),user.getGender(),user.getEmail(),user.getPhone(),user.getBirthhday(),user.getDate_join(),user.getAvatar(),0,0);
		 if(userBO.edit(userid)){
				User userEdited = userBO.findByToken(user.getToken());
				request.setAttribute("user", userEdited);
				response.sendRedirect(request.getContextPath() + Constants.URL.EDIT_USER +"?uid="+idUser + "&msg=1");
			} else {
				response.sendRedirect(request.getContextPath() + Constants.URL.EDIT_USER +"?uid="+idUser + "&msg=0");
			}
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.EDIT_USER +"?uid="+idUser + "&msg=2");		
		}
	}
}
