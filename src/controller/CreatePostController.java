package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import libraries.FilenameLibrary;
import model.bean.Post;
import model.bean.User;
import model.bo.PostBO;
import model.bo.SubjectBO;
import model.bo.UserBO;
import utils.Constants;

/**
 * Servlet implementation class CreatePostController
 */
@MultipartConfig
public class CreatePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreatePostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SubjectBO subjectBO = new SubjectBO();
		request.setAttribute("listSubject", subjectBO.getListSubject());
		RequestDispatcher rd = request.getRequestDispatcher("/vietbai.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		UserBO userBO = new UserBO();
		int rate = userBO.getRate(user.getId_user()) + 10;
		userBO.setRate(user.getId_user(), rate);
		User userEdited = userBO.findByToken(user.getToken());
		session.setAttribute("user", userEdited);

		int idSubject = Integer.parseInt(request.getParameter("id_subject"));
		String title = new String(request.getParameter("title").getBytes("ISO-8859-1"), "UTF-8");
		String previewContent = new String(request.getParameter("preview_content").getBytes("ISO-8859-1"), "UTF-8");
		String content = new String(request.getParameter("content").getBytes("ISO-8859-1"), "UTF-8");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		Date datef = new Date();
		String date_create = formatter.format(datef);
		String preview_image = "";

		String rootPath = System.getProperty("catalina.home");
		String relativePath = request.getServletContext().getInitParameter("tempfile.dir");
		File file = new File(rootPath + File.separator + relativePath);
		System.out.println(rootPath + File.separator + relativePath);
		if (!file.exists())
			file.mkdirs();
		System.out.println("File Directory created to be used for storing files");
		// request.getServletContext().setAttribute("FILES_DIR_FILE", file);
		String path = rootPath + File.separator + relativePath;

		// real path
		response.setContentType("text/html;charset=UTF-8");
		final String realPath = request.getServletContext().getRealPath("/templates/public/files/post");
		System.out.println(realPath);
		File dirUrl = new File(realPath);
		if (!dirUrl.exists()) {
			try {
				dirUrl.mkdir();
			} catch (Exception e) {
				System.err.println(e);
			}
		}
		// ==
		final Part filePart = request.getPart("preview_image");
		String fileName = FilenameLibrary.getFileName(filePart);
		if (!"".equals(fileName)) {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy_HHmmssSS");
			String time = sdf.format(date.getTime());

			String extension = "";
			int i = fileName.lastIndexOf('.');
			if (i > 0) {
				extension = fileName.substring(i + 1);
			}
			fileName = time + "." + extension;
			OutputStream out = null;
			InputStream filecontent = null;
			preview_image = fileName;
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
		Post post = new Post(0, idSubject, user.getId_user(), user.getUsername(), date_create, title, preview_image, previewContent,
				content, 0, 0);
		PostBO postBO = new PostBO();
		if (postBO.addPost(post)) {
			response.sendRedirect(request.getContextPath() + Constants.URL.HOME);
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.CREATE_POST + "?msg=0");
		}
	}

}
