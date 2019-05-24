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
		String SHOW_LOGIN = "/show-login";
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
		String SHOW_POST_NEW = "/new";
		
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
		String EDIT_POST_BY_USER = "/user/editpost";
		String ENABLE_POST = "/admin/post/enable";
		String ENABLE_USER = "/admin/user/enable";
		String CHANGE_SUB = "/admin/post/change";
		String CHANGE_PASS_ADMIN = "/admin/user/changepass";
		String CHANGE_PASS_USER = "/user/changepass";
		String FOLLOW_POST = "/user/follow";
		String NOTIFICATION = "/user/notification";
		String NOTIFICATION_PAGE = "/user/notificationpage";
		
		
		String COMMENT_POST = "/user/post/comment";
		String LIKE_COMMENT_POST = "/user/post/comment/like";
		String DELETE_COMMENT_POST = "/user/post/comment/delete";
		String LIKE_POST = "/user/post/like";
		String PROFILEMEMBER="/user/profilemember";
		
		String SEARCH_POST = "/search";
		
		String SENDMESSAGE = "/user/sendmessage";
		String MESSAGE="/user/message";
		String MESSAGEDETAIL="/user/message/messagedetail";
		String MESSAGEADMIN="/admin/messageadmin";
		String MESSAGEADMINREPLY="/admin/messagereply";
		
		String ADMIN_FILTER_POST="/admin/filter-post";
		String ADMIN_FILTER_COMMENT="/admin/filter-comment";
		String ADMIN_DELETE_ILLEGAL_POST="/admin/delete-illegal-post";
		String ADMIN_DELETE_ILLEGAL_COMMENT="/admin/delete-illegal-comment";
		String ADMIN_DELETE_COMMENT="/admin/delete-comment";
		String DISABLED_USER="/admin/disabled-user";
	}
}
