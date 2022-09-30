package filter;

import java.io.IOException;
import java.util.Arrays;

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

// admin의 경우 admin 기본 페이지(admin-user)로 이동
public class AdCheckFilter implements Filter {
	String[] adminBox;

	public AdCheckFilter() {
	}

	public void destroy() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
		adminBox = new String[] { "/admin-user", "/adUserList.jsp", "/adRentalList.jsp", "/admin-rental", "/dashboard.js", "/changeuserlist"};
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		// 경로에 대한 구분과 grade에 대한 구분이 필요함
		// admin페이지의 경우 일반 사용자 접근 불가능
		if (Arrays.asList(adminBox).contains(req.getServletPath())
				&& !"/logout".equals(req.getServletPath())
				&& !"Admin".equals(session.getAttribute("usGrade")) ) {
			res.sendRedirect("./main.do");
			return;
		} else if (!Arrays.asList(adminBox).contains(req.getServletPath())
				&& "Admin".equals(session.getAttribute("usGrade"))
				&& !"/logout".equals(req.getServletPath())) {
			res.sendRedirect("./admin-user");
			return;
		}
		chain.doFilter(request, response);
	}

}
