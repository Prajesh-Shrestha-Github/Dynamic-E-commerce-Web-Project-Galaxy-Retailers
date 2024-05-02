package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.database.DatabaseController;
import model.User;

@WebServlet(asyncSupported = true, urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DatabaseController dbController;

    public LoginServlet() {
        this.dbController = new DatabaseController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName"); 
        String password = request.getParameter("password");

        // Get user information from the database
        int user = dbController.getUserInfo(userName, password);

        if (user != null) {
            // Check the user's role
            String userRole = user.getUserRole();

            // Redirect based on the user's role
            if (userRole.equals("customer")) {
                response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
            } else if (userRole.equals("admin")) {
                response.sendRedirect(request.getContextPath() + "/pages/Dashboard.jsp");
            }
        } else {
            // Display error message for failed login
            request.setAttribute("errorMessage", "Account does not exist. Please register.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }
}
