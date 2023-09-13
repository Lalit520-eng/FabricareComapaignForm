using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace FabricareComapaignForm
{
    public partial class FabricareCompaignForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnVerify_Click(object sender, EventArgs e)
        //{
        //    string mobileNumber = txtMobileNumber.Text.Trim();
        //    string email = txtEmail.Text.Trim();
        //    string couponCode = txtCouponCode.Text.Trim();

        //    if (string.IsNullOrEmpty(mobileNumber) && string.IsNullOrEmpty(email))
        //    {
        //        // Display error message: Either Mobile number or Email id should be entered
              

        //    }
        //    else if (string.IsNullOrEmpty(couponCode))
        //    {
        //        // Display error message: Coupon Code is mandatory

        //    }
        //    else if (!IsValidMobileNumber(mobileNumber) && !IsValidEmail(email))
        //    {
        //        // Display error message: Mobile number should be 10 digits and Email should be valid
        //    }
        //    else
        //    {
        //        pnlDetails.Visible = true; // Show additional details panel
        //    }
        //}

        private bool IsValidMobileNumber(string mobileNumber)
            {
                return mobileNumber.Length == 10 && mobileNumber.All(char.IsDigit);
            }

            private bool IsValidEmail(string email)
            {
                try
                {
                    var addr = new System.Net.Mail.MailAddress(email);
                    return addr.Address == email;
                }
                catch
                {
                    return false;
                }
            }
        }
    


}