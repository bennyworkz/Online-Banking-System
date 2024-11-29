<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  
  <style>
    /* Font */
    @import url('https://fonts.googleapis.com/css?family=Quicksand:400,700');

    /* Design */
    *,
    *::before,
    *::after {
      box-sizing: border-box;
    }

    html {
      background-color: #ecf9ff;
    }

    body {
      color: #272727;
      font-family: 'Quicksand', serif;
      font-style: normal;
      font-weight: 400;
      letter-spacing: 0;
      padding: 1rem;
      background-color: #333;
      
    }

    .main{
      max-width: 800px;
      margin: 0 auto;
    }

    h1 {
        font-size: 24px;
        font-weight: 400;
        text-align: center;
    }

    img {
      height: auto;
      max-width: 50%;
      margin-left: 25%;
      vertical-align: middle;
      padding: 10px;
    }

    .btn {
      /*color: #ffffff;*/
      color: #ffffff;
      padding: 0.8rem;
      font-size: 14px;
      text-transform: uppercase;
      border-radius: 4px;
      font-weight: 400;
      display: block;
      width: 100%;
      cursor: pointer;
      /*border: 1px solid rgba(255, 255, 255, 0.2);*/
      border: 1px solid white;
      background: transparent;
    }

    .btn:hover {
      background-color: rgba(255, 255, 255, 0.12);
    }

    .cards {
      display: flex;
      flex-wrap: wrap;
      list-style: none;
      margin: 0;
      padding: 0;
      
    }

    .cards_item {
      display: flex;
      padding: 1rem;
    }

    @media (min-width: 40rem) {
      .cards_item {
        width: 50%;
      }
    }

    @media (min-width: 56rem) {
      .cards_item {
        width: 33.3333%;
      }
    }

    .card {
      
      border-radius: 0.25rem;
      box-shadow: 0 20px 40px -14px rgba(0, 0, 0, 0.25);
      display: flex;
      flex-direction: column;
      overflow: hidden;
      background-color: rgba(29, 146, 150, 0.219);
      box-shadow: 1vmin 1vmin 1vmin black;
    }

    .card_content {
      padding: 1rem;
      /*background: linear-gradient(to bottom left, #EF8D9C 40%, #FFC39E 100%);*/
    }

    .card_title {
     color: #ffffff;
    /*color: black;*/
      font-size: 1.1rem;
      font-weight: 700;
      letter-spacing: 1px;
      text-transform: capitalize;
      margin: 0px;
    }

    .card_text {
      /*color: #ffffff;*/
      color: #ffffff;
      font-size: 0.875rem;
      line-height: 1.5;
      margin-bottom: 1.25rem;    
      font-weight: 400;
    }
    .made_by{
      font-weight: 400;
      font-size: 13px;
      margin-top: 35px;
      text-align: center;
    }
    a
    {
      text-decoration: none;
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
  <div class="main">
    <!-- <h1>Responsive Card Grid Layout</h1> -->
    <ul class="cards">
      <li class="cards_item">
        <div class="card">
          <div class="card_image"><img src="images/report.png"></div>
          <div class="card_content">
            <!-- <h2 class="card_title">Card Grid Layout</h2> -->
            <p class="card_text">Easily track and review your past transactions to stay informed about your account </p>
            <a href="Verification_Page.jsp"><button class="btn card_btn">Transaction History</button></a>
          </div>
        </div>
      </li>
      <li class="cards_item">
        <div class="card">
          <div class="card_image"><img src="images/wallet.png"></div>
          <div class="card_content">
            <!-- <h2 class="card_title">Card Grid Layout</h2> -->
            <p class="card_text"> Check your account balance instantly to keep track of your financial status at any time.</p>
           <a href="Balance.jsp"> <button class="btn card_btn">Balance</button></a>
          </div>
        </div>
      </li>
      <li class="cards_item">
        <div class="card">
          <div class="card_image"><img src="images/transfer.png"></div>
          <div class="card_content">
            <!-- <h2 class="card_title">Card Grid Layout</h2> -->
            <p class="card_text"> Transfer funds securely between your accounts or to other accounts within the bank </p>
           <a href="BankTransfer_Page.jsp">  <button class="btn card_btn">Bank Transfer</button></a>
          </div>
        </div>
      </li>
      <li class="cards_item">
        <div class="card">
          <div class="card_image"><img src="images/invoice.png"></div>
          <div class="card_content">
            <!-- <h2 class="card_title">Card Grid Layout</h2> -->
            <p class="card_text">Conveniently pay your utility bills, credit card bills, and other expenses online, saving you time and hassle.</p>
           <a href="BillPayment_Page.jsp"> <button class="btn card_btn">Pay Bills</button></a>
          </div>
        </div>
      </li>
      <li class="cards_item">
        <div class="card">
          <div class="card_image"><img src="images/recharge.png"></div>
          <div class="card_content">
            <!-- <h2 class="card_title">Card Grid Layout</h2> -->
            <p class="card_text">Recharge your prepaid mobile phone or data plan quickly and conveniently, ensuring you stay connected.</p>
            <a href="Recharge.jsp"><button class="btn card_btn">Mobile Recharge</button></a>
          </div>
        </div>
      </li>
      <li class="cards_item">
        <div class="card">
          <div class="card_image"><img src="images/pay.png"></div>
          <div class="card_content">
            <!-- <h2 class="card_title">Card Grid Layout</h2> -->
            <p class="card_text"> Effortlessly pay your phone bill or top up your mobile credits with just a few clicks, making communication easier.</p>
            <a href="PayPhone_Page.jsp"><button class="btn card_btn">Pay Phone</button></a>
          </div>
        </div>
      </li>
      
    </ul>
     <center><a href="LogOutServlet"><input type="button" value="Logout" name="back" class="back"></a></center>
  </div>
  
  
</body>
</html>