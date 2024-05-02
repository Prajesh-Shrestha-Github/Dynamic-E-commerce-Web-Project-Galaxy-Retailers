package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.database.DatabaseController;
import model.GalaxyRetailersModel;

@WebServlet(asyncSupported = true, urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DatabaseController dbController;

    public RegisterServlet() {
        this.dbController = new DatabaseController();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	
	    String firstName = request.getParameter("firstName");
	    String lastName = request.getParameter("lastName");
	    String userName = request.getParameter("userName");
	    String address = request.getParameter("address");
	    String email = request.getParameter("email");
	    String phoneNumber = request.getParameter("phoneNumber");
	    String password = request.getParameter("password");
	    String confirmPassword = request.getParameter("confirmPassword");
	
	    boolean isValid = true;
	    List<String> errors = new ArrayList<>();
	
	    // Validate email format
	    if (!isValidEmail(email)) {
	        isValid = false;
	        errors.add("Invalid email format.");
	    }
	
	    // Validate phone number format
	    if (!isValidPhoneNumber(phoneNumber)) {
	        isValid = false;
	        errors.add("Invalid phone number format.");
	    }
	
	    // Validate password match
	    if (!password.equals(confirmPassword)) {
	        isValid = false;
	        errors.add("Password and confirm password do not match.");
	    }
	
	    
	    System.out.println("Errors = "+errors);
	    if (isValid) {
	        // Proceed with registration
	        GalaxyRetailersModel user = new GalaxyRetailersModel(firstName, lastName, userName, address, email,
	                phoneNumber, password);
	
	        // Call the addUser method in the DatabaseController to add the user to the database
	        int result = dbController.addUser(user);
	
	        // Check the result of the addUser operation
	        if (result > 0) {
	            // If successful, redirect the user to the login page
	            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	            return;
	        } else {
	            // If unsuccessful, you might want to display an error message or handle the error in some way
	            errors.add("Registration failed. Please try again later.");
	        }
	      String userRole = "customer";
	      if (email.endsWith("@galaxyretailers.com")) {
	          userRole = "admin";
	       } 
	    }
	
	    // Set error messages in request attribute
	    request.setAttribute("errors", errors);
	
	 // Set data back to request attributes for repopulating the form
	    request.setAttribute("firstName", firstName);
	    request.setAttribute("lastName", lastName);
	    request.setAttribute("userName", userName);
	    request.setAttribute("address", address);
	    request.setAttribute("email", email);
	    request.setAttribute("phoneNumber", phoneNumber);

//	    response.setContentType("text/html");
	    
	 // Forward to register.jsp
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/register.jsp");
	    dispatcher.forward(request, response);}

//	   
	
	private boolean isValidEmail(String email) {
        // Email validation using regular expression
        // Regex pattern for basic email validation (may not cover all edge cases)
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return email.matches(emailRegex);
    }

    private boolean isValidPhoneNumber(String phoneNumber) {
        // Phone number validation using regular expression
        // Regex pattern for basic phone number validation (may not cover all edge cases)
        // This pattern assumes a 10-digit phone number with no special characters
        String phoneRegex = "^\\d{10}$";
        return phoneNumber.matches(phoneRegex);
    }

}