using FabricareComapaignForm.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FabricareComapaignForm
{
    public partial class FabCare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            detailsSection.Visible = false;
        }

        //protected void verifybutton_Click(object sender, EventArgs e)
        //{
        //    string mobileNumber = mobile.Text;
        //    string emailId = email.Text;
        //    string couponCode = coupon.Text;

        //    if (string.IsNullOrEmpty(mobileNumber) && string.IsNullOrEmpty(emailId))
        //    {
        //        // Neither mobile number nor email is entered
        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mobile number or email id should be entered.');", true);
        //        return;
        //    }
        //    else if (string.IsNullOrEmpty(couponCode))
        //    {
        //        // Coupon code is mandatory
        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Coupon code must be entered.');", true);
        //        return;
        //    }

        //    // All validation checks passed, process the form data
        //}

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Merchant merchant = new Merchant();
            merchant.MobileNumber = mobile.Text;
            merchant.Email = email.Text;
            merchant.CouponCode = coupon.Text;
            merchant.Firstname = FirstName.Text;
            merchant.Lastname = LastName.Text;
            merchant.Orderno = OrderNo.Text;
            merchant.ExpertStyleValue = option2.Checked ? 1 : 0;
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    // Assume you have a table named "FormData" with a column named "ExpertStyle"
                    SqlCommand command = new SqlCommand("sp_insertFabData", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Mobile_Number", merchant.MobileNumber);
                    command.Parameters.AddWithValue("@Email_Id", merchant.Email);
                    command.Parameters.AddWithValue("@Coupon_Code", merchant.CouponCode);
                    command.Parameters.AddWithValue("@First_Name", merchant.Firstname);
                    command.Parameters.AddWithValue("@Last_Name", merchant.Lastname);
                    command.Parameters.AddWithValue("@fabstyleopt", merchant.ExpertStyleValue);
                    //command.Parameters.AddWithValue("@Updated_By", mobile);
                    command.ExecuteNonQuery();

                    lblmessage.Text ="Data saved successfully!";
                }
                catch (Exception ex)
                {
                    lblmessage.Text = "An error occurred: " + ex.Message;
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        protected void verifybutton_Click(object sender, EventArgs e)
        {
            string mobileNumber = mobile.Text;
            string emailId = email.Text;
            string couonCode = coupon.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            bool chkExistense = CheckEmailOrMobileExists(connectionString, emailId,mobileNumber, couonCode);
            if (!chkExistense)
            {
                detailsSection.Visible = true;
                verifybutton.Visible = false;
                lblVerifyMessage.Visible = false;
            }
            else
            {
                lblVerifyMessage.Text = "Already exists.";
            }

        }
        static bool CheckEmailOrMobileExists(string connectionString, string email,string mobile, string couonCode)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("sp_CheckExistense", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@mobile", mobile);
                    command.Parameters.AddWithValue("@couonCode", couonCode);
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }
    }
}