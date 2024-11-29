package transaction;

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
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.DAO;

/**
 * Servlet implementation class TransactionHistoryServlet
 */
public class TransactionHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransactionHistoryServlet() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try
		{
			Connection con = DAO.getConnection();
			String sql = "select first_name, last_name, email, password from member where email = ? and password = ?";
			try
			{
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,  email);
				ps.setString(2,  password);
				ResultSet rs = ps.executeQuery();
				
				if(rs.next())
				{
					
					 
					
					 try {
				           
				            String sql1 = "SELECT * FROM transaction_history WHERE email = ? ";
				            PreparedStatement ps1 = con.prepareStatement(sql1);
				            ps1.setString(1, email);
				           
				            ResultSet rs1  = ps1.executeQuery();

				           
				            ResultSetMetaData metaData = rs1.getMetaData();
				            int columnCount = metaData.getColumnCount();

				            // Initialize variables to store count and iterate over the result set
				            int rowCount = 0;
				            while (rs1.next()) {
				                rowCount++;
				                // Set attributes for each column name and value
				                for (int i = 1; i <= columnCount; i++) {
				                    String columnName = metaData.getColumnName(i);
				                    Object columnValue = rs1.getObject(i);
				                    request.setAttribute(columnName + "_" + rowCount, columnValue);
				                }
				            }

				            // Set attribute for count of rows
				            request.setAttribute("rowCount", rowCount);

				        } catch (SQLException e) {
				            e.printStackTrace();
				            // Handle database errors
				        }
					 	

				        // Forward the request to the JSP page
				        request.getRequestDispatcher("TransactionHistory_Page.jsp").forward(request, response);
				}
				else
				{
					 
					 request.setAttribute("errorMessage", "Invalid password. Please enter correct credentials.");
                     request.getRequestDispatcher("Verification_Page.jsp").forward(request, response);
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
