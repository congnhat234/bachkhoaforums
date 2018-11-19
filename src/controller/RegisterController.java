package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bo.UserBO;
import utils.CryptoUtils;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		String passwordCryp = CryptoUtils.md5(password);
		String token = CryptoUtils.md5(username + password);
		String fullname = (String) request.getParameter("fullname");
		String phone = (String) request.getParameter("phone");
		String email = (String) request.getParameter("email");
		int gender = Integer.parseInt((String) request.getParameter("gender"));
		String day = (String) request.getParameter("day");
		String month = (String) request.getParameter("month");
		String year = (String) request.getParameter("year");
		String birthday = day + "/" + month + "/" + year;
		String address = (String) request.getParameter("address");
		String city = (String) request.getParameter("city");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    Date date = new Date();  
	    String date_join = formatter.format(date);
		User user = new User(0,3,username,passwordCryp,token,fullname,address,city,gender,email,phone,birthday,date_join,"",0,0);
		UserBO userBO = new UserBO();
		if(userBO.add(user)) {
			
		} else {
			
		}
	}

}
