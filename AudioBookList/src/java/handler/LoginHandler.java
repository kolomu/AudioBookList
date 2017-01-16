package handler;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import standard.Pages;

public class LoginHandler extends EventHandlerBase{

    String overviewPage = Pages.overviewPage;
    
    @Override
    protected String getURL() {
        return overviewPage;
    }
    
}
