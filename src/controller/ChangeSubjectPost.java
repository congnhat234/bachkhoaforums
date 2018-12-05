package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.PostBO;

/**
 * Servlet implementation class ChangeSubjectPost
 */
public class ChangeSubjectPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeSubjectPost() {
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

			PostBO postBO = new PostBO();
			int idSub = Integer.parseInt(request.getParameter("sid").trim());
			int idPost1 = Integer.parseInt(request.getParameter("pid").trim());		
			System.out.println("kkkk"+idSub+idPost1);
			
			if(postBO.changeSubjectPost(idSub,idPost1))
				System.out.println("chuyển ok");
			else 
				System.out.println("chuyển ko ok");
		
		

	}

}
