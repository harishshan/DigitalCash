using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.IO;

public partial class Register : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand com;
    SqlDataReader reader;
    int dcid = 0, activation = 1;
    String password,emailid,emailpassword,way2smsPhNo,way2smsPass;
    protected void Page_Load(object sender, EventArgs e)
    {

        //send("9003369782", "1828B", "hai", "9003369782");
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        password = ConfigurationManager.AppSettings["password"].ToString();
        emailid = ConfigurationManager.AppSettings["emailid"].ToString();
        emailpassword = ConfigurationManager.AppSettings["emailpassword"].ToString();
        //way2smsPhNo = ConfigurationManager.AppSettings["way2smsPhNo"].ToString();
        //way2smsPass = ConfigurationManager.AppSettings["way2smsPass"].ToString();
        Session["DCID"] = "";
        Session["Username"] = "";
        Session["Activation"] = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {            
            conn.Open();
            com = new SqlCommand("SELECT MAX([DCID]) FROM [DC_CustomerMaster]", conn);
            reader = com.ExecuteReader();
            while (reader.Read())
            {
                dcid = (int)reader[0];
            }
            dcid = dcid + 1;
            reader.Dispose();            
            com = new SqlCommand("INSERT INTO [DC_CustomerMaster]([FirstName],[MiddleName],[LastName],[Dependent],[DFirstName],[DLastName],[DOB],[Gender],[Country],[MFirstName],[MLastName],[MartialStatus],[DCID],[Password],[MobileNo],[Emailid],[PanNo],[AadhaarNo],[PassportNo],[LicenseNo],[EduQuali],[Degree],[Employment],[AnnualIncome],[Activation],[PIN],[Amount],[OpeningDate],[DailyLimit],[LastIT]) VALUES('" + txtFName.Text + "','" + txtMName.Text + "','" + txtLName.Text + "','" + rblFName.SelectedItem.Value.ToString() + "','" + txtFFName.Text + "','" + txtFLName.Text + "','" +Convert.ToDateTime(txtDOB.Text)+ "','" + rblGender.SelectedItem.Value.ToString() + "','" + ddlCountry.SelectedItem.Value.ToString() + "','" + txtMFName.Text + "','" + txtMLName.Text + "','" + ddlMarital.SelectedItem.Value.ToString() + "'," + dcid + ",'" + password + "','" + txtMobile.Text + "','" + txtEmail.Text + "','" + txtPan.Text + "','" + txtAadhaar.Text + "','"+txtPassport.Text+"','"+txtLicense.Text+"','"+ddlEduQuali.SelectedItem.Value.ToString()+"','"+txtDegree.Text+"','"+rblEmp.SelectedItem.Value.ToString()+"',"+Convert.ToInt64(txtAIncome.Text)+","+activation+",'123456',0,'"+DateTime.Now+"',20000,'"+DateTime.Now+"')", conn);
            com.ExecuteNonQuery();
            if (rbaddress.Checked)
            {
                com = new SqlCommand("INSERT INTO [DC_AddressInformation]([DCID],[Address],[DoorNo],[StreetName],[Area],[City],[District],[State],[Pincode]) VALUES('" + dcid + "','Both','" + txtDoorNo.Text + "','" + txtStreetName.Text + "','" + txtArea.Text + "','" + txtTown.Text + "','" + txtDistrict.Text + "','" + ddlState.SelectedItem.Value.ToString() + "','" + txtPincode.Text + "')", conn);
                com.ExecuteNonQuery();
            }
            else if (!rbaddress.Checked)
            {
                com = new SqlCommand("INSERT INTO [DC_AddressInformation]([DCID],[Address],[DoorNo],[StreetName],[Area],[City],[District],[State],[Pincode]) VALUES('" + dcid + "','Correspondance','" + txtDoorNo.Text + "','" + txtStreetName.Text + "','" + txtArea.Text + "','" + txtTown.Text + "','" + txtDistrict.Text + "','" + ddlState.SelectedItem.Value.ToString() + "','" + txtPincode.Text + "')", conn);
                com.ExecuteNonQuery();
                com = new SqlCommand("INSERT INTO [DC_AddressInformation]([DCID],[Address],[DoorNo],[StreetName],[Area],[City],[District],[State],[Pincode]) VALUES('" + dcid + "','Permanent','" + txtDoorNo.Text + "','" + txtStreetName.Text + "','" + txtArea.Text + "','" + txtTown.Text + "','" + txtDistrict.Text + "','" + ddlState.SelectedItem.Value.ToString() + "','" + txtPincode.Text + "')", conn);
                com.ExecuteNonQuery();
            }
            com = new SqlCommand("INSERT INTO [DC_Bank]([DCID],[BankName],[AccountNo],[Balance],[Pin])VALUES('"+dcid.ToString()+"','"+txtBName.Text+"','"+txtBAccNo.Text+"',50000,'1234')",conn);
            com.ExecuteNonQuery();
            try
            {
                MailMessage msg = new MailMessage();
                System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                msg.Subject = "Digital Cash System Account Created";
                msg.Body = "Thank you " + txtFName.Text + " " + txtMName.Text + " " + txtLName.Text + "<br/> Your Digital Cash System Account is created successfully :-) <br/> Your Digital Cash Account Number(Login ID) is " + dcid.ToString() + "<br/> Your Default Password is " + password + "<br/> But your account is not activated,After our Digital cash system admin activated your account you get a notification mail form us..<br/> Thanking you";
                msg.From = new MailAddress(emailid);
                msg.To.Add(txtEmail.Text.ToString());
                msg.IsBodyHtml = true;
                client.Host = "smtp.gmail.com";
                System.Net.NetworkCredential basicauthenticationinfo = new System.Net.NetworkCredential(emailid, emailpassword);
                client.Port = int.Parse("587");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicauthenticationinfo;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(msg);
            }
            catch (Exception ex)
            {
                
            }
            Session["DCID"] = dcid.ToString();
            Session["Mobile"] = txtMobile.Text;
            //client.Send(msg);
            //send(way2smsPhNo, way2smsPass, "Thank "+txtFName.Text+",Check Mail for more detail by DigitalCash System", txtMobile.Text);            
            Response.Redirect("RegisterStepTwo.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex.StackTrace);
        }
    }
    protected void  ddlName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlName.SelectedItem.Value.ToString().Equals("Mr."))
            rblGender.SelectedValue="Male";
        else if((ddlName.SelectedItem.Value.ToString().Equals("Ms."))||(ddlName.SelectedItem.Value.ToString().Equals("Mrs.")))
            rblGender.SelectedValue="Female";
        else if(ddlName.SelectedItem.Value.ToString().Equals("Others"))
            rblGender.SelectedValue="Others";
    }
                                            
    protected void rbaddress_CheckedChanged(object sender, EventArgs e)
    {
        if (rbaddress.Checked)
        {
            txtPDoorNo.Enabled = false;
            txtPDoorNo.Text = txtDoorNo.Text;
            txtPStreetName.Enabled = false;
            txtPStreetName.Text = txtStreetName.Text;
            txtPArea.Enabled = false;
            txtPArea.Text = txtArea.Text;
            txtPTown.Enabled = false;
            txtPTown.Text = txtTown.Text;
            txtPDistrict.Enabled = false;
            txtPDistrict.Text = txtDistrict.Text;
            ddlPState.Enabled = false;
            ddlPState.SelectedValue = ddlState.SelectedValue;
            txtPPincode.Enabled = false;
            txtPPincode.Text = txtPincode.Text;
        }
        if (!rbaddress.Checked)
        {
            txtPDoorNo.Enabled = true;
            txtPDoorNo.Text = "";
            txtPStreetName.Enabled = true;
            txtPStreetName.Text = "";
            txtPArea.Enabled = true;
            txtPArea.Text = "";
            txtPTown.Enabled = true;
            txtPTown.Text = "";
            txtPDistrict.Enabled = true;
            txtPDistrict.Text = "";
            ddlPState.Enabled = true;
            ddlPState.SelectedValue = ddlState.SelectedValue;
            txtPPincode.Enabled = true;
            txtPPincode.Text = "";
        }
    }
    public void send(string uid, string password, string message, string no)
    {
        HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://ubaid.tk/sms/sms.aspx?uid=" + uid + "&pwd=" + password + "&msg=" + message + "&phone=" + no + "&provider=Site2sms");
        HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
        System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
        string responseString = respStreamReader.ReadToEnd();
        Response.Write(responseString);
        respStreamReader.Close();
        myResp.Close();        
    }
}