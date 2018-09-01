using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class RegisterStepTwo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //send("9003369782", "1828B", "Thank you " + Session["DCID"].ToString(), Session["Mobile"].ToString());
        lblDCID.Text = Session["DCID"].ToString();
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