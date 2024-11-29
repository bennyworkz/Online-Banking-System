<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Unsuccessful</title>
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
            color: #E53935; /* Red color for the error */
            font-size: 36px; /* Icon size */
            margin-bottom: 20px;
        }
        @keyframes error {
            0% {
                stroke-dashoffset: 50px;
            }
            100% {
                stroke-dashoffset: 0;
            }
        }
        .error-circle {
            stroke-dasharray: 150px;
            stroke-dashoffset: 150px;
            stroke-width: 2;
            stroke-miterlimit: 10;
            stroke: #E53935;
            fill: none;
            animation: error 0.6s ease-in-out forwards; /* Smooth animation */
        }
        .error-x {
            stroke-dasharray: 50px;
            stroke-dashoffset: 50px;
            stroke-width: 2.5; /* A bit thicker for aesthetics */
            stroke-miterlimit: 10;
            stroke: #E53935;
            fill: none;
            animation: error 0.6s 0.4s ease-in-out forwards; /* Delayed start */
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
            <circle class="error-circle" cx="26" cy="26" r="25" fill="none"/>
            <g fill="none" stroke-linecap="round" stroke-linejoin="round">
                <path class="error-x" d="M16 16l20 20"/>
                <path class="error-x" d="M36 16l-20 20"/>
            </g>
        </svg>
        <h1>Payment Unsuccessful</h1>
        <p>Unfortunately, your payment could not be processed. Please try again later.</p>
            <center><a href="Profile.jsp"><input type="button" value="Back" name="back" class="back"></a></center>
        
    </div>
    
</body>
</html>
