using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO.Compression;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand com;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        String Username = (String)Session["Username"];
        if (!Username.Equals(""))
        {
            mvHome.ActiveViewIndex = 1;
        }
        else
        {
            mvHome.ActiveViewIndex = 0;
        }
        
    }
    void Page_PreInit(Object sender, EventArgs e)
    {
        if(Session["DCID"].ToString().Equals("0"))
            this.MasterPageFile = "~/AdminSite.master";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            com = new SqlCommand("Select FirstName,password,Activation from DC_CustomerMaster where DCID=" + Convert.ToInt64(txtAccNo.Text) + "", con);
            SqlDataReader read = com.ExecuteReader();
            while (read.Read())
            {
                String Firstname = (String)read[0];
                String password = (string)read[1];
                int activation = Convert.ToInt32(read[2]);
                if (password.Equals(txtPassword.Text.Trim()))
                {
                    Session["DCID"] = txtAccNo.Text;
                    Session["Username"] = Firstname;
                    Session["Activation"] = activation;                    
                    if (activation == 1)
                    {
                        LoginFailed.Text = "";
                        Response.Redirect("Index.aspx");                        
                    }
                    else
                    {
                        LoginFailed.Text = "Your Account is not activated yet";
                    }
                }                
            }
            LoginFailed.Text = "Login Failed";
            
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            String filename = "~/App_Code/DigitalCash.zip";
            Response.ContentType = "application/zip";
            Response.AppendHeader("Content-Disposition", string.Format("attachment; filename = {0}", System.IO.Path.GetFileName(filename)));
            Response.TransmitFile(filename);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}
