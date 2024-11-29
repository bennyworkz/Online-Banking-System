package bills;

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
import java.sql.Timestamp;
import java.util.Date;

import database.DAO;

/**
 * Servlet implementation class PaymentServlet
 */
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
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
		String amount = request.getParameter("amount");
		Double amount1 = Double.parseDouble(amount);
		String senderEmail = request.getParameter("email");
		boolean result = performTransaction( senderEmail,amount1);
		if (result)
		{
//			response.getWriter().println("Transaction Successfull");
			response.sendRedirect("Transaction_Success.jsp");
		}
		else
		{
//			response.getWriter().println("UnSuccessfull");
			response.sendRedirect("Transaction_Unsuccessful.jsp");
		}
	}

	private boolean performTransaction(String senderEmail, Double amount) {
		Connection con =null;
	    PreparedStatement psSender = null;
	    ResultSet rsSender = null;
	    boolean transactionSuccess = false;
	    
	    try {
	        // Assuming you have a DataSource or Connection pool set up, get the connection
	        con = DAO.getConnection();

	        // Start transaction
	        con.setAutoCommit(false);

	        // Retrieve sender's balance
	        String sqlSender = "SELECT * FROM account_data WHERE email = ?";
	        psSender = con.prepareStatement(sqlSender);
	        psSender.setString(1, senderEmail);
	        rsSender = psSender.executeQuery();
	        
	        
	        
	        if (rsSender.next()) {
	          
	        	double senderBalance = rsSender.getDouble("balance");
	            // Check if sender has sufficient funds
	            if (senderBalance >= amount) {
	                // Deduct amount from sender's balance
	                String updateSender = "UPDATE account_data SET balance = balance - ? WHERE email = ?";
	                psSender = con.prepareStatement(updateSender);
	                psSender.setDouble(1, amount);
	                psSender.setString(2, senderEmail);
	                int rowsAffectedSender = psSender.executeUpdate();
	               
					
	              
	                    
	                    String sql1 = "INSERT INTO transaction_history VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	                    try {
    	                PreparedStatement ps1 = con.prepareStatement(sql1);
    	                
    	                ps1.setString(1, "Mobile Recharge");
    					ps1.setString(2, senderEmail);
    					ps1.setTimestamp(3, new Timestamp(new Date().getTime()));
    					ps1.setString(4, "UPI Transaction");
    					ps1.setString(5, "Mobile Recharge");
    					ps1.setDouble(6, amount);
    					ps1.setDouble(7, 0);
    					ps1.setDouble(8, (senderBalance-amount));
    					int r = ps1.executeUpdate();
	                    }catch (SQLException e) {
	        	            e.printStackTrace();
	        	        }
	                    
    					
    					
	                    // Check if both updates were successful
	                    if (rowsAffectedSender > 0 ) {
	                    	
	                        // Commit transaction
	                        con.commit();
	                        transactionSuccess = true;
	                        
	                        
	                    } else {
	                        // Rollback transaction
	                        con.rollback();
	                    }
	                }
	            }
	        
	    } catch (SQLException e) {
	        // Handle exception
	        e.printStackTrace();
	        try {
	            // Rollback transaction on exception
	            if (con != null) {
	                con.rollback();
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    } finally {
	        // Close resources and reset auto-commit
	        try {
	            if (rsSender != null) {
	                rsSender.close();
	            }
	            if (psSender != null) {
	                psSender.close();
	            }
	           
	            if (con != null) {
	                con.setAutoCommit(true);
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return transactionSuccess;
	}

}
