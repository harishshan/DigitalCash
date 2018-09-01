using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Change_Credentials : System.Web.UI.Page
{
    String DCID;
    SqlConnection conn;
    SqlCommand com;
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
            MultiView1.ActiveViewIndex = 0;
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void btnChangePass_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnChangePin_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btnChangeDLimit_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
        com = new SqlCommand("SELECT [DailyLimit] FROM [DC_CustomerMaster] WHERE [DCID]=" + Convert.ToInt32(DCID) + "", conn);
        int DailyLimit = (int)com.ExecuteScalar();
        lblDLimit.Text = DailyLimit.ToString();

    }
    protected void btnSubChPass_Click(object sender, EventArgs e)
    {
        try
        {
            com = new SqlCommand("Select Count(*) from [DC_CustomerMaster] WHERE [DCID]=" + Convert.ToInt32(DCID) + " AND [PASSWORD]='" + txtOldPass.Text + "'", conn);
            int count=(int)com.ExecuteScalar();
            if (count != 0)
            {
                com = new SqlCommand("UPDATE [DC_CustomerMaster] SET [Password] ='" + txtNewPass.Text + "' WHERE [DCID]=" + Convert.ToInt32(DCID) + "", conn);
                com.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Password Updated Successfully');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Authentication Failed');", true);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnSubChPin_Click(object sender, EventArgs e)
    {
        try
        {
            com = new SqlCommand("Select Count(*) from [DC_CustomerMaster] WHERE [DCID]=" + Convert.ToInt32(DCID) + " AND [PIN]='" + txtOldPin.Text + "'", conn);
            int count=(int)com.ExecuteScalar();
            if (count != 0)
            {
                com = new SqlCommand("UPDATE [DC_CustomerMaster] SET [PIN] ='" + txtNewPin.Text + "' WHERE [DCID]=" + Convert.ToInt32(DCID) + "", conn);
                com.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('PIN Updated Successfully');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Authentication Failed');", true);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnSubChDLimit_Click(object sender, EventArgs e)
    {
        try
        {
            com = new SqlCommand("UPDATE [DC_CustomerMaster] SET [DailyLimit] =" + Convert.ToInt32(txtDLimit.Text) + " WHERE [DCID]=" + Convert.ToInt32(DCID) + "", conn);
            com.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Daily Limit Updated Successfully');", true);
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}