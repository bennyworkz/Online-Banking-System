<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Balance</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212; /* Dark background for the whole page */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #ddd; /* Light text color for contrast */
        }
        .container {
            background: #1e1e1e; /* Slightly lighter dark shade for the container */
            padding: 20px;
            border: 1px solid #333; /* Subtle border */
            box-shadow: 0 0 20px rgba(0,0,0,0.5); /* Stronger shadow for a 3D effect */
            border-radius: 8px;
            width: 90%;
            max-width: 400px;
            text-align: center;
        }
        h1 {
            color: #4CAF50; /* Stylish green color for headings */
            font-size: 24px;
        }
        .balance {
            font-size: 36px;
            color: #4CAF50; /* Same green for balance to make it stand out */
            margin: 20px 0;
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
        .account-details {
            background-color: #333; /* Darker background for sub-sections */
            padding: 15px;
            border-radius: 8px;
            color: #aaa; /* Light grey for less important text */
            margin: 20px 0;
        }
        @media (max-width: 600px) {
            h1 {
                font-size: 18px;
            }
            .balance {
                font-size: 28px;
            }
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
        <h1>Your Account Balance</h1>
        <div class="balance">$<%= session.getAttribute("balance") %></div>
        <div class="account-details">
            Account Holder Name: <%= session.getAttribute("first_name") %> <%= session.getAttribute("last_name") %><br>
            
        </div>
         <a href="Profile.jsp"><input type="button" value="Back" name="back" class="back"></a>
    </div>
</body>
</html>
    