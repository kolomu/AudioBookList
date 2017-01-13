package handler;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UnknownHandler extends EventHandlerBase {

    @Override
    protected String getURL() {
        return "/pages/error.jsp";
    }

    @Override
    public void process(ServletContext sc, HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException, IOException {
        request.setAttribute("errorMessage", "Event is unknown");
    }

}
