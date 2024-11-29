<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electricity Bill Payment</title>
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
        .readonly-input {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            background-color: teal;
            color: white;
            border: none;
            text-align: center;
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

        // Generate a random amount between 500 and 1000
        int amount = 500 + (int)(Math.random() * ((1000 - 500) + 1));
    %>
    <div class="container">
        <h2 style="text-align:center;">Electricity Bill Payment</h2>
        <form action="BillServlet" method="post">
            <div>
                <label>Service Number : <%= session.getAttribute("email")  %> </label>
               
            </div>
            </br>
            <div>
                <label>Amount</label>
                </br>
                <div class="readonly-input">₹ <%= amount %></div>
                <input type="hidden" name="amount" value="<%= amount %>">
            </div>
            <input type="hidden" name="email" value="<%= session.getAttribute("email") %>">
            <button type="submit">Pay Bill</button>
        </form>
    </div>
</body>
</html>
