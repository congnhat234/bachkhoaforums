package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.MessageBO;
import model.bo.UserBO;
import utils.Constants;

/**
 * Servlet implementation class MessageAdminReplyController
 */
public class MessageAdminReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageAdminReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Message");
		int idMessage = Integer.parseInt((String) request.getParameter("idM"));
		UserBO userBO = new UserBO();
		int usersDisabled = userBO.countItems() - userBO.countItemsEnabled();
		request.setAttribute("countUserDisabled", usersDisabled);
		MessageBO messageBO = new MessageBO();
		messageBO.setSeen(idMessage);
		request.setAttribute("objMessage", messageBO.getMessage(idMessage));
		request.setAttribute("countUnseenMessage", messageBO.countUnseenMessage());
		RequestDispatcher rd = request.getRequestDispatcher("/admin/messageReply.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Message");
		int idMessage = Integer.parseInt((String) request.getParameter("idM"));
		String messageReply = new String(((String) request.getParameter("content")).getBytes("ISO-8859-1"), "UTF-8");
		MessageBO messageBO = new MessageBO();
		if(messageBO.replyMessage(idMessage, messageReply)) {
			response.sendRedirect(request.getContextPath() + Constants.URL.MESSAGEADMIN + "?msg=1");
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.MESSAGEADMINREPLY + "?msg=0");
		}
	}

}
