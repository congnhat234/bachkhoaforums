package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.MessageBO;
import model.bo.PostBO;
import model.bo.SubjectBO;

/**
 * Servlet implementation class MessageDetailController
 */
public class MessageDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idMessage = Integer.parseInt((String) request.getParameter("idM"));
		PostBO postBO = new PostBO();
		SubjectBO subjectBO =new SubjectBO();
		MessageBO messageBO = new MessageBO();
		messageBO.setSeenMess(idMessage);
		request.setAttribute("title","message");
		request.setAttribute("objMessage", messageBO.getMessage(idMessage));
		request.setAttribute("listsubject", subjectBO.getListSubject());
		request.setAttribute("listoutstanding", postBO.getListOutStanding());
		RequestDispatcher rd = request.getRequestDispatcher("/message_detail.jsp");
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
