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

public class LoginFilter implements Filter {
	String[] whiteBox;
	String[] loginBox;

	public LoginFilter() {
	}

	// 로그인이 필요없는 부분
	// 메인화면, 도서 상세 페이지
	public void init(FilterConfig fConfig) throws ServletException {
		whiteBox = new String[] { "/main.do", "/main.jsp", "/bookDetail.jsp",  "/logout"};
		loginBox = new String[] { "/login.jsp", "/login" };
	}

	public void destroy() {
	}

	// 로그인 세션이 존재하는지 확인, 존재하지 않는다면 로그인 페이지로 이동
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();

		if (!Arrays.asList(whiteBox).contains(req.getServletPath())
				&& !Arrays.asList(loginBox).contains(req.getServletPath())
				&& session.getAttribute("usId") == null) {
			res.sendRedirect("./login.jsp");
			return;
		} else if (Arrays.asList(loginBox).contains(req.getServletPath())
				&& session.getAttribute("usId") != null) {
			res.sendRedirect("./main.do");
			return;
		}

		chain.doFilter(request, response);

	}

}
