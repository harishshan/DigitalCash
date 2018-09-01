using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Contacts : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand com;    
    String DCID;    
    protected void Page_Load(object sender, EventArgs e)
    {
        DCID = (String)Session["DCID"];        
        if (DCID.Equals(""))
        {
            Response.Redirect("Index.aspx");
        }
        
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.ToString().Equals("modify"))
        {
            if(((LinkButton)e.Item.FindControl("lbModify")).Text.Equals("Modify"))
            {
                ((Label)e.Item.FindControl("lblAddress")).Visible = false;
                ((Label)e.Item.FindControl("lblMobile")).Visible = false;
                ((TextBox)e.Item.FindControl("txtAddress")).Visible = true;
                ((TextBox)e.Item.FindControl("txtMobile")).Visible = true;
                ((LinkButton)e.Item.FindControl("lbModify")).Text = "Submit";
            }
            else if (((LinkButton)e.Item.FindControl("lbModify")).Text.Equals("Submit"))
            {
                ((Label)e.Item.FindControl("lblAddress")).Visible = true;
                ((Label)e.Item.FindControl("lblMobile")).Visible = true;
                ((TextBox)e.Item.FindControl("txtAddress")).Visible = false;
                ((TextBox)e.Item.FindControl("txtMobile")).Visible = false;
                ((LinkButton)e.Item.FindControl("lbModify")).Text = "Modify";
                try
                {
                    conn.Open();
                    TextBox address = (TextBox)e.Item.FindControl("txtAddress");
                    TextBox mobile = (TextBox)e.Item.FindControl("txtMobile");
                    Label name = (Label)e.Item.FindControl("lblName");
                    com = new SqlCommand("UPDATE [DC_Contacts] SET [Address] ='"+address.Text+"',[Mobile] ='"+mobile.Text+"' WHERE [Name]='"+e.CommandArgument.ToString()+"'", conn);
                    com.ExecuteNonQuery();                   
                    Repeater1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
            }
        }
        else if(e.CommandName.ToString().Equals("delete"))
        {
            try
            {
                conn.Open();
                com = new SqlCommand("DELETE FROM [DC_Contacts] WHERE [Name] ='" + e.CommandArgument.ToString() + "'", conn);
                com.ExecuteNonQuery();                
                Repeater1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int count = 0;
            conn.Open();
            com = new SqlCommand("SELECT count(*) FROM [DC_CustomerMaster] where DCID="+Convert.ToInt64(txtNewDCID.Text)+"", conn);
            count = (int)com.ExecuteScalar();            
            if (count == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Entered DCID is not a valid one');", true);
            }
            else
            {
                com = new SqlCommand("SELECT count(*) FROM [DC_Contacts] where [DCID]='" + DCID + "' and [Name]='" + txtNewName.Text + "'", conn);
                count = (int)com.ExecuteScalar();
                if (count == 0)
                {
                    com = new SqlCommand("SELECT count(*) FROM [DC_Contacts] where [DCID]='" + DCID + "' and [CustomerDCID]='" + txtNewDCID.Text + "'", conn);
                    count = (int)com.ExecuteScalar();
                    if (count == 0)
                    {
                        com = new SqlCommand("INSERT INTO [DC_Contacts]([Name],[Address],[Mobile],[EmailID],[CustomerDCID],[DCID]) VALUES('" + txtNewName.Text + "','" + txtNewAddress.Text + "','" + txtNewMobile.Text + "','" + txtNewEmail.Text + "','" + txtNewDCID.Text + "','" + DCID + "')", conn);
                        com.ExecuteNonQuery();
                        Repeater1.DataBind();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Entered Customere DCID is already in your contact list');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Entered Customere Name is already in your contact list');", true);
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}