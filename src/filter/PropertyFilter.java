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

/**
 * Servlet Filter implementation class PropertyFilter
 */
@WebFilter(filterName="/PropertyFilter", urlPatterns={"/main.jsp" , "/BookDetail.jsp" , "/check", "/bookinfo", "/login"})
public class PropertyFilter implements Filter {
		String key;
    /**
     * Default constructor. 
     */
    public PropertyFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		request.setAttribute("key", key);
		
		chain.doFilter(request, response);
		
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
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
		
//		Properties prop = new Properties();
//	    InputStream input = null;
//	    
//	    try {
//
//	        input = new FileInputStream("C:\\dev\\07.ServletJSP\\book-rental\\WebContent\\META-INF\\config.properties");
//
//	        // load a properties file
//	        prop.load(input);
//
//	        // get the property value and print it out
//	        key = prop.getProperty("apiKey");
//	      
//
//	    } catch (IOException ex) {
//	        ex.printStackTrace();
//	    } finally {
//	        if (input != null) {
//	            try {
//	                input.close();
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//	        }
//	        
//	    }

	}

}
