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

public class LoginFilter implements Filter {
	String[] whiteBox;

    public LoginFilter() {
    }

	public void destroy() {
	}

	// 로그인 세션이 존재하는지 확인, 존재하지 않는다면 로그인 페이지로 이동
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if(session.getAttribute("usId") != null) {			
			chain.doFilter(request, response);
		} else {
			HttpServletResponse res = (HttpServletResponse) response;
			res.sendRedirect("login.jsp");
		}
		 
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
