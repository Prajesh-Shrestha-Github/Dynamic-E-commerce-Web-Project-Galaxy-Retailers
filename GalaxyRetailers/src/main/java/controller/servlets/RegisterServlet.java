package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
    protected void doPost(HttpServletRequest request, HttpServletResponse 		response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter printOut = response.getWriter();

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String userName = request.getParameter("userName");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");

		try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/galaxy retailers";
			String user = "root";
			String pass = "";
			Connection con = DriverManager.getConnection(url, user, pass);

			String query = "INSERT INTO user (first_name, last_name, username, gender, email, address, phone_number, password) " +
		               "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement st = con.prepareStatement(query);


			st.setString(1, firstName);
			st.setString(2, lastName);
			st.setString(3, userName);
			st.setString(4, address);
			st.setString(5, gender);
			st.setString(6, email);
			st.setString(7, phoneNumber);
			st.setString(8, password);
			int result = st.executeUpdate();
			if (result > 0) {
				printOut.println("<h1>Your account is registered " + "</h1>");

			}else if(result == 1) {
				String successRegisterMessage = "Successfully Registered!";
				request.setAttribute("errorMessage",successRegisterMessage);
				response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
			}else if (result == 0) {
				String errorMessage = "Please enter the correct data";
				request.setAttribute("errorMessage",errorMessage);
				request.getRequestDispatcher(request.getContextPath()+"/pages/register.jsp").forward(request,response);
				
			}else {
				printOut.println("<h1>Sorry! Your data is not registered.</h1>");
			}
		} catch (SQLException | ClassNotFoundException ex) {
			printOut.println("<h1>Please enter the correct data!</h1>");
			ex.printStackTrace();
		}
		printOut.println("<h1>End!</h1>");
    }
}






