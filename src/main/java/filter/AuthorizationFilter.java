package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthorizationFilter implements Filter {
	
	private ServletContext context;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		HttpSession session = request.getSession(false);
	
		String url = request.getRequestURI();
		
		if (url.contains("user")) {
			if (session.getAttribute("role") != null) {
			
				String role = (String) session.getAttribute("role");
				
				if (role.equals("user") || role.equals("admin")) {
					filterChain.doFilter(request, response);
				}
			} else {
				request.setAttribute("queryResult", "Đăng nhập để tiếp tục.");
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			}
		} else if (url.contains("admin") || url.contains("accounts") || url.contains("companies") || url.contains("results")) {
			if (session.getAttribute("role") != null) {
				
				String role = (String) session.getAttribute("role");
				
				if (role.equals("admin")) {
					filterChain.doFilter(request, response);
				} else {
					request.setAttribute("queryResult", "Bạn chưa được cấp quyền quản trị.");
					request.getRequestDispatcher("/views/login.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("queryResult", "Đăng nhập để tiếp tục.");
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			}
		} else {
			filterChain.doFilter(request, response);
		}	
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}
}
