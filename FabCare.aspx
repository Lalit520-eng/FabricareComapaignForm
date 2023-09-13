<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabCare.aspx.cs" Inherits="FabricareComapaignForm.FabCare" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%--  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
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
    <form id="form1" runat="server">

    <div class="form-title">Fabricare Campaign Form</div>
  <div id="verificationform">
    
     <div>
      <label for="mobile">Mobile Number:</label>
      <asp:TextBox id="mobile" runat="server" class="form-input" placeholder="Enter mobile number"></asp:TextBox>
     
     <div> <center> <label>OR</label></center></div>        
      <label>Email Id:</label>
      <asp:TextBox id="email" runat="server" class="form-input" placeholder="Enter your email address"> </asp:TextBox>  
    </div>
      <label for="coupon">Coupon Code:</label>
      <asp:TextBox id="coupon" runat="server" class="form-input" placeholder="Enter coupon code"> </asp:TextBox>
      <br />
      <center>
          <%--<asp:Button ID="verifybutton" runat="server" Text="verifybutton" OnClientClick="validateEmail();" OnClick="verifybutton_Click"/>--%>
           <asp:Button ID="verifybutton" runat="server" Text="verifybutton" OnClientClick="return validateEmail();" OnClick="verifybutton_Click"/>
      </center>
         <asp:label runat="server"  style="color: red;" ID ="lblVerifyMessage"></asp:label>
     <p id="verificationmessage" class="message" ></p>
     <%-- <p id="emailError" style="color: red;"></p>--%>
       
     </div>  
  <div id="detailsSection" runat="server">
      <div id="detailsform">
        <label>First Name:</label>
        <asp:TextBox runat="server" id="FirstName" class="form-input" placeholder="Enter first name"></asp:TextBox>
        
        <label>Last Name:</label>
        <asp:TextBox runat="server" id="LastName" class="form-input" placeholder="Enter last name"></asp:TextBox>
        
           
<h3>Preferred Options</h3>
<div class="checkbox-container">
  <input type="checkbox" id="option1" checked disabled>
  <label class="checkbox-label" for="option1">10% Discount on fabric</label>
</div>

<div class="checkbox-container">
  <asp:CheckBox id="option2" runat="server" onclick="handleOption2()"></asp:CheckBox>
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
        <asp:TextBox id="OrderNo" runat="server" placeholder="Enter Order No"></asp:TextBox>
         <center>
             <asp:Button runat="server" ID="btnSave" onclick="btnSave_Click" Text="Save" class="form-button"></asp:Button>       
         <asp:Button ID="btnSubmit" runat="server" style="display: none;"  Text="Submit" class="form-button"></asp:Button>
        </center>
          <asp:label runat="server" ID ="lblmessage"></asp:label>
      </div>
      <p id="successmessage" class="success-message" style="display: none;">Coupon was successfully redeemed!</p>
    </div>
  
  </form>
  <script>
      const verifyButton = document.getElementById("verifybutton");
      const detailsSection = document.getElementById("detailsSection");
      const mobileInput = document.getElementById("mobile");
      const couponInput = document.getElementById("coupon");
      const emailInput = document.getElementById("email");
      const verificationMessage = document.getElementById("verificationmessage");
      const successMessage = document.getElementById("successmessage");
      const detailsForm = document.getElementById("detailsform");

      detailsForm.addEventListener("submit", function (event) {
          event.preventDefault();
          // Simulate successful submission
          successMessage.style.display = "block";
          detailsForm.reset(); // Clear input fields
          setTimeout(function () {
              successMessage.style.display = "none";
          }, 3000);
      });
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
      function validateEmail() {
          debugger;
          var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
          var mobilePattern = /^[0-9]{10}$/;
          
          if (mobileInput.value === "" && emailInput.value === "") {
              verificationMessage.textContent = "Either Mobile number or Email id should be entered ";
              return false;
          }
          // // Check if either mobile is valid or empty
          else if (emailInput.value === "") {
           if (!mobilePattern.test(mobileInput.value)) {
                  verificationMessage.textContent = "Mobile number should be a valid 10-digit number";
                  mobileInput.focus();
                  return false;
              }
          }
          
          else if (!emailPattern.test(emailInput.value)) {
                  verificationMessage.textContent = "Please enter valid email address";
                  emailInput.focus();
                  return false;
          }

          else if (couponInput.value === "") {
              verificationMessage.textContent = "Enter coupon code";
              return false;
          }

          else {
              verificationMessage.textContent = "";
              $('#verificationform').prop('disabled', true);
              //$('#mobile').prop('disabled', true);
              //$('#email').prop('disabled', true);
              //$('#coupon').prop('disabled', true);
              return true;
          }    
      }

  </script>
      

   <%-- <script>
        var txtOrderNo = document.getElementById("OrderNo");
        var submitButton = document.getElementById("btnSubmit");
        txtOrderNo.addEventListener("keyup", function (event) {
            alert("hi");
            submitButton.style.display = "block";
            
        });
    </script>--%>
</body>
</html>
