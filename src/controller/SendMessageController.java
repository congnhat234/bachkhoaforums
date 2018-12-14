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
import javax.servlet.http.HttpSession;

import model.bean.Message;
import model.bean.User;
import model.bo.MessageBO;
import model.bo.PostBO;
import model.bo.SubjectBO;
import model.bo.UserBO;
import utils.CryptoUtils;

/**
 * Servlet implementation class RegisterController
 */

public class SendMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostBO postBO = new PostBO();
		SubjectBO subjectBO =new SubjectBO();
		request.setAttribute("listsubject", subjectBO.getListSubject());
		request.setAttribute("listoutstanding", postBO.getListOutStanding());
		RequestDispatcher rd = request.getRequestDispatcher("/create_message.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		int idUser = user.getId_user();
		String email = (String) request.getParameter("email");
		String messageContent = new String(((String) request.getParameter("message")).getBytes("ISO-8859-1"), "UTF-8");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");  
	    Date date = new Date(); 
	    String dateCreate = formatter.format(date);
		Message message = new Message(0, idUser, email, messageContent, "", dateCreate, 1, 1);
		MessageBO messageBO = new MessageBO();
		if(messageBO.addMessage(message)) {
			RequestDispatcher rd = request.getRequestDispatcher("/message.jsp"+"?msg=1");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/create_message.jsp"+"?msg=0");
			rd.forward(request, response);
		}
	}

}
