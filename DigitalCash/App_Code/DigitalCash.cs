using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DigitalCash
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class DigitalCash : System.Web.Services.WebService 
{

    SqlConnection con;
    SqlCommand com,com1,com2,com3;
    SqlDataReader reader;
    int pin, amount, dailyLimit,count;
    String Emailid, Mobile;
    SqlTransaction transaction;
    public DigitalCash () 
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() 
    {
        return "Hello World";
    }

        
    [WebMethod]
    public string CashTransfer(int FromDCID,int ToDCID,int TransferAmount,String Narration,String PIN)
    {
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            con.Open();
            com3 = new SqlCommand("SELECT [PIN],[Amount],[DailyLimit],[Emailid],[MobileNo] FROM [DC_CustomerMaster] WHERE [dcid]=" + FromDCID + "", con);
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
            if (pin.ToString().Equals(PIN))
            {
                
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
                con.Open();
                com3 = new SqlCommand("SELECT count(*) FROM [DC_CustomerMaster] where DCID=" + ToDCID + "", con);
                count = (int)com3.ExecuteScalar();
                if (count == 0)
                {
                    return "To DCID Not Fount";
                }
                else if (dailyLimit <= TransferAmount)
                {
                    return "Exceeds DailyLimit";
                }
                else
                {
                    int newAmount = TransferAmount;
                    if ((amount - newAmount) >= 0)
                    {
                        com1 = new SqlCommand("UPDATE DC_CustomerMaster SET AMOUNT = AMOUNT-" + newAmount + " WHERE DCID=" + FromDCID + "", con);
                        com2 = new SqlCommand("UPDATE DC_CustomerMaster SET AMOUNT = AMOUNT+" + newAmount + " WHERE DCID=" + ToDCID + "", con);
                        transaction = con.BeginTransaction();
                        com1.Transaction = transaction;
                        com2.Transaction = transaction;
                        com1.ExecuteNonQuery();
                        com2.ExecuteNonQuery();
                        transaction.Commit();                    
                            
                        com3 = new SqlCommand("INSERT INTO [DC_Transaction]([FromDCID],[ToDCID],[Amount],[DOT],[Narration]) VALUES('" + FromDCID.ToString() + "','" + ToDCID.ToString() + "'," + newAmount + ",'" + DateTime.Now + "','" + Narration + "');SELECT SCOPE_IDENTITY()", con);
                        int tid = Convert.ToInt32(com3.ExecuteScalar());
                        //System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                        //client.Host = "smtp.gmail.com";
                        //System.Net.NetworkCredential basicauthenticationinfo = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["emailid"].ToString(), ConfigurationManager.AppSettings["emailpassword"].ToString());
                        //client.Port = int.Parse("587");
                        //client.EnableSsl = true;
                        //client.UseDefaultCredentials = false;
                        //client.Credentials = basicauthenticationinfo;
                        //client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        //MailMessage msg = new MailMessage();
                        //msg.Subject = "Digital Cash System";
                        //msg.Body = "Thank you " + FromDCID + "(Digital Cash Number)<br/>" + "<br/>Your Digital Cash Transfered to " + ToDCID.ToString() + "(Digital Cash Number) for amount " + newAmount.ToString() + " is successfull" + "<br/> Your Transaction id is " + tid.ToString();
                        //msg.From = new MailAddress(ConfigurationManager.AppSettings["emailid"].ToString());
                        //msg.To.Add(Emailid);
                        //msg.IsBodyHtml = true;
                        //client.Send(msg);
                        //msg.Body = "Thank you " + ToDCID + "<br/>" + tid.ToString() + "<br/>Your Digital Cash Transfer from " + FromDCID + " for amount " + newAmount.ToString() + " is successfull" + "<br/> Your Transaction id is " + tid.ToString();
                        //com3 = new SqlCommand("SELECT [Emailid] FROM [DC_CustomerMaster] WHERE [DCID]=" + ToDCID + "", con);
                        //Emailid = (String)com3.ExecuteScalar();
                        //msg.To.Add(Emailid);
                        //client.Send(msg);
                        ////send(way2smsPhNo, way2smsPass, "Your Digital Cash Account is created", Mobile);
                        //com3 = new SqlCommand("SELECT [MobileNo] FROM [DC_CustomerMaster] WHERE [DCID]=" + ToDCID + "", con);
                        //Mobile = (String)com3.ExecuteScalar();
                        ////send(way2smsPhNo, way2smsPass, "Your Digital Cash Account is created", Mobile);
                        ////ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Congrats! your transaction is completed successfully.');", true);
                        return "true";
                    }
                    else
                    {
                        return "Low Balance";
                    }
                }
            }
            else
            {
                return "PIN Invalid";
            }
        }
        catch (Exception)
        {
            //transaction.Rollback();
            return "Transaction Failed!";
        }
        finally
        {
            //transaction.Commit();
            con.Close();
        }
    }

    [WebMethod]
    public string Login(String DCID,String Pwd)
    {
        try
        {
            //const int keySize = 1024;
            //string publicAndPrivateKey;
            //string publicKey;
            //AsymmetricEncryption.GenerateKeys(keySize, out publicKey, out publicAndPrivateKey);
            //DCID = AsymmetricEncryption.DecryptText(DCID, keySize, publicAndPrivateKey);
            //Pwd = AsymmetricEncryption.DecryptText(Pwd, keySize, publicAndPrivateKey);            
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            con.Open();
            com = new SqlCommand("Select FirstName,password,Activation from DC_CustomerMaster where DCID=" + Convert.ToInt32(DCID) + "", con);
            SqlDataReader read = com.ExecuteReader();
            while (read.Read())
            {
                String Firstname = (String)read[0];
                String password = (string)read[1];
                int activation = Convert.ToInt32(read[2]);
                if (password.Equals(Pwd))
                {
                    if (activation == 1)
                    {
                        return "true";
                    }
                    else
                    {
                        return "false";
                    }
                }
            }
            return "false";
        }
        catch (Exception)
        {
            return "false";
        }
        finally
        {
            con.Close();           
        }
    }    
}
