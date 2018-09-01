using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AccountActivation : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        conn.Open();
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.ToString().Equals("activate"))
            {
                
                com = new SqlCommand("UPDATE [DC_CustomerMaster] SET [Activation] =1 WHERE [DCID]=" + Convert.ToInt32(e.CommandArgument.ToString()) + "", conn);
                com.ExecuteNonQuery();
                Repeater1.DataBind();
            }
            else if (e.CommandName.ToString().Equals("reject"))
            {
                
                com = new SqlCommand("UPDATE [DC_CustomerMaster] SET [Activation] =2 WHERE [DCID]=" + Convert.ToInt32(e.CommandArgument.ToString() )+ "", conn);
                com.ExecuteNonQuery();
                Repeater1.DataBind();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}