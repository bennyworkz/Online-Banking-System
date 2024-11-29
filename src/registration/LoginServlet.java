package registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.DAO;


/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("your_email");
		String password = request.getParameter("password");
		
		User user = new User(email, password);
		try
		{
			Connection con = DAO.getConnection();
			String sql = "select first_name, last_name, email, password from member where email = ? and password = ?";
			try
			{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,  user.getEmail());
				ps.setString(2,  user.getPassword());
				ResultSet rs = ps.executeQuery();
				
				if(rs.next())
				{
					
					String sql1 = "select email from user_data where email = ? ";
					PreparedStatement ps1 = con.prepareStatement(sql1);
					ps1.setString(1,  user.getEmail());
					ResultSet rs1 = ps1.executeQuery();
					
					
					String sql2 = "select balance,email from account_data where email = ?";
					PreparedStatement ps2 = con.prepareStatement(sql2);
					ps2.setString(1,  user.getEmail());
					ResultSet rs2 = ps2.executeQuery();
					if(rs1.next() && rs2.next())
					{
						HttpSession session = request.getSession();
						
						session.setAttribute("balance", rs2.getDouble("balance"));
						session.setAttribute("first_name", rs.getString("first_name"));
						session.setAttribute("last_name", rs.getString("last_name"));
						session.setAttribute("email", rs.getString("email"));
						
						response.sendRedirect("Profile.jsp");
					}
					else
					{
						request.setAttribute("email", user.getEmail());
					    
					    // Forward to the account opening form
					    RequestDispatcher dispatcher = request.getRequestDispatcher("AccountOpening_Page.jsp");
					    dispatcher.forward(request, response);
					}
					
					
				}
				else
				{
					 
					 request.setAttribute("errorMessage", "Invalid email or password. Please enter correct credentials.");
                     request.getRequestDispatcher("Login_Page.jsp").forward(request, response);
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
