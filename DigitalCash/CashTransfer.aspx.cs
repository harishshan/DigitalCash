using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.IO;

public partial class CashTransfer : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand com1,com2,com3;
    SqlDataReader reader;
    SqlTransaction transaction;
    String DCID, Emailid,way2smsPhNo, way2smsPass,Mobile;
    int amount, dailyLimit, pin,oldAmount,count;

    protected void Page_Load(object sender, EventArgs e)
    {
        DCID = (String)Session["DCID"];
        if (DCID.Equals(""))
        {
            Response.Redirect("Index.aspx");
        }
        way2smsPhNo = ConfigurationManager.AppSettings["way2smsPhNo"].ToString();
        way2smsPass = ConfigurationManager.AppSettings["way2smsPass"].ToString();
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            conn.Open();
            com3 = new SqlCommand("SELECT [PIN],[Amount],[DailyLimit],[Emailid],[MobileNo] FROM [DC_CustomerMaster] WHERE [dcid]=" + Convert.ToInt32(DCID) + "", conn);            
            reader = com3.ExecuteReader();
            while (reader.Read())
            {
                pin = (int)reader[0];
                amount = (int)reader[1];
                dailyLimit = (int)reader[2];
                Emailid = (String)reader[3];
                Mobile = (String)reader[4];
            }
            reader.Dispose();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    protected void ddlCustName_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtDCID.Text = ddlCustName.SelectedItem.Value.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        if (pin.ToString().Equals(txtPin.Text))
        {
            try
            {
                com3 = new SqlCommand("SELECT count(*) FROM [DC_CustomerMaster] where DCID="+Convert.ToInt64(txtDCID.Text)+" and Activation=1", conn);
                count = (int)com3.ExecuteScalar();
                if (count == 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Entered DCID is not a valid one');", true);
                }
                else if(dailyLimit<=Convert.ToInt32(txtAmount.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Amount You Entered Exceeds the DailyLimit');", true);
                }
                else
                {
                    int newAmount = Convert.ToInt32(txtAmount.Text);
                    if ((amount - newAmount) >= 0)
                    {
                        com1 = new SqlCommand("UPDATE DC_CustomerMaster SET AMOUNT = AMOUNT-" + newAmount + " WHERE DCID=" + Convert.ToInt32(DCID.ToString()) + "", conn);
                        com2 = new SqlCommand("UPDATE DC_CustomerMaster SET AMOUNT = AMOUNT+" + newAmount + " WHERE DCID=" + Convert.ToInt32(txtDCID.Text.ToString()) + "", conn);
                        transaction = conn.BeginTransaction();
                        com1.Transaction = transaction;
                        com2.Transaction = transaction;
                        com1.ExecuteNonQuery();
                        com2.ExecuteNonQuery();
                        transaction.Commit();
                        com3 = new SqlCommand("INSERT INTO [DC_Transaction]([FromDCID],[ToDCID],[Amount],[DOT],[Narration]) VALUES('" + DCID + "','" + txtDCID.Text + "'," + newAmount + ",'" + DateTime.Now + "','" + txtNarration.Text + "');SELECT SCOPE_IDENTITY()", conn);
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
                        msg.Body = "Thank you " + DCID + "(Digital Cash Number)<br/>" + "<br/>Your Digital Cash Transfered to " + txtDCID.Text + "(Digital Cash Number) for amount " + newAmount.ToString() + " is successfull" + "<br/> Your Transaction id is " + tid.ToString();
                        msg.From = new MailAddress(ConfigurationManager.AppSettings["emailid"].ToString());
                        msg.To.Add(Emailid);
                        msg.IsBodyHtml = true;
                        //client.Send(msg);
                        msg.Body = "Thank you " + txtDCID.Text + "<br/>" + tid.ToString() + "<br/>Your Digital Cash Transfer from " + DCID + " for amount " + newAmount.ToString() + " is successfull" + "<br/> Your Transaction id is " + tid.ToString();
                        com3 = new SqlCommand("SELECT [Emailid] FROM [DC_CustomerMaster] WHERE [DCID]=" + Convert.ToInt32(txtDCID.Text) + "", conn);
                        Emailid = (String)com3.ExecuteScalar();
                        msg.To.Add(Emailid);
                        //client.Send(msg);
                        //send(way2smsPhNo, way2smsPass, "Your Digital Cash Account is created", Mobile);
                        com3 = new SqlCommand("SELECT [MobileNo] FROM [DC_CustomerMaster] WHERE [DCID]=" + Convert.ToInt32(txtDCID.Text) + "", conn);
                        Mobile = (String)com3.ExecuteScalar();
                        //send(way2smsPhNo, way2smsPass, "Your Digital Cash Account is created", Mobile);
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Congrats! your transaction is completed successfully.');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Sorry you dont have enough balance in your Digital Cash Account.');", true);
                    }
                }                
            }
            catch (Exception ex)
            {
                //transaction.Rollback();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Make Digital Cash Failed Please Try Again');", true);
                Response.Write(ex);
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
    public void send(string uid, string password, string message, string no)
    {
        HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://ubaid.tk/sms/sms.aspx?uid=" + uid + "&pwd=" + password + "&msg=" + message + "&phone=" + no + "&provider=way2sms");
        HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
        System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
        string responseString = respStreamReader.ReadToEnd();
        respStreamReader.Close();
        myResp.Close();
    }
}