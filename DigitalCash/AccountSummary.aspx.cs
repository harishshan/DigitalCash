using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AccountSummary : System.Web.UI.Page
{
    String DCID;
    SqlConnection conn;
    SqlCommand com;
    SqlDataReader reader;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DCID = (String)Session["DCID"];
            if (DCID.Equals(""))
            {
                Response.Redirect("Index.aspx");
            }
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            conn.Open();
            lblDCID.Text = DCID;
            com = new SqlCommand("SELECT [FirstName],[MiddleName],[LastName],[DOB],[Gender],[MobileNo],[Emailid],[Amount],[OpeningDate],[DailyLimit],[LastIT] FROM [DC_CustomerMaster] WHERE [DCID]="+Convert.ToInt32(DCID)+"",conn);
            reader = com.ExecuteReader();
            while (reader.Read())
            {
                lblName.Text = (String)reader[0] + " " + (String)reader[1] + " " + (String)reader[2];
                lblDOB.Text = ((DateTime)reader[3]).Date.ToString() + "/" + ((DateTime)reader[3]).Month.ToString() + "/" + ((DateTime)reader[3]).Year.ToString();
                lblGender.Text = (String)reader[4];
                lblMobile.Text = (String)reader[5];
                lblEmail.Text = (String)reader[6];
                lblBalance.Text = ((int)reader[7]).ToString();
                lblOpenDate.Text = ((DateTime)reader[8]).Date.ToString() + "/" + ((DateTime)reader[8]).Month.ToString() + "/" + ((DateTime)reader[8]).Year.ToString();
                lblDailyLimit.Text = ((int)reader[9]).ToString();
                lblLastIT.Text = ((DateTime)reader[10]).Date.ToString() + "/" + ((DateTime)reader[10]).Month.ToString() + "/" + ((DateTime)reader[10]).Year.ToString();              
            }
            reader.Close();
            com = new SqlCommand("SELECT [DoorNo],[StreetName],[Area],[City],[District],[State],[Pincode] FROM [DC_AddressInformation] WHERE [DCID]=" + Convert.ToInt32(DCID) + "", conn);
            reader = com.ExecuteReader();
            while (reader.Read())
            {
                lblAddress.Text = (String)reader[0] + " " + (String)reader[1] + "<br/>" + (String)reader[2] + "<br/>" + (String)reader[3] + "<br/>" + (String)reader[4] + " District<br/>" + (String)reader[5] + " State<br/>" + (String)reader[6];
            }
            reader.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}