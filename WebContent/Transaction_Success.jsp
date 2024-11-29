<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #121212;
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .container {
            background-color: #1e1e1e;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            width: 90%;
            max-width: 350px;
        }
        .icon {
            color: #4CAF50;
            font-size: 36px; /* Smaller size for the icon */
            margin-bottom: 20px;
        }
        @keyframes checkmark {
            0% {
                stroke-dashoffset: 50px;
            }
            100% {
                stroke-dashoffset: 0;
            }
        }
        .checkmark-circle {
            stroke-dasharray: 150px;
            stroke-dashoffset: 150px;
            stroke-width: 2;
            stroke-miterlimit: 10;
            stroke: #4CAF50;
            fill: none;
            animation: checkmark 0.6s ease-in-out forwards; /* Smooth animation */
        }
        .checkmark-check {
            stroke-dasharray: 36px;
            stroke-dashoffset: 36px;
            stroke-width: 2.5; /* A bit thicker for aesthetics */
            stroke-miterlimit: 10;
            stroke: #4CAF50;
            fill: none;
            animation: checkmark 0.6s 0.4s ease-in-out forwards; /* Delayed start */
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
        <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
            <circle class="checkmark-circle" cx="26" cy="26" r="25" fill="none"/>
            <path class="checkmark-check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
        </svg>
        <h1>Payment Successful</h1>
        <p>Your payment has been processed successfully.</p>
            <center><a href="Profile.jsp"><input type="button" value="Back" name="back" class="back"></a></center>
        
    </div>
    
</body>
</html>
