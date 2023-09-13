<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabricareCompaignForm.aspx.cs" Inherits="FabricareComapaignForm.FabricareCompaignForm" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>

  body {
    font-family: "Arial", sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #f0f0f0;
  }
  .form-container {
    background-color: #ffffff;
    border-radius: 8px;
    padding: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    width: 500px;
  }
  .form-input {
    width: 95%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  .form-button {
    width: 30%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    background-color: #333333;     
     align-items: center;
    justify-content: center;
  }
  .message {
    margin-top: 10px;
    color: #ff0000;
    font-size: 14px;
  }
  .success-message {
    margin-top: 10px;
    color: #009900;
    font-size: 14px;
  }
  .form-title {
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #ffffff;
    background-color: #333333;
    padding: 10px;
    border-radius: 4px;
  }
  .hidden {
    display: none;
  }
  .checkbox-container {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
  }
  .checkbox-label {
    margin-left: 10px;
  }
  input[type="checkbox"] {
    appearance: none;
    -webkit-appearance: none;
    border: 2px solid #ccc;
    width: 18px;
    height: 18px;
    border-radius: 3px;
    transition: border-color 0.3s ease-in-out;
  }
  input[type="checkbox"]:checked {
    border-color: #3498db;
    background-color: #3498db;
  }
  input[type="checkbox"]:checked::before {
    content: "\2713";
    display: block;
    width: 18px;
    height: 18px;
    text-align: center;
    line-height: 18px;
    color: white;
    font-size: 14px;
  }
  input[type="time"] 
   /* Style for the date input */
  input[type="date"] {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    transition: border-color 0.3s ease-in-out;
    width:90%;
  }
  input[type="date"]:focus {
    border-color: #3498db;
  }
  input[type="time"] {
    width: 30px;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    transition: border-color 0.3s ease-in-out;
    margin-bottom:20px;
  }
  input[type="time"]:focus {
    border-color: #3498db;
  }  
   #expertServiceFields {
    margin-top: 20px;
  }
  /* Style input controls within #expertServiceFields */
  #expertServiceFields input[type="time"],
  #expertServiceFields input[type="date"] {
    margin-top: 10px;
  }
 
</style>
     <title>Fabricare Campaign Form</title>
</head>
<body>
  <div class="form-container">
    <div class="form-title">Fabricare Campaign Form</div>
    <form id="verification-form">
     <div>
      <label for="mobile">Mobile Number:</label>
      <input type="text" id="mobile" class="form-input" placeholder="Enter mobile number" required>
     
     <div> <center> <label for="OR">OR</label></center></div>        
      <label for="EmailId">Email Id:</label>
      <input type="email" id="emailInput" class="form-input" placeholder="Enter your email address">      
    </div>
      <label for="coupon">Coupon Code:</label>
      <input type="text" id="coupon" class="form-input" placeholder="Enter coupon code" required>
      <br />
      <center><button type="button" id="verify-button" onclick="validateEmail()" class="form-button">Verify</button>
     </center>
     <p id="verification-message" class="message"></p>
      <p id="emailError" style="color: red;"></p> 
       
    </form>
    
    <div id="details-section" style="display: none;">
      <form id="details-form">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" class="form-input" placeholder="Enter first name" required>
        
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" class="form-input" placeholder="Enter last name" required>
        
           
<h3>Preferred Options</h3>
<div class="checkbox-container">
  <input type="checkbox" id="option1" checked disabled>
  <label class="checkbox-label" for="option1">10% Discount on fabric</label>
</div>

<div class="checkbox-container">
  <input type="checkbox" id="option2" onclick="handleOption2()">
  <label class="checkbox-label" for="option2">Free Style Expert Service</label>
</div>

<div id="expertServiceFields" class="hidden">
<label for="preferredDate">Preferred Date:</label>
  <input type="date" id="preferredDate" onchange="validateDate()" min="">
  <br><br>
    <label for="preferredTimeSlot">Preferred Time Slot:</label>
  <select id="preferredTimeSlot" class="time form-input">
    <option>10 AM 12 PM</option>    
  </select>
</div>
<br>
        <label for="OrderNo">Order No:</label>
        <input type="text" id="OrderNo" class="form-input" placeholder="Enter Order No" required>

        <button type="submit" class="form-button">Save</button>
        
         <button type="submit" class="form-button">Submit</button>
      </form>
      <p id="success-message" class="success-message" style="display: none;">Coupon was successfully redeemed!</p>
    </div>
  </div>
  <script>
      const verifyButton = document.getElementById("verify-button");
      const detailsSection = document.getElementById("details-section");
      const mobileInput = document.getElementById("mobile");
      const couponInput = document.getElementById("coupon");
      const verificationMessage = document.getElementById("verification-message");
      const successMessage = document.getElementById("success-message");

      verifyButton.addEventListener("click", function () {
          // Validate mobile number (10 digits) and coupon code
          if (mobileInput.value.length === 10) {
              if (couponInput.value === "") {
                  verificationMessage.textContent = "Enter Coupon Code";
              } else {
                  detailsSection.style.display = "block"; // Show the details section
                  verificationMessage.textContent = ""; // Clear any previous messages
              }
          } else if (mobileInput.value === "" || emailInput.value === "" && couponInput.value === "") {
              verificationMessage.textContent = "Mobile Number or Email Id and Coupon code should be entered";
          } else {
              verificationMessage.textContent = "Please enter a valid 10-digit mobile number.";
          }
      });

      const detailsForm = document.getElementById("details-form");
      detailsForm.addEventListener("submit", function (event) {
          event.preventDefault();
          // Simulate successful submission
          successMessage.style.display = "block";
          detailsForm.reset(); // Clear input fields
          setTimeout(function () {
              successMessage.style.display = "none";
          }, 3000);
      });

      function validateEmail() {
          const emailInput = document.getElementById("emailInput");
          const emailError = document.getElementById("emailError");
          const email = emailInput.value;
          const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

          //if (mobileInput.value === "" ||email === "") {
          //    emailError.textContent = "Email address is required.";
          //} else if (!email.match(emailRegex)) {
          //    emailError.textContent = "Invalid email address.";
          //} else {
          //    emailError.textContent = ""; // Clear error message
          //    // Proceed with form submission or other actions
          //}
      }

      document.addEventListener("DOMContentLoaded", function () {
          var checkbox = document.getElementById("option2");
          var div = document.getElementById("expertServiceFields");

          checkbox.addEventListener("change", function () {
              div.style.display = this.checked ? "block" : "none";
          });
      });

      document.addEventListener("DOMContentLoaded", function () {
          var currentDateInput = document.getElementById("preferredDate");
          var today = new Date();

          // Format date as YYYY-MM-DD
          var formattedDate = today.toISOString().substr(0, 10);

          // Set value and min attribute to today's date
          currentDateInput.value = formattedDate;
          currentDateInput.min = formattedDate;
      });
  </script>
</body>
</html>