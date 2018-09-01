using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String Username=(String)Session["Username"];
        if (!Username.Equals(""))
        {
            lblWelcome.Text = "Welcome";
            lblDCID.Text = Username;
            lbLogout.Visible = true;
        }
    }
    protected void lbLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();        
        Response.Redirect("Index.aspx");
    }
}
