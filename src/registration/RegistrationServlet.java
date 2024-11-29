package registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DAO;


/**
 * Servlet implementation class RegistrationServlet
 */
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("your_email");
		String password = request.getParameter("password");
		
		Member member = new Member(first_name, last_name, email, password);
		
		Connection con;
		try 
		{
			con = DAO.getConnection();
		
		
			String sql1 = "select first_name,last_name, email, password from member where email = ?";
			try
			{
				PreparedStatement ps = con.prepareStatement(sql1);
				ps.setString(1,  member.getEmail());
				
				ResultSet rs = ps.executeQuery();
				
				if(rs.next())
				{
					
					request.setAttribute("errorMessage", "User already Registered! Please Login");
					
					request.getRequestDispatcher("Registration_Page.jsp").forward(request, response);
				}
				else
				{
					 
					String sql = "insert into member values(?, ?, ?, ?)";
					try {
						PreparedStatement ps1 = con.prepareStatement(sql);
						ps1.setString(1,  member.getFirst_name());
						ps1.setString(2,  member.getLast_name());
						ps1.setString(3,  member.getEmail());
						ps1.setString(4,  member.getPassword());
						ps1.executeUpdate();
						request.setAttribute("email", member.getEmail());
					    
					    // Forward to the account opening form
					    RequestDispatcher dispatcher = request.getRequestDispatcher("AccountOpening_Page.jsp");
					    dispatcher.forward(request, response);
						
					} 
					catch (SQLException e) {
						
						e.printStackTrace();
						
					}
					
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
