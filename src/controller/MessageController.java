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
import model.bo.MessageBO;
import model.bo.PostBO;
import model.bo.SubjectBO;

/**
 * Servlet implementation class MessageController
 */
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		request.setAttribute("title", "message");
		PostBO postBO = new PostBO();
		SubjectBO subjectBO =new SubjectBO();
		MessageBO messageBO = new MessageBO();
		request.setAttribute("listsubject", subjectBO.getListSubject());
		request.setAttribute("listoutstanding", postBO.getListOutStanding());
		request.setAttribute("listMessage", messageBO.getListMessageByUser(user.getId_user()));
		RequestDispatcher rd = request.getRequestDispatcher("/message.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
