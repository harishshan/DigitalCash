using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ReportGeneration : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand com,com2;
    SqlDataReader reader;
    SqlTransaction transaction;
    int amount, bankBalance;
    String bankName, bankAccNo,DCID,pin;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DCID=(String)Session["DCID"];
            if (DCID.Equals(""))
            {
                Response.Redirect("Index.aspx");
            }
            conn=new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            conn.Open();
            com=new SqlCommand("SELECT [Amount] FROM [DC_CustomerMaster] where [DCID]="+Convert.ToInt32(DCID.ToString())+"",conn);
            reader=com.ExecuteReader();
            while(reader.Read())
            {
                amount=(int)reader[0];                
            }
            reader.Dispose();
            com = new SqlCommand("SELECT [BankName],[AccountNo],[Balance],[Pin] FROM [DC_Bank] WHERE [DCID]='" + DCID + "'", conn);
            reader = com.ExecuteReader();
            while (reader.Read())
            {
                bankName = (String)reader[0];
                bankAccNo = (String)reader[1];
                bankBalance = (int)reader[2];
                pin = (String)reader[3];
            }
            reader.Dispose();
            lblDCID.Text =DCID;
            lblAmount.Text = amount.ToString();
            lblBankName.Text = bankName;
            lblBankAccNo.Text = bankAccNo;
        }
        catch(Exception ex)
        {
            Response.Write(ex);
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (pin.Equals(txtPin.Text))
        {
            try
            {
                int amount = Convert.ToInt32(txtDC.Text);
                com = new SqlCommand("UPDATE DC_Bank SET Balance = Balance-" + amount + " WHERE DCID='" + DCID + "'", conn);
                com2 = new SqlCommand("UPDATE DC_CustomerMaster SET AMOUNT = AMOUNT+" + amount + " WHERE DCID=" + Convert.ToInt32(DCID.ToString()) + "", conn);
                transaction = conn.BeginTransaction();
                com.Transaction = transaction;
                com2.Transaction = transaction;
                com.ExecuteNonQuery();
                com2.ExecuteNonQuery();
                transaction.Commit();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Make Digital Cash Completed Successfully');", true);
            }
            catch(Exception ex)
            {
                transaction.Rollback();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Make Digital Cash Failed Please Try Again');", true);
            }
            finally
            {
                txtDC.Text = "";
                txtPin.Text = "";
                conn.Close();                
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Your Bank Pin Is Invalid');", true);
        }

    }
    protected void txtDC_TextChanged(object sender, EventArgs e)
    {

    }
}