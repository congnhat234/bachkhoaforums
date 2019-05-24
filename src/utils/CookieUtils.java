package utils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {

	public static Cookie get(ServletRequest request, String name) {
		Cookie[] cookies = ((HttpServletRequest) request).getCookies();
		if (cookies == null || cookies.length == 0)
			return null;
		for (Cookie cookie : cookies) {
			if (name.equals(cookie.getName())) {
				return cookie;
			}
		}
		return null;
	}

	public static String getValue(ServletRequest request, String name) {
		Cookie cookie = get(request, name);
		if (cookie == null) {
			return null;
		}
		return cookie.getValue();
	}

	public static void delete(ServletRequest request, ServletResponse response, String name) {
		Cookie cookie = get(request, name);
		if (cookie != null) {
			cookie.setValue("");
			cookie.setPath("/");
			cookie.setMaxAge(0);
			((HttpServletResponse) response).addCookie(cookie);
		}
	}
}
