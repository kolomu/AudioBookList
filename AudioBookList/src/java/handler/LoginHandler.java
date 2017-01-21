package handler;

import standard.Pages;

public class LoginHandler extends EventHandlerBase{

    String overviewPage = Pages.overviewPage;
    
    @Override
    protected String getURL() {
        return overviewPage;
    }
    
}
