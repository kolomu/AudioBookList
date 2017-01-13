package handler;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class EventHandlerBase {

	protected abstract String getURL();

	public void process(ServletContext sc, HttpServletRequest request, HttpServletResponse response) throws Exception,ServletException,IOException {
		System.out.println("forward: Using default process");
	}

	public void forward(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		System.out.println("forward: Using default forward");
		_dispatch(request, response);
	}

	protected void _dispatch(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		System.out.println("_dispatch: redirecting to " + getURL());
		RequestDispatcher rd=request.getRequestDispatcher(getURL());
		if (rd==null) System.out.println("_dispatch: rd = null!");
		rd.forward(request,response);
	}
}
