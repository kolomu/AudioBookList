package handler;

import dao.PersonDao;
import entity.Person;
import java.io.IOException;
import java.util.HashMap;
import javax.persistence.NoResultException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import standard.Pages;
import standard.StringUtils;

public class RegisterHandler extends EventHandlerBase {

    private boolean hasErrors = false;
    
    private String overviewPage = Pages.overviewPage;
    private String registerPage = Pages.registerPage;
    
    @Override
    protected String getURL() {
        if (hasErrors) {
            return registerPage;
        } else {
            return overviewPage;
        }
    }

    @Override
    public void process(ServletContext sc, HttpServletRequest request, HttpServletResponse response)
            throws Exception, ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        HashMap<String, String> errorMessages = new HashMap<>();

        PersonDao dao = new PersonDao();
        Person person = new Person();
        person.initDefaultValues();

        // get parameters from the request
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String termsofuse = request.getParameter("termsofuse");

        hasErrors = false;

        // check Data
        // USERNAME
        if (StringUtils.isNullOrEmpty(username)) {
            errorMessages.put("username", "Username is missing");
        } else {
            person.setUsername(username);
        }

        // EMAIL
        if (StringUtils.isNullOrEmpty(email)) {
            errorMessages.put("email", "Email is missing");
        } else {
            person.setEmail(email);
        }

        // PASSSWORRD
        if (StringUtils.isNullOrEmpty(password)) {
            errorMessages.put("password", "Password is missing");
        } else if (password.length() < 6) {
            errorMessages.put("password", "Password must have a length of atleast 6 characters");
        } else {
            person.setPassword(password);
        }

        if (StringUtils.isNullOrEmpty(termsofuse)) {
            errorMessages.put("termsofuse", "You didn't agree to the Terms of Use");
        }

        // is username already registered
        try {
            @SuppressWarnings("unused")
            Person tmp = dao.searchPerson(username);
            errorMessages.put("username", "Username already in use");

        } catch (NoResultException nre) {
            person.setUsername(username);
        }

        hasErrors = !errorMessages.isEmpty();

        if (!hasErrors) {
            dao.create(person);
            session.setAttribute("user", person); // using session to store user object, for redirect (not forward!)
            session.setAttribute("username", username);
        } else {
            request.setAttribute("errorMessages", errorMessages);
            request.setAttribute("user", person);
        }
    }

    /* Using PRG Pattern.
     * Instead of forwarding from doPost() method, we are doing a
     * redirection to avoid duplicate form submission. (If success)
     */
    @Override
     public void forward(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         if(hasErrors) {
             super.forward(request, response);
         } else {
            response.sendRedirect("displayOverview");
         }
         
     }

}
