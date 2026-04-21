<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta charset="UTF-8">
<title>Cred</title>

<style>
    body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;	
}

.container {
    background: #fff;
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.2);
    width: 380px;
    text-align: center;
    animation: fadeIn 0.5s ease-in-out;
}

h2 {
    margin-bottom: 20px;
    color: #333;
}

.form-group {
    margin-bottom: 18px;
    text-align: left;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 6px;
    color: #444;
}

input[type="text"], input[type="number"], 
input[type="email"], input[type="tel"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 8px;
    outline: none;
    font-size: 15px;
    transition: border 0.3s;
}

input[type="text"]:focus, input[type="number"]:focus, 
input[type="email"]:focus, input[type="tel"]:focus {
    border: 1px solid #667eea;
}

.btn-container {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }

    button {
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 12px 25px;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s ease;
    }

    button:hover {
        transform: scale(1.05);
    }

    #nextBtn {
        background-color: #007bff;
    }
    #nextBtn:hover {
        background-color: #0056b3;
    }

@keyframes fadeIn {
    from {opacity: 0; transform: translateY(10px);}
    to {opacity: 1; transform: translateY(0);}
}

</style>

</head>
<body>
		 <!-- 🟩 Add Identity Section -->
  <div class="container">
    <h2>Aadhar Details</h2>
    <form id="personal">
        <div class="form-group">
            <label>Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>
        </div>
       
        <div class="form-group">
            <label>DOB:</label>
            <input type="date" id="date" name="date" required />
        </div>
       
        <div class="form-group">
            <label>Phone:</label>
            <input type="tel" id= "phone" name="phone" placeholder="Enter your phone number" required>
        </div>
       
        <div class="form-group">
            <label>Address:</label>
            <input type="text" id ="address" name="address" placeholder="Enter your address" required>
        </div>
        
       	<div class="form-group">
       	   	<label>Gender:</label>
       	   	<label><input type="radio" id ="A" name="gender" value="male">Male</label>
            <label><input type="radio" id ="B" name="gender" value="Female">Female</label>
            <label><input type="radio" id ="C" name="gender" value="others">Others</label>
         </div>
         
        <div class="btn-container">
            <button type="submit" id="submitBtn">Submit</button>
            <button type="button" id="nextBtn">Next</button>
        </div>
   		 
       
      </form>
     </div>
     
     <script>
     
     // Add Details
    $(document).ready(function () {
       $("#personal").on("submit", function (e) {
           e.preventDefault(); // Prevent default form submission
           // Collect form data
           var name = $("#name").val();
           var date = $("#date").val();
           var phone = $("#phone").val();
           var address = $("#address").val();
           var gender = $('input[name="gender"]:checked').val();
           
           
                
              
              
              function generateRandom12DigitNumber() {
              	  // The minimum 12-digit number is 100,000,000,000 (10^11)
              	  const min = 100000000000; 
              	  // The maximum 12-digit number is 999,999,999,999 (10^12 - 1)
              	  const max = 999999999999; 

              	  // Generate a random number within the specified range
              	  const randomNumber = Math.floor(Math.random() * (max - min + 1)) + min;
              	  
              	  return randomNumber;
              	}

              	const twelveDigitNumber = generateRandom12DigitNumber();
              	console.log(twelveDigitNumber);
              	
              	
              	
              	const now = new Date();
              	const entryDate = now.toISOString().split("T")[0]; // YYYY-MM-DD
              	const entryTime = now.toTimeString().split(" ")[0]; // HH:MM:SS

              	

              	
              	 var load = {
                	   name: name,
                       aadhar_number: twelveDigitNumber,
               		   entry_date: entryDate,
              		   entry_time: entryTime,
              		   date: date,
              		   phone: phone,
              		   address: address,
              		   gender: gender
              		   


                 };
                 
              	
              	
              // Send AJAX POST
           $.ajax({
               url: "<%= request.getContextPath() %>/Firstt_page", // Your backend endpoint
               type: "POST",
               contentType: "application/json",
               data: JSON.stringify(load),
               success: function (response) {
                   console.log("Data submitted successfully!", response);
                   

               },
               error: function (xhr, status, error) {
                   alert("An error occurred: " + error);
                   console.error("Error details:", xhr.responseText);
               }
           });
       });
       
       $("#nextBtn").click(function () {
           window.location.href = "<%= request.getContextPath() %>/Second_page"; 
           });
       
       
   });
     
    
   
    	
    	
     </script>
</body>
</html>