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
import utils.ConvertString;
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
		request.setAttribute("title", "setting");
		RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		String fullname = new String( request.getParameter("fullname").getBytes("ISO-8859-1"), "UTF-8");
		String phone = (String) request.getParameter("phone");
		String email = (String) request.getParameter("email");
		int gender = Integer.parseInt((String) request.getParameter("gender"));
		String birthday = (String) request.getParameter("birthday");
		String address = new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
		String city = new String(request.getParameter("city").getBytes("ISO-8859-1"), "UTF-8");
		String avatar = user.getAvatar();
		
		//Tomcat path
		String rootPath = System.getProperty("catalina.home");
		String relativePath = request.getServletContext().getInitParameter("userfile.dir");
		File file = new File(rootPath + File.separator + relativePath);
		if(!file.exists()) file.mkdirs();
		System.out.println("File Directory created to be used for storing files");
		//request.getServletContext().setAttribute("FILES_DIR_FILE", file);
		String path = rootPath + File.separator + relativePath;
		System.out.println(path);
		
		//real path
		response.setContentType("text/html;charset=UTF-8");
		final String realPath = request.getServletContext().getRealPath("/templates/public/files");
		System.out.println(realPath);
		File dirUrl = new File(realPath);
		if (!dirUrl.exists()){
			dirUrl.mkdir();
		}
		//==
		
		//save files folder path
		String currentFolderPath = request.getServletContext().getRealPath("");
		File fileCurent = new File(currentFolderPath);
		File fileParent = new File(fileCurent.getParent());
		String tmpPath = fileParent.getParent();
		File saveImgFolder = new File(tmpPath + "/webapps/save/images/");
		if(!saveImgFolder.exists()) saveImgFolder.mkdirs();
		
		final Part filePart = request.getPart("avatar");
		String fileName = FilenameLibrary.getFileName(filePart);
		if(!"".equals(fileName)){
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("HHmmssSS");
			String time = sdf.format(date.getTime());
			String randomStr = ConvertString.randomString(8);
			String extension = "";
			int i =  fileName.lastIndexOf('.');
			if (i > 0) {
			    extension = fileName.substring(i+1); 
			}
			fileName = randomStr + "_" + time + "." + extension;
			OutputStream out = null;
			InputStream filecontent = null;
			avatar = fileName;
			try {
				System.out.println("Absolute Path at server= " + file.getAbsolutePath());
//				out = new FileOutputStream(new File(realPath + File.separator + fileName));
//				out = new FileOutputStream(new File(path + File.separator + fileName));
				out = new FileOutputStream(new File(saveImgFolder + File.separator + fileName));
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
		if("".equals(avatar)) {
			avatar=user.getAvatar();
		}
		System.out.println("avatar"+avatar);
		User userEdit = new User(0,user.getId_role(),user.getUsername(),user.getPassword(),user.getToken(),fullname,address,city,gender,email,phone,birthday,user.getDate_join(),avatar,0,0);
		UserBO userBO = new UserBO();
		if(userBO.edit(userEdit)) {
			String picture = user.getAvatar();
			if(!avatar.equals(picture) ){		
				String urlDelFile = realPath + File.separator + picture;
				File delFile = new File(urlDelFile);
				delFile.delete();
			}
			User userEdited = userBO.findByToken(user.getToken());
			session.setAttribute("user", userEdited);
			response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE + "?msg=1");
		} else {
			response.sendRedirect(request.getContextPath() + Constants.URL.PROFILE + "?msg=0");
		}
	}

}
