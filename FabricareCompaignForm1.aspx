<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabricareCompaignForm1.aspx.cs" Inherits="FabricareComapaignForm.FabricareCompaignForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html>
<head>
    <title>Fabricare Campaign Form</title>
    <link href="Style1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Fabricare Campaign Form</h2>
             <div class="form-group">
             <label for="mobile">Mobile Number:</label>
            <asp:TextBox ID="txtMobileNumber" runat="server" class="form-input" placeholder="Enter mobile number"></asp:TextBox>
             </div>
             <div class="form-group">
             <label for="EmailId">Email Id:</label>
            <asp:TextBox ID="txtEmail" runat="server" class="form-input" placeholder="Enter your email address"></asp:TextBox>
            </div>
            <div class="form-group">
           <label for="coupon">Coupon Code:</label>
            <asp:TextBox ID="txtCouponCode" runat="server" class="form-input" placeholder="Enter coupon code"></asp:TextBox>
            </div>
            <asp:Button ID="btnVerify" class="button" runat="server" Text="Verify" OnClientClick="return validateForm();"  />
            
            <p id="verificationmessage" class="message"></p>
            <p id="emailError" style="color: red;"></p> 

            <asp:Panel ID="pnlDetails" class="panel" runat="server" Visible="false">
                <hr />
                <h3>Additional Details</h3>
                <asp:TextBox ID="txtFirstName" runat="server" class="form-input" placeholder="Enter first  name "></asp:TextBox>
                <asp:TextBox ID="txtLastName" runat="server" class="form-input" placeholder="Last last name"></asp:TextBox>
                <br />
                <asp:CheckBox ID="chkDiscount" runat="server" Text="10% Discount" Checked="true" />
                <asp:CheckBox ID="chkFreeStyleService" runat="server" Text="Free Style Expert Service" Checked="true" />
            </asp:Panel>
        </div>
    </form>
    <script>

        const verifyButton = document.getElementById("btnVerify");
        const detailsSection = document.getElementById("details-section");      
        const verificationMessage = document.getElementById("verificationmessage");
        const successMessage = document.getElementById("success-message");    
       


        //function validateEmail() {
        //    var mobileInput = document.getElementById("txtMobileNumber");
        //    var emailInput = document.getElementById("txtEmail");
        //    var couponCodeInput = document.getElementById("txtCouponCode");

        //    var mobile = mobileInput.value.trim();
        //    var email = emailInput.value.trim();
        //    var couponCode = couponCodeInput.value.trim();


           
        //    var mobileInput = document.getElementById("txtMobileNumber");          
        //    var mobile = mobileInput.value.trim();
        //    var mobilePattern = /^[0-9]{10}$/;
            

        //    // Check if either mobile is valid or empty
        //    if (!mobilePattern.test(mobile)) {
        //        verificationMessage.textContent = "Mobile number should be a valid 10-digit number";
        //        mobileInput.focus();
        //        return false;
        //    }

        //    var emailInput = document.getElementById("txtEmail");
        //    var email = emailInput.value.trim();
        //    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Basic email pattern

        //    if (!emailPattern.test(email)) {
        //        verificationMessage.textContent = "Please enter valid email address";
        //        emailInput.focus();
        //        return false;
        //    }

        //    return true;   

        //}

        function validateForm() { 
            var mobileInput = document.getElementById("mobile");
            var emailInput = document.getElementById("email");
            var couponCodeInput = document.getElementById("coupon");
            var detailsPanel = document.getElementById("pnlDetails");

            var mobile = mobileInput.value.trim();
            var email = emailInput.value.trim();
            var couponCode = couponCodeInput.value.trim();

            if ((mobile === "" && email === "") || couponCode === "") {
                verificationMessage.textContent = "Either Mobile number or Email ID and Coupon Code must be entered.";
                return false;
            }
            else {
         
            if (mobile !== "" && !isValidMobile(mobile)) {
                verificationMessage.textContent = "Mobile number should be a valid 10-digit number.";
                mobileInput.focus();
                return false;
            }

            if (email !== "" && !isValidEmail(email)) {
                verificationMessage.textContent = "Please enter a valid email address.";
                emailInput.focus();
                return false;
            }

            // Validation successful, show the details panel
            detailsPanel.style.display = "block";
            return true;
        }
    </script>

</body>
</html>

