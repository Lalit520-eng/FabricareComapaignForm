using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace FabricareComapaignForm
{
    public partial class ImportFabcareCompaignData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnImport_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile && Path.GetExtension(fileUpload.FileName).Equals(".csv", StringComparison.OrdinalIgnoreCase))
            {
                try
                {
                    //string connectionString = "your_connection_string_here";
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        using (StreamReader reader = new StreamReader(fileUpload.PostedFile.InputStream))
                        {
                            bool isFirstRow = true;
                            while (!reader.EndOfStream)
                            {
                                string line = reader.ReadLine();
                                if (isFirstRow)
                                {
                                    isFirstRow = false;
                                    continue; // Skip the header row
                                }
   
                                string[] values = line.Split(',');

                                string query = "INSERT INTO Tbl_SFMS_CampaignDump (Mobile_Number,Email_Id,Coupon_Code,Updated_Date) VALUES (@Mobile_Number,@Email_Id, @Coupon_Code,getdate())";
                                using (SqlCommand command = new SqlCommand(query, connection))
                                {
                                    command.Parameters.AddWithValue("@Mobile_Number", values[0]);
                                    command.Parameters.AddWithValue("@Email_Id", values[1]);
                                    command.Parameters.AddWithValue("@Coupon_Code", values[2]);
                                    command.ExecuteNonQuery();
                                }
                            }
                        }
                    }
                    // Display success message
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('CSV data imported successfully.');", true);
                }
                catch (Exception ex)
                {
                    // Display error message
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
            else
            {
                // Display file format error message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a valid CSV file.');", true);
            }
        }
    }
}
    
