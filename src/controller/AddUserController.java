package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bo.UserBO;
import utils.Constants;
import utils.CryptoUtils;

/**
 * Servlet implementation class AddUserController
 */
public class AddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBO userBO = new UserBO();
		int usersDisabled = userBO.countItems() - userBO.countItemsEnabled();
		request.setAttribute("countUserDisabled", usersDisabled);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/addUser.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getParameter("username");
		String fullname= new String( request.getParameter("fullname").getBytes("ISO-8859-1"), "UTF-8");
		String password = (String) request.getParameter("password");
		int role = Integer.parseInt(request.getParameter("role"));
		String passwordCryp = CryptoUtils.md5(password);
		String token = CryptoUtils.md5(username + password);
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    Date date = new Date();  
	    String date_join = formatter.format(date);
	    String mess="";
		User user = new User(0,role,username,passwordCryp,token,fullname,mess,mess,0,mess,mess,mess,date_join,"noimage.jpg",0,0);
		UserBO userBO = new UserBO();
		if(userBO.add(user)) {
			response.sendRedirect(request.getContextPath() + Constants.URL.ADMIN_USER + "?msg=1");
		} else {
			
			response.sendRedirect(request.getContextPath() + Constants.URL.ADD_USER + "?msg=0");
		}
	}

}
