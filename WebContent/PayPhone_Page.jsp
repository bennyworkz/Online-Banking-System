<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay to Phone Number</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #121212;
            color: #ffffff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #1e1e1e;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            width: 90%;
            max-width: 500px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="number"] {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: none;
            background-color: #333;
            color: white;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
        @media (max-width: 600px) {
            .container {
                width: 100%;
                margin: 10px;
                box-shadow: none;
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
        <h2 style="text-align:center;">Pay Phone Number</h2>
        <form action="PayPhoneServlet" method="post" >
           
            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" required>

            <label for="amount">Amount</label>
            <input type="number" id="amount" name="amount" required>
			<input type="hidden" name="email" value="<%= session.getAttribute("email") %>">
            <button type="submit">Pay</button>
        </form>
    </div>
</body>
</html>
