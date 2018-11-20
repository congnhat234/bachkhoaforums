package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import libraries.FilenameLibrary;
import model.bean.User;
import model.bo.UserBO;
import utils.Constants;
import utils.CryptoUtils;

/**
 * Servlet implementation class ProfileController
 */
@MultipartConfig
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		String fullname = (String) request.getParameter("fullname");
		String phone = (String) request.getParameter("phone");
		String email = (String) request.getParameter("email");
		int gender = Integer.parseInt((String) request.getParameter("gender"));
		String birthday = (String) request.getParameter("birthday");
		String address = (String) request.getParameter("address");
		String city = (String) request.getParameter("city");
		String avatar = "";
		
		String rootPath = System.getProperty("catalina.home");
		String relativePath = request.getServletContext().getInitParameter("tempfile.dir");
		File file = new File(rootPath + File.separator + relativePath);
		System.out.println(rootPath + File.separator + relativePath);
		if(!file.exists()) file.mkdirs();
		System.out.println("File Directory created to be used for storing files");
		//request.getServletContext().setAttribute("FILES_DIR_FILE", file);
		String path = rootPath + File.separator + relativePath;
		
		//real path
		response.setContentType("text/html;charset=UTF-8");
		final String realPath = request.getServletContext().getRealPath("/templates/public/files");
		System.out.println(realPath);
		File dirUrl = new File("/templates/public/files");
		if (!dirUrl.exists()){
			dirUrl.mkdir();
		}
		//==
		final Part filePart = request.getPart("avatar");
		String fileName = FilenameLibrary.getFileName(filePart);
		if(!"".equals(fileName)){
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy_HHmmssSS");
			String time = sdf.format(date.getTime());
			
			String extension = "";
			int i = fileName.lastIndexOf('.');
			if (i > 0) {
			    extension = fileName.substring(i+1); 
			}
			fileName = time + "." + extension;
			OutputStream out = null;
			InputStream filecontent = null;
			avatar = fileName;
			try {
				System.out.println("Absolute Path at server= " + file.getAbsolutePath());
				out = new FileOutputStream(new File(realPath + File.separator + fileName));
				filecontent = filePart.getInputStream();
				int read = 0;
				final byte[] bytes = new byte[1024];
				while ((read = filecontent.read(bytes)) != -1) {
					out.write(bytes, 0, read);
				}
			} catch (FileNotFoundException fne) {
				fne.printStackTrace();
			} finally {
				if (out != null) {
					out.close();
				}
				if (filecontent != null) {
					filecontent.close();
				}
			}
		}
		
		User userEdit = new User(0,3,user.getUsername(),user.getPassword(),user.getToken(),fullname,address,city,gender,email,phone,birthday,user.getDate_join(),avatar,0,0);
		UserBO userBO = new UserBO();
		if(userBO.edit(userEdit)) {
			User userEdited = userBO.findByToken(user.getToken());
			session.setAttribute("user", userEdited);
			response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE + "?msg=1");
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE + "?msg=0");
		}
	}

}
