<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.util.List" %> 
    <%@ page import="transaction.Transaction" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212; /* Dark background for the whole page */
            color: #ddd; /* Light text color for readability */
        }
        .container {
            width: 100%;
            overflow-x: auto; /* Allows horizontal scrolling */
            margin: 20px 0;
            padding: 0 10px; /* Padding for better readability on the edges */
            background: #1e1e1e; /* Slightly lighter dark shade for the container */
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
        }
        table {
            width: 100%;
            min-width: 600px; /* Minimum width of the table to ensure no compression */
            border-collapse: collapse;
        }
        th, td {
            text-align: left;
            padding: 12px; /* Slightly more padding for better readability */
            border-bottom: 1px solid #333;
            
        }
        th {
            color: #4CAF50; /* Green color for headings */
        }
         td {
            color: white; /* Green color for headings */
        }
        tr:hover {
            background-color: #333; /* Hover effect for rows */
        }
        .back
        {
        	background: #3786bd;
            border-top-left-radius: 5px;
            border-bottom-right-radius: 5px;
            width: 130px;
            border: none;
            margin: 6px 0 50px 0px;
            cursor: pointer;
            color: #fff;
            font-weight: 700;
            font-size: 15px;
            padding:1vmin;
        }
    </style>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		if(session.getAttribute("email") == null){
			response.sendRedirect("Landing_Page.jsp");
		}
		
		
		session.setAttribute("email", session.getAttribute("email"));
	%>
    <div class="container">
        <h2>Transaction History</h2>
        <table>
            <thead>
                <tr>
                    <th>Type</th>
                    <th>Email</th>
                    <th>Date/Time</th>
                    <th>Account Number</th>
                    <th>Account Name</th>
                    <th>Debit</th>
                    <th>Credit</th>
                    <th>Balance After</th>
                </tr>
            </thead>
            <tbody  >
				    <% 
		            int rowCount = (Integer) request.getAttribute("rowCount");
		            for (int i = 1; i <= rowCount; i++) { %>
		                <tr>
		                    <td><%= request.getAttribute("transaction_type_" + i) %></td>
		                    <td><%= request.getAttribute("email_" + i) %></td>
		                    <td><%= request.getAttribute("timestamp_" + i) %></td>
		                    <td><%= request.getAttribute("account_number_" + i) %></td>
		                    <td><%= request.getAttribute("account_name_" + i) %></td>
		                    <td><%= request.getAttribute("debit_amount_" + i) %></td>
		                    <td><%= request.getAttribute("credit_amount_" + i) %></td>
		                    <td><%= request.getAttribute("balance_" + i) %></td>
		                </tr>
		            <% } %>
									      
            </tbody>
        </table>
        <a href="Profile.jsp"><input type="button" value="Back" name="back" class="back"></a>
    </div>
    
    
</body>
</html>
