using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class DigitalCashGeneration : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        conn.Open();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            com = new SqlCommand("SELECT count(*) FROM [DC_CustomerMaster] where DCID="+Convert.ToInt64(txtDCID.Text)+"", conn);
            int count = (int)com.ExecuteScalar();
            if (count == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Entered DCID is not a valid one');", true);
            }
            else
            {
                com = new SqlCommand("UPDATE [DC_CustomerMaster] set amount=amount+"+Convert.ToInt32(txtAmount.Text)+" Where DCID="+txtDCID.Text+"", conn);
                com.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Amount Deposited as Digital cash');", true);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}