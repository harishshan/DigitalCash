<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        color: #FFFFFF;
        font-size: x-large;
        background-color: #B6B7BC;
    }
    .style3
    {
            width: 207px;
        }
    .style4
    {
    }
    
        .style5
        {
            width: 134px;
        }
        .style6
        {
            width: 145px;
        }
        .style7
        {
            width: 87px;
        }
    
        .style8
        {
            width: 207px;
            height: 78px;
        }
        .style9
        {
            height: 78px;
        }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
    <tr>
        <td class="style2" colspan="5">
            Register New Account</td>
    </tr>
    <tr>
        <td class="style3">
            NAME</td>
        <td class="style7">
            <asp:DropDownList ID="ddlName" runat="server" onselectedindexchanged="ddlName_SelectedIndexChanged" 
                EnableViewState="true" AutoPostBack="true">
                <asp:ListItem>Mr.</asp:ListItem>
                <asp:ListItem>Ms.</asp:ListItem>
                <asp:ListItem>Mrs.</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
        </td>
        <td class="style5">
            <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RFV1" runat="server" 
                ErrorMessage="Enter First Name" ControlToValidate="txtFName" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
        <td class="style6">
            <asp:TextBox ID="txtMName" runat="server"></asp:TextBox>
            <br />
            <br />
        </td>
        <td>
            <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RFV3" runat="server" 
                ErrorMessage="Enter Last Name" ControlToValidate="txtLName" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            NAME OF THE<asp:RadioButtonList ID="rblFName" runat="server">
                <asp:ListItem Selected="True">FATHER</asp:ListItem>
                <asp:ListItem>GUARDIAN</asp:ListItem>
                <asp:ListItem>HUSBAND</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="style7">
            <asp:DropDownList ID="ddlFName" runat="server">
                <asp:ListItem>Mr.</asp:ListItem>
                <asp:ListItem>Ms.</asp:ListItem>
                <asp:ListItem>Mrs.</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
        </td>
        <td class="style5">
            <asp:TextBox ID="txtFFName" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RFV4" runat="server" 
                ErrorMessage="Enter First Name" ControlToValidate="txtFFName" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
        <td colspan="2">
            <asp:TextBox ID="txtFLName" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RFV6" runat="server" 
                ErrorMessage="Enter Last Name" ControlToValidate="txtFLName" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            DATE OF BIRTH</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ErrorMessage="Enter Date of Birth" ControlToValidate="txtDOB" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                TargetControlID="txtDOB">
            </asp:CalendarExtender>
            
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </td>
    </tr>
    <tr>
        <td class="style8">
            GENDER</td>
        <td class="style9" colspan="4">
            <asp:RadioButtonList ID="rblGender" runat="server" Enabled="False">
                <asp:ListItem Selected="True">Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="style3">
            COUNTRY</td>
        <td class="style4" colspan="4">
            <asp:DropDownList ID="ddlCountry" runat="server" 
                DataSourceID="XmlDataSource1" DataTextField="name" DataValueField="code">
            </asp:DropDownList>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
                DataFile="~/Xml/countries.xml"></asp:XmlDataSource>
        </td>
    </tr>
    <tr>
        <td class="style3">
            MOTHER MAIDEN NAME</td>
        <td class="style4" colspan="2">
            <asp:TextBox ID="txtMFName" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RFV7" runat="server" 
                ErrorMessage="Enter First Name" ControlToValidate="txtMFName" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
        <td colspan="2">
            <asp:TextBox ID="txtMLName" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RFV9" runat="server" 
                ErrorMessage="Enter Last Name" ControlToValidate="txtMLName" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
            <br />
        </td>
    </tr>
    <tr>
        <td class="style3">
            APPLICANT&#39;S MARITAL STATUS</td>
        <td class="style4" colspan="4">
            <asp:DropDownList ID="ddlMarital" runat="server">
                <asp:ListItem>Single</asp:ListItem>
                <asp:ListItem>Married</asp:ListItem>
                <asp:ListItem>Divorced</asp:ListItem>
                <asp:ListItem>Widow</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="5">
            Correspondance Address</td>
    </tr>
    <tr>
        <td class="style3">
            DOOR NUMBER / FLAT NUMBER</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtDoorNo" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV10" runat="server" 
                ErrorMessage="Enter Door Number" ControlToValidate="txtDoorNo" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            STREET / ROAD NAME</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtStreetName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV11" runat="server" 
                ErrorMessage="Enter Street Name" ControlToValidate="txtStreetName" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            NAGAR / AREA / AVENUE</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtArea" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV12" runat="server" 
                ErrorMessage="Enter Area Name" ControlToValidate="txtArea" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            CITY / TOWN / VILLAGE</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtTown" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV13" runat="server" 
                ErrorMessage=" Enter City/Town/Village Name" ControlToValidate="txtTown" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            DISTRICT</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtDistrict" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV14" runat="server" 
                ErrorMessage="Enter District Name" ControlToValidate="txtDistrict" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            STATE</td>
        <td class="style4" colspan="4">
            <asp:DropDownList ID="ddlState" runat="server" 
                DataSourceID="XmlDataSource2" DataTextField="name" DataValueField="code">
            </asp:DropDownList>
            <asp:XmlDataSource ID="XmlDataSource2" runat="server" 
                DataFile="~/Xml/states.xml"></asp:XmlDataSource>
        </td>
    </tr>
    <tr>
        <td class="style3">
            PINCODE</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtPincode" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV15" runat="server" 
                ErrorMessage="Enter Pincode Number" ControlToValidate="txtPincode" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="Enter Valid Pincode Number" ControlToValidate="txtPincode" 
                ForeColor="#993333" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            MOBILE NUMBER</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV17" runat="server" 
                ErrorMessage="Enter Mobile Number" ControlToValidate="txtMobile" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ErrorMessage="Enter valid Mobile number" ControlToValidate="txtMobile" 
                ForeColor="#993333" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            E-MAIL ID</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV18" runat="server" 
                ErrorMessage="Enter Email ID" ControlToValidate="txtEmail" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                ErrorMessage="Enter valid Email ID" ControlToValidate="txtEmail" 
                ForeColor="#993333" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            PAN CARD NUMBER</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtPan" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV19" runat="server" 
                ErrorMessage="Enter PANCARD Number" ControlToValidate="txtPan" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                ErrorMessage="Enter valid PANCARD Number" ControlToValidate="txtPan" 
                ForeColor="#993333" ValidationExpression="[A-Z]{5}\d{4}[A-Z]{1}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            AADHAAR NUMBER</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtAadhaar" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV26" runat="server" 
                ControlToValidate="txtAadhaar" ErrorMessage="Enter AADHAAR Number" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            PASSPORT NUMBER</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtPassport" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            LICENSE NUMBER</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtLicense" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="5">
            PERMANENT ADDRESS
            <asp:CheckBox ID="rbaddress" runat="server" 
                oncheckedchanged="rbaddress_CheckedChanged" 
                Text="Same as Correspondance Address"  AutoPostBack="true" EnableViewState="true"/>
        </td>
    </tr>
    <tr>
        <td class="style3">
            DOOR NUMBER / FLAT NUMBER</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtPDoorNo" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV20" runat="server" 
                ControlToValidate="txtPDoorNo" ErrorMessage="Enter Door Number" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            STREET / ROAD NAME</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtPStreetName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV21" runat="server" 
                ControlToValidate="txtPStreetName" ErrorMessage="Enter Street Name" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            NAGAR / AREA / AVENUE</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtPArea" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV22" runat="server" 
                ControlToValidate="txtPArea" ErrorMessage="Enter Area Name" ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            CITY / TOWN / VILLAGE</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtPTown" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV23" runat="server" 
                ControlToValidate="txtPTown" ErrorMessage="Enter City/Town/VillageName" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            DISTRICT</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtPDistrict" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV24" runat="server" 
                ControlToValidate="txtPDistrict" ErrorMessage="Enter District Name" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            STATE</td>
        <td class="style4" colspan="4">
            <asp:DropDownList ID="ddlPState" runat="server" DataSourceID="XmlDataSource2" 
                DataTextField="name" DataValueField="code">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style3">
            PINCODE</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtPPincode" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV25" runat="server" 
                ControlToValidate="txtPPincode" ErrorMessage="Enter Pincode Number" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="5">
            REFERENCE ADDRESS</td>
    </tr>
    <tr>
        <td class="style3">
            REFERENCE NAME</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtRName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtRName" ErrorMessage="Enter Reference Name" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            ADDRESS</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtRAddress" runat="server" Height="110px" 
                TextMode="MultiLine" Width="341px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtRAddress" ErrorMessage="Enter Reference Address" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            MOBILE NUMBER</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtRMobile" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtRMobile" ErrorMessage="Enter Reference Mobile number" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                ControlToValidate="txtRMobile" ErrorMessage="Enter Valid Mobile Number" 
                ForeColor="#993333" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            EMAIL ID</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtREmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtREmail" ErrorMessage="Enter Refernce EmailID" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                ControlToValidate="txtREmail" ErrorMessage="Enter Valid EmailID" 
                ForeColor="#993333" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="5">
            QUALIFICATION</td>
    </tr>
    <tr>
        <td class="style3">
            EDUCATIONAL QUALIFICATION</td>
        <td class="style4" colspan="4">
            <asp:DropDownList ID="ddlEduQuali" runat="server">
                <asp:ListItem Value="ILLITERATE"></asp:ListItem>
                <asp:ListItem Value="BELOW 10th"></asp:ListItem>
                <asp:ListItem Value="SSLC"></asp:ListItem>
                <asp:ListItem Value="HSC"></asp:ListItem>
                <asp:ListItem Value="UG"></asp:ListItem>
                <asp:ListItem Value="PG"></asp:ListItem>
                <asp:ListItem Value="MASTER'S"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style3">
            DEGREE</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtDegree" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            EMPLOYMENT</td>
        <td class="style4" colspan="4" dir="ltr">
            <asp:RadioButtonList ID="rblEmp" runat="server">
                <asp:ListItem>Business</asp:ListItem>
                <asp:ListItem Value="Salaried Employee"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="style3">
            ANNUAL INCOME</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtAIncome" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="Enter Annual Income" ForeColor="#993333" 
                ControlToValidate="txtAIncome"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ControlToValidate="txtAIncome" ErrorMessage="Enter valid Annual Income" 
                ForeColor="#993333" MaximumValue="1000000000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="5">
            BANK INFORMATION</td>
    </tr>
    <tr>
        <td class="style3">
            BANK NAME</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtBName" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="Enter Bank Name" ForeColor="#993333" 
                ControlToValidate="txtBName" EnableTheming="False"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            BANK ACCOUNT NUMBER</td>
        <td class="style4" colspan="4">
            <asp:TextBox ID="txtBAccNo" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" 
                ErrorMessage="Enter Bank Account Number" ControlToValidate="txtBAccNo" 
                ForeColor="#993333"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="5" align="center">
            <asp:Button ID="Button1" runat="server" Text="Register" 
                onclick="Button1_Click" />
        </td>
    </tr>
</table>
</asp:Content>

