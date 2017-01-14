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
import standard.StringUtils;

public class RegisterHandler extends EventHandlerBase {

    private boolean hasErrors = false;
    
    @Override
    protected String getURL() {
        if (hasErrors) return "/pages/register.jsp";
        else return "/pages/overview.jsp";
    }
    
    @Override
   public void process(ServletContext sc, HttpServletRequest request, HttpServletResponse response)
			throws Exception, ServletException, IOException {

		HashMap<String, String> errorMessages = new HashMap<String, String>();

		PersonDao dao = new PersonDao();
		Person person = new Person();
		person.initDefaultValues();

		// get parameters from the request
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		// String termsofuse = request.getParameter("termsofuse");

		hasErrors = false;

		// check Data
                // USERNAME
                if(StringUtils.isNullOrEmpty(username)){
                   errorMessages.put("username" , "Username is missing"); 
                }else {
                   person.setUsername(username);
                }
                
                // EMAIL
                if(StringUtils.isNullOrEmpty(email)){
                   errorMessages.put("email" , "Email is missing"); 
                }else {
                   person.setEmail(email);
                }
               
                // PASSSWORRD
                if(StringUtils.isNullOrEmpty(password)){
                   errorMessages.put("password" , "Password is missing"); 
                }else {
                   person.setPassword(password);
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
			request.setAttribute("user", person);	
		} else {		
			request.setAttribute("errorMessages", errorMessages);
			request.setAttribute("user", person);
		}
	}
    
}