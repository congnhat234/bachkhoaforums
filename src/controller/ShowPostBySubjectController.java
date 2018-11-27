package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Subject;
import model.bo.PostBO;
import model.bo.SubjectBO;

/**
 * Servlet implementation class ViewSubjectController
 */
public class ShowPostBySubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPostBySubjectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idSub = Integer.parseInt(request.getParameter("sub"));
		request.setAttribute("idSub", idSub);
		PostBO postBO = new PostBO();
		SubjectBO subBO= new SubjectBO();
		request.setAttribute("objSub", subBO.getSubject(idSub));
		request.setAttribute("listpost", postBO.getPostSubject(idSub));
		RequestDispatcher rd = request.getRequestDispatcher("/postbysubject.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
