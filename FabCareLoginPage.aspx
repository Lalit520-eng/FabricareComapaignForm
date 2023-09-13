<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabCareLoginPage.aspx.cs" Inherits="FabricareComapaignForm.FabCareLoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="mobile">Mobile Number:</label>
            <asp:TextBox ID="mobile" runat="server" class="form-input" placeholder="Enter mobile number"></asp:TextBox>
            <div>
                <center>
                    <label for="OR">OR</label>
                </center>
            </div>
            <label for="EmailId">Email Id:</label>
            <asp:TextBox ID="email" runat="server" class="form-input" placeholder="Enter your email address"> </asp:TextBox>
        </div>
        <label for="coupon">Coupon Code:</label>
        <asp:TextBox ID="coupon" runat="server" class="form-input" placeholder="Enter coupon code" required=""> </asp:TextBox>
        <br />
        <center>
            <%--<asp:Button ID="verifybutton" runat="server" Text="verifybutton" OnClientClick="validateEmail();" OnClick="verifybutton_Click"/>--%>
            <asp:Button ID="verifybutton" runat="server" Text="verifybutton" OnClientClick="validateEmail();" OnClick="verifybutton_Click" style="height: 26px"/>
        </center>
        <p id="verificationmessage" class="message"></p>
    </form>


     <script>
      const verifyButton = document.getElementById("verifybutton");
      const detailsSection = document.getElementById("detailsSection");
      const mobileInput = document.getElementById("mobile");
      const couponInput = document.getElementById("coupon");
      const emailInput = document.getElementById("email");
      const verificationMessage = document.getElementById("verificationmessage");
      const successMessage = document.getElementById("successmessage");

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
              return true;
          }    
      }
     </script>
</body>
</html>
