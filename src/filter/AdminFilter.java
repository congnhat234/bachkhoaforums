package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.bo.UserBO;
import utils.Constants;
import utils.CookieUtils;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {

	public AdminFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) request).getSession();
		String token = CookieUtils.getValue(request, "token");
		if (session.getAttribute("user") != null) {
			UserBO userBO = new UserBO();
			User user = userBO.findByToken(token);
			if (user != null) {
				if(user.getId_role() == 1 || user.getId_role() == 2) {
					session.setAttribute("user", user);
					chain.doFilter(request, response);
				} else {
					((HttpServletResponse) response).sendRedirect(request.getServletContext().getContextPath() + Constants.URL.HOME);
				}
			} else {
				((HttpServletResponse) response).sendRedirect(request.getServletContext().getContextPath() + Constants.URL.SHOW_LOGIN);
			}
		} else {
			((HttpServletResponse) response).sendRedirect(request.getServletContext().getContextPath() + Constants.URL.SHOW_LOGIN);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
