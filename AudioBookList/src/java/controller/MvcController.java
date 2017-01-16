// init parameter in servlets: https://examples.javacodegeeks.com/enterprise-java/servlet/get-all-init-parameters-in-servlet/
package controller;

import handler.EventHandlerBase;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MvcController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    protected HashMap<String, EventHandlerBase> events = new HashMap<String, EventHandlerBase>();

    public void init() throws ServletException {
        Enumeration<?> eventNameList = this.getInitParameterNames();
        while (eventNameList.hasMoreElements()) {
            String eventName = (String) eventNameList.nextElement();
            String className = "";
            try {
                className = this.getInitParameter(eventName);
                //  Class.forName(String) returns the Class object, class object gets casted in subtype of Event Handler Base
                EventHandlerBase eventHandler = (EventHandlerBase) Class.forName(className).newInstance();
                events.put(eventName, eventHandler);
            } catch (ClassNotFoundException cnfe) {
                System.out.println("Class Not Found: " + className);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String event = validateEvent(request);
        EventHandlerBase handler = getEventHandler(event);

        try {
            // call process method in handler
            handler.process(getServletContext(), request, response);
        } catch (Exception e) {
            e.printStackTrace();

            handler = getEventHandler("error");
            String errorMessage = "An Exception occurred\n Class: " + handler.getClass().getName() + "\n";
            errorMessage += e.getLocalizedMessage() + "\n";
            StackTraceElement[] lines = e.getStackTrace();
            for (int i = 0; i < lines.length; i++) {
                errorMessage += lines[i].toString() + "\n";
            }
            request.setAttribute("errorMessage", errorMessage);
        }

        try {
            handler.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected String validateEvent(HttpServletRequest request) {
        // get event from request
        String eventName = request.getParameter("event");
        // output name of event
        System.out.println("validateEvent: givenEventName = " + eventName);

        // if event name not found in map, set unknown event
        if (eventName == null || !events.containsKey(eventName)) {
            eventName = "unknown";
        }
        System.out.println("validateEvent: event=" + eventName);
        return eventName;
    }

    protected EventHandlerBase getEventHandler(String eventName) {
        EventHandlerBase handler;
        try {
            handler = (EventHandlerBase) events.get(eventName);
        } catch (Exception exception) {
            handler = (EventHandlerBase) events.get("unknown");
        }
        System.out.println("getEventHandler: handler = " + handler.getClass().getName());
        return handler;
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
