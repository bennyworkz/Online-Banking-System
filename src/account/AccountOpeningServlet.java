package account;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import database.DAO;


/**
 * Servlet implementation class AccountOpeningServlet
 */
public class AccountOpeningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountOpeningServlet() {
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
		String accountType = request.getParameter("account_type");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("your_email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob"); 
        int age = Integer.parseInt(request.getParameter("age"));
        String guardianName = request.getParameter("guardian_name");
        double depositAmount = Double.parseDouble(request.getParameter("deposit_amount"));
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String postalCode = request.getParameter("postal_code");
        
        
        Connection con;
        try 
		{
			con = DAO.getConnection();
			
			
			String accountNumber = generateAccountNumber();
			
			String cifNumber = generateCifNumber();
	        String ifscCode = generateIfscCode();
	       
	        
	        Account account = new Account(accountType, firstName, lastName, email, phone, dob, guardianName, address, country, state, city, postalCode, age, accountNumber, cifNumber, ifscCode, depositAmount );
	      
	        String sql = "INSERT INTO user_data (account_type, first_name, last_name, email, phone, date_of_birth, age, guardian_name, deposit_amount, address, country, state, city, postal_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        String sql1 = "INSERT INTO account_data (email, account_number, cif_number, ifsc_code, balance, account_type) VALUES (?, ?, ?, ?, ?, ?)";
	        
			try
			{
				PreparedStatement ps = con.prepareStatement(sql);
				PreparedStatement ps1 = con.prepareStatement(sql1);
				ps.setString(1,  account.getAccountType());
				ps.setString(2,  account.getFirstName());
				ps.setString(3,  account.getLastName());
				ps.setString(4,  account.getEmail());
				ps.setString(5,  account.getPhone());
				ps.setString(6,  account.getDob());
				ps.setInt(7,  account.getAge());
				ps.setString(8,  account.getGuardianName());
				ps.setDouble(9,  account.getDepositAmount());
				ps.setString(10,  account.getAddress());
				ps.setString(11,  account.getCountry());
				ps.setString(12,  account.getCity());
				ps.setString(13,  account.getState());
				ps.setString(14,  account.getPostalCode());
				
				ps1.setString(1,  account.getEmail());
				ps1.setString(2,  account.getAccountNumber());
				ps1.setString(3,  account.getCifNumber());
				ps1.setString(4,  account.getIfscCode());
				ps1.setDouble(5,  account.getDepositAmount());
				ps1.setString(6,  account.getAccountType());
				
				
				int r = ps.executeUpdate();
				int r1 = ps1.executeUpdate();
				
				if (r>0 && r1>0)
				{
					HttpSession session = request.getSession();
					
					
					session.setAttribute("email", email);
					
					response.sendRedirect("Profile.jsp");
				}
				else
				{
					response.getWriter().println(" Unsuccessfully.");
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
	
	private static String generateIfscCode() {
		 // Generate 2 uppercase letters followed by 4 digits
       Random random = new Random();
       int leftLimit = 65; // letter 'A'
       int rightLimit = 90; // letter 'Z'
       int targetStringLength = 2;
       String generatedString = random.ints(leftLimit, rightLimit + 1)
               .limit(targetStringLength)
               .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
               .toString();
       int digits = 1000 + random.nextInt(9000); // Ensure 4 digits
       return generatedString + digits;
	}

	private static String generateCifNumber() throws SQLException {
		
		String cifNumber;
       Random random = new Random();
       cifNumber = String.format("%010d", random.nextInt(900000000) + 100000000); // Ensure the number is 10 digits
           
       return cifNumber;
	}

	public String generateAccountNumber() throws SQLException {
		
			
			String accountNumber;
	        Random random = new Random();
	        accountNumber = String.format("%015d", random.nextLong(900000000000000L) + 100000000000000L); // Ensure the number is 15 digits
	           
	        return accountNumber;
	}
        
        
}


