using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void Page_PreInit(Object sender, EventArgs e)
    {
        if (Session["DCID"].ToString().Equals("0"))
            this.MasterPageFile = "~/AdminSite.master";
    }
}
