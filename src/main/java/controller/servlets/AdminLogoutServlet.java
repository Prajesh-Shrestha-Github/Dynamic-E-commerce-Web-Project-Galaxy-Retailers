package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;

		/*@see HttpServlet#HttpServlet()*/

		  public AdminLogoutServlet() {
		        super();
		        // TODO Auto-generated constructor stub
		    }
     
/*@see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
response)*/

		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {// TODO Auto-generated method stub
			HttpSession session = request.getSession(false);

			// If the session exists, invalidate it
			if (session != null) {
				session.invalidate();
			}

			// Optionally, you can clear cookies here
			// ...

			// Redirect to the login page or any other desired page
			response.sendRedirect("Pages/login.jsp");
		}

		/*

@see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
response)*/

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {// TODO Auto-generated method stub
			doGet(request, response);
		}

}