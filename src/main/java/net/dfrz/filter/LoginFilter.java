package net.dfrz.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import net.dfrz.bean.po.UserPO;

public class LoginFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

		String login = "login.jsp";
		String url = request.getRequestURI();
		boolean doFilter = true;
		if (url.indexOf(login) == -1) {
			doFilter = false;

			if (!doFilter) {
				UserPO user = (UserPO) request.getSession().getAttribute("user");
				if (null == user) {
					request.setCharacterEncoding("UTF-8");
					response.setContentType("text/html;charset=UTF-8");
					response.sendRedirect("login.jsp");

				} else {
					filterChain.doFilter(request, response);
				}
			} else
				filterChain.doFilter(request, response);

		} else
			filterChain.doFilter(request, response);
	}
}
