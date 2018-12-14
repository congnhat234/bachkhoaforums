package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Notification;
import model.bean.User;
import model.bo.FollowBO;
import model.bo.PostBO;

/**
 * Servlet implementation class NotificationPageController
 */
public class NotificationPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		int idUser = user.getId_user();
		FollowBO flBO= new FollowBO();
		int countNews = flBO.getCountNoti(idUser);

		int row_count = 5;
		int sumPage = (int)Math.ceil((float)countNews/row_count);
		request.setAttribute("sumPage", sumPage);
		int page = 1;
		if(request.getParameter("current_page")!=null){
			page = Integer.parseInt(request.getParameter("current_page"));
		}
		request.setAttribute("page", page);
		int offset = (page-1)*row_count;
	
		
		ArrayList<Notification> listNotify = flBO.getListNotify(idUser,offset,row_count);
		request.setAttribute("listnotify",listNotify );
		
		RequestDispatcher rd = request.getRequestDispatcher("/notify.jsp");
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
