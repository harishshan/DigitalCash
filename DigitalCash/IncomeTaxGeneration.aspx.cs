using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

public partial class IncomeTaxGeneration : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand com1, com2, com3;
    SqlDataReader reader;
    SqlTransaction transaction;
    String DCID, Emailid, way2smsPhNo, way2smsPass, Mobile;
    int amount, pin;
    DateTime lastIT;

    protected void Page_Load(object sender, EventArgs e)
    {
        DCID = (String)Session["DCID"];
        if (DCID.Equals(""))
        {
            Response.Redirect("Index.aspx");
        }
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            conn.Open();
            com3 = new SqlCommand("SELECT [PIN],[Amount],[Emailid],[MobileNo],[LastIT] FROM [DC_CustomerMaster] WHERE [dcid]=" + Convert.ToInt32(DCID) + "", conn);            
            reader = com3.ExecuteReader();
            while (reader.Read())
            {
                pin = (int)reader[0];
                amount = (int)reader[1];
                Emailid = (String)reader[2];
                Mobile = (String)reader[3];
                lastIT=(DateTime)reader[4];
            }
            reader.Dispose();
            txtFromDate.Text=lastIT.ToString();            
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        if (pin.ToString().Equals(txtPIN.Text))
        {
            try
            {
                int newAmount = Convert.ToInt32(lblAmount.Text);
                if ((amount - newAmount) >= 0)
                {
                    com1 = new SqlCommand("UPDATE DC_CustomerMaster SET AMOUNT = AMOUNT-" + newAmount + " WHERE DCID=" + Convert.ToInt32(DCID.ToString()) + "", conn);
                    com2 = new SqlCommand("UPDATE DC_CustomerMaster SET AMOUNT = AMOUNT+" + newAmount + " WHERE DCID=0", conn);
                    transaction = conn.BeginTransaction();
                    com1.Transaction = transaction;
                    com2.Transaction = transaction;
                    com1.ExecuteNonQuery();
                    com2.ExecuteNonQuery();
                    transaction.Commit();
                    com3 = new SqlCommand("INSERT INTO [DC_Transaction]([FromDCID],[ToDCID],[Amount],[DOT],[Narration]) VALUES('" + DCID + "','0'," + newAmount + ",'" + DateTime.Now + "','Income Tax Paid');SELECT SCOPE_IDENTITY()", conn);
                    int tid = Convert.ToInt32(com3.ExecuteScalar());
                    System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                    client.Host = "smtp.gmail.com";
                    System.Net.NetworkCredential basicauthenticationinfo = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["emailid"].ToString(), ConfigurationManager.AppSettings["emailpassword"].ToString());
                    client.Port = int.Parse("587");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = basicauthenticationinfo;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    MailMessage msg = new MailMessage();
                    msg.Subject = "Digital Cash System";
                    msg.Body = "Thank you " + DCID + "(Digital Cash Number)<br/>" + "<br/>Your Income tax for amount " + newAmount.ToString() + " is Paid successfull" + "<br/> Your Transaction id is " + tid.ToString();
                    msg.From = new MailAddress(ConfigurationManager.AppSettings["emailid"].ToString());
                    msg.To.Add(Emailid);
                    msg.IsBodyHtml = true;
                    //client.Send(msg);
                    //send(way2smsPhNo, way2smsPass, "Your Digital Cash Account is created", Mobile);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Congrats! your Your Income Tax is Paid successfully.');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Sorry you dont have enough balance in your Digital Cash Account.');", true);
                }
                
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Make Digital Cash Failed Please Try Again');", true);
            }
            finally
            {
                conn.Close();
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Your Digital Cash Pin Is Invalid');", true);
        }
    }
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        try
        {
            int totalIncome = 0;
            com3 = new SqlCommand("select SUM(amount) from DC_Transaction where toDCID='" + Session["DCID"].ToString() + "' and DOT>='" + lastIT + "' and DOT>='" + Convert.ToDateTime(txtToDate.Text) + "'", conn);
            //Response.Write("select SUM(amount) from DC_Transaction where toDCID='" + Session["DCID"].ToString() + "' and DOT>='" + lastIT + "' and DOT<='" + Convert.ToDateTime(txtToDate.Text) + "'");            
            totalIncome = (int)com3.ExecuteScalar();
            lblAmount.Text = ((totalIncome * 5) / 100).ToString();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}