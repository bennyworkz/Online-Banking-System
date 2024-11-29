<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Telecom Plans</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #222;
            color: #eee;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #333;
            border-radius: 8px;
        }

        h1 {
            text-align: center;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: none;
            background-color: #444;
            color: #eee;
        }

        .plan-card {
            background-color: #444;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .price {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            margin-bottom: 10px;
        }

        .details {
            font-size: 16px;
            color: #ccc;
        }

        .recharge-btn {
            background-color: #009688;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .recharge-btn:hover {
            background-color: #00796b;
        }
    </style>
</head>
<body>
	
    <div class="container">
        <h1>Telecom Plans</h1>
        <label for="provider">Select Service Provider:</label>
        <select id="provider" onchange="showPlans()">
            <option value="">Select</option>
            <option value="airtel">Airtel</option>
            <option value="bsnl">BSNL</option>
            <option value="idea">Idea</option>
            <option value="vodafone">Vodafone</option>
            <option value="jio">Jio</option>
        </select>

        <div id="plans"></div>
    </div>

    <script>
        function showPlans() {
            var provider = document.getElementById("provider").value;
            var plansDiv = document.getElementById("plans");
            plansDiv.innerHTML = "";

            if (provider === "") {
                return;
            }

            var plans = getPlansForProvider(provider);
            if (plans.length === 0) {
                plansDiv.innerHTML = "<p>No plans available for this provider.</p>";
                return;
            }

            plans.forEach(function(plan) {
                var form = document.createElement("form");
                form.action = "PaymentServlet";
                form.method = "post";
                
                var planCard = document.createElement("div");
                planCard.classList.add("plan-card");

                var priceHtml = "<div class='price'> &#8377; " + plan.price + "</div>";
                var detailsHtml = "<div class='details'><strong>Data:</strong> " + plan.data + "</div>";
                detailsHtml += "</br><div class='details'><strong>Validity:</strong> " + plan.validity + " days</div>";

                var hiddenInput = "<input type='hidden' name='amount' value='" + plan.price + "'><input type='hidden' name='email' value='<%= session.getAttribute("email") %>'>";
                
                var button = "</br><button type='submit' class='recharge-btn'>Recharge</button>";

                planCard.innerHTML = priceHtml + detailsHtml + hiddenInput + button;
                form.appendChild(planCard);
                plansDiv.appendChild(form);
            });
        }

        function getPlansForProvider(provider) {
            var plans = [];
            // Sample plans for each provider
            if (provider === "airtel") {
                plans.push({ price: "349", data: "2GB/day", validity: 28 });
                plans.push({ price: "599", data: "3GB/day", validity: 56 });
                plans.push({ price: "699", data: "1.5GB/day", validity: 84 });
                plans.push({ price: "999", data: "2GB/day", validity: 84 });
                plans.push({ price: "1498", data: "24GB", validity: 365 });
            } else if (provider === "bsnl") {
                plans.push({ price: "365", data: "2GB/day", validity: 60 });
                plans.push({ price: "599", data: "5GB/day", validity: 90 });
                plans.push({ price: "699", data: "2GB/day", validity: 160 });
                plans.push({ price: "999", data: "3GB/day", validity: 240 });
                plans.push({ price: "1999", data: "5GB/day", validity: 365 });
            } else if (provider === "idea") {
                plans.push({ price: "249", data: "1.5GB/day", validity: 28 });
                plans.push({ price: "399", data: "3GB/day", validity: 56 });
                plans.push({ price: "599", data: "1.5GB/day", validity: 84 });
                plans.push({ price: "1499", data: "24GB", validity: 365 });
                plans.push({ price: "2399", data: "1.5GB/day", validity: 365 });
            } else if (provider === "vodafone") {
                plans.push({ price: "299", data: "3GB/day", validity: 28 });
                plans.push({ price: "449", data: "4GB/day", validity: 56 });
                plans.push({ price: "699", data: "1.5GB/day", validity: 84 });
                plans.push({ price: "999", data: "3GB/day", validity: 84 });
                plans.push({ price: "1499", data: "24GB", validity: 365 });
            } else if (provider === "jio") {
                plans.push({ price: "199", data: "1.5GB/day", validity: 28 });
                plans.push({ price: "399", data: "1.5GB/day", validity: 56 });
                plans.push({ price: "555", data: "1.5GB/day", validity: 84 });
                plans.push({ price: "2121", data: "1.5GB/day", validity: 336 });
                plans.push({ price: "2399", data: "2GB/day", validity: 365 });
            }
            return plans;
        }
    </script>
</body>
</html>
