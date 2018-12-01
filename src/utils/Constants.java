package utils;

public class Constants {
	
	public static interface FILE_DATA_URL {
//		String PROJECT_DEFAULT = "project_default.json";
//		String BOARD_CONTRUCTION = "board_construction.json";
//		String FEEDER_DATA = "price.csv";
	}
	
	public static interface URL {
		String HOME = "/home";
		String LOGIN = "/login";
		String REGISTER = "/register";
		String FORGOT_PASSWORD = "/forgot-password";
		String RESET_PASSWORD = "/reset-password";
		String LOGOUT = "/logout";
		String USER_HOME = "/user";
		String ADMIN_HOME = "/admin";
		String PROFILE = "/user/profile";
		String CREATE_POST = "/user/create-post";
		String VIEW_POST = "/post";
		String SHOW_POST_BY_SUBJECT = "/subject";
		
		String ADMIN_SUBJECT = "/admin/subject";
		String ADMIN_USER = "/admin/user";
		String ADMIN_POST = "/admin/post";
		String ADD_SUBJECT = "/admin/subjectadd";
		String DELETE_SUBJECT = "/admin/subjectdelete";
		String EDIT_SUBJECT = "/admin/subjectedit";
		String DELETE_USER = "/admin/userdelete";
		String EDIT_USER = "/admin/useredit";
		String ADD_USER = "/admin/useradd";
		String DELETE_POST = "/user/postdelete";
		String SHOW_POST_FOLLOW_USER = "/user/followpost";
		String SHOW_POST_BY_USER = "/user/post";
	}
}
