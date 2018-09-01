<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" 
    CodeFile="Index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 89%;
        }
        .stylehead
        {
            color: #FFFFFF;
            font-size: x-large;
            background-color: #B6B7BC;
            text-align: center;
            font-size:medium;
        }
        .style2
        {
        }
        .style3
        {
            width: 615px;
            height: 269px;
        }
        .style5
        {
            text-align: center;
        }
        .style7
        {
        }
        .style9
        {
            width: 920px;
            height: 196px;
        }
        .style12
        {
            border-width: 0px;
            width: 344px;
            height: 168px;
        }
        .style16
        {
            width: 98px;
        }
        .auto-style1 {
            width: 254px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        rWelcome to DIGITAL CASH SYSTEM!
    </h2>
    <asp:MultiView ID="mvHome" runat="server">
        <asp:View ID="Login" runat="server">
                    <table width="100%">
                    <tr>
                        <td class="auto-style1">
                            &nbsp;<a href="App_Code/Release.zip"><img alt="secure" class="style12" 
                                src="Images/DigitalCash.jpg" width="254" /></a><br /> Click here to download
                            <br />
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="LinkButton1_Click">Digital Cash Android App</asp:LinkButton>
                        </td>
                        <td>
                            <table class="style1" align="right" border="-1">
                            <tr>
                                <td colspan="2" class="stylehead">LOGIN CUSTOMER</td>
                            </tr>
                            <tr>
                                <td class="style2"> ACCOUNT NUMBER<br /></td>
                                <td>
                                    <asp:TextBox ID="txtAccNo" runat="server"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAccNo" ErrorMessage="Enter Account Number" ForeColor="#993333"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">PASSWORD<br /></td>
                                <td>
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" ForeColor="#993333"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" colspan="2" align="center">
                                    <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Register.aspx">Register [ New User ]</asp:HyperLink>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button1" runat="server" Text="Login" onclick="Button1_Click" /><br />
                                    <asp:Label ID="LoginFailed" runat="server" ForeColor="#993333"></asp:Label>
                                </td>
                            </tr>
                    </table>
                </td>
            </tr>
                        <tr>
                            <td class="auto-style1">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style7" colspan="2">
                                &nbsp;</td>
                        </tr>
        </table>
        
        </asp:View>
        <asp:View ID="LogedIn" runat="server">
            <div class="style5">
&nbsp;<img alt="Digital Cash System" class="style3" 
    src="Images/DigitalCash.png" />
            </div>
            <div>
             <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Since every thing is digitalizing in out world, money remains as physical entities still.
By digitalizing our physical cash in to digital cash, we can achieve the existing drawbacks of the country and can avoid new problems to be faced.
It reduces the Money orders, banking services, ATM services, Internet/mobile banking services, check facilities, etc.
Makes every transactions by every citizens will be recorded in the centralized and secured data warehouse.
One gadget for every transaction(but now we planed to present our gadget as our own stimulation.)</p>
<ul>
<h3>DISADVANTAGES OF EXISTING SYSTEM</h3>
<li>No secure( robbery )</li>
<li>More corruption, bribes (No evidence of transaction)</li>
<li>Income tax cheating(by hiding the actual income and expense)</li>
<li>Currency damage, no change cash is available as required.</li>
<li>Can spend money for illegal expenses.</li>
</ul>
<ul>
<h3>ADVANTAGS OF OUR SYSTEM:</h3>
<li>Full secure</li>
<li>Avoids corruption</li>
<li>Avoids bribes(since every transactions is recorded)</li>
<li>Automatic Income tax payment</li>
<li>No currency damage or wastage or black money sleeping</li>
<li>Reduces the banking services almost</li>
<li>Easy transactions</li>
</ul>
</div>
        </asp:View>
    </asp:MultiView>
    
    
</asp:Content>
