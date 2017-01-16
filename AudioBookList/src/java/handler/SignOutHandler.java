package handler;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import standard.Pages;

public class SignOutHandler extends EventHandlerBase{

    String signedOutPage = Pages.signedOutPage;
    
    @Override
    protected String getURL() {
        return signedOutPage;
    }

    @Override
    public void process(ServletContext sc, HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException, IOException {
      HttpSession session = request.getSession();
      session.invalidate();
    }
    
    
    
    
}
