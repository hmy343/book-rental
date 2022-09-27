package filter;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName = "/PropertyFilter", urlPatterns = { "/main.do", "/BookDetail.jsp", "/check", "/adUserList.jsp",
		"/bookinfo" })
public class PropertyFilter implements Filter {
	String key;

	public PropertyFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setAttribute("key", key);

		chain.doFilter(request, response);

	}
	public void init(FilterConfig fConfig) throws ServletException {
		ServletContext sc = fConfig.getServletContext();
		Properties properties = new Properties();
		try {
			properties.load(new FileReader(sc.getRealPath(sc.getInitParameter("APIConfig"))));
			key = properties.getProperty("apiKey");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
