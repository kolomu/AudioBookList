<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ page import="java.util.HashMap" %>
<%@ page import="entity.Person"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register - Audio Book List</title>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/foundation.css" />
        <link rel="stylesheet" href="../css/app.css" />
    </head>
    <%
    	HashMap<String, String> errorMessages = new HashMap<>();
	if (request.getAttribute("errorMessages") != null) errorMessages = (HashMap<String, String>)request.getAttribute("errorMessages");

	Person person = new Person();
        person.initDefaultValues();
	if (request.getAttribute("user") != null) person = (Person)request.getAttribute("user");
        System.out.println("person: " + person);
    %> 

    <body>
        <!-- NAVIGATION -->
        <jsp:include page="navigation.jsp" />

        <!-- MAIN CONTENT -->
        <section class="main">
            <div class="row">
                <div class="medium-6 medium-centered large-4 large-centered columns">

                    <form action="<%=request.getContextPath()%>/MvcController" method="POST">
                        
                        <input type="hidden" name="event" value="register" />
                        
                        <div class="row column register-form">
                            <h4 class="text-center">Register</h4>
                            
                            <% if(!errorMessages.isEmpty()){
                                for (Object value : errorMessages.values()) {
                                      out.print("<span class='errorMessage'>");
                                      out.print(value);
                                      out.println("</span><br />");
                                }
                            }
                            %>
                            <label>Username
                                <input type="text" name="username" placeholder="John" value="<%=person.getUsername()%>">
                            </label>
                            <p class="help-text" id="usernameHelpText">Spaces are ignored in usernames</p>
                            <label>Password
                                <input type="text" name="password" placeholder="Password" value="<%=person.getPassword()%>">
                            </label>
                            <p class="help-text" id="passwordHelpText">Password must have at least 6 characters</p>
                            <label>Email
                                <input type="email" name="email" placeholder="john@mail.com" value="<%=person.getEmail()%>">
                            </label>

                            <fieldset>
                                <input id="termsofuse" name="termsofuse" type="checkbox"><label for="termsofuse">I agree with the <a href="#">Terms Of Use</a></label>
                            </fieldset>
                            <p><button type="submit" class="button expanded">Register</button></p>
                        </div>
                    </form>

                </div>
            </div>
        </section>

        <!-- FOOTER SECTION -->
        <jsp:include page="footer.jsp" />

        <script src="../js/vendor/jquery.js"></script>
        <script src="../js/stickyfooter.js"></script>
        <script src="../js/vendor/what-input.js"></script>
        <script src="../js/vendor/foundation.js"></script>
        <script src="../js/app.js"></script>
    </body>
</html>
