<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="DigitalCashGeneration.aspx.cs" Inherits="DigitalCashGeneration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .headerstyle
        {
            color: #FFFFFF;
            font-size: x-large;
            background-color: #B6B7BC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr class="headerstyle">
            <td colspan="2">
                Digital Cash Generation</td>
        </tr>
        <tr>
            <td>
                Digital Cash Number</td>
            <td>
                <asp:TextBox ID="txtDCID" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtDCID" ErrorMessage="Enter DCID" ForeColor="#993333"></asp:RequiredFieldValidator>
&nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtDCID" 
                    ErrorMessage="Enter Valid DCID" ForeColor="#993333" MaximumValue="9999" 
                    MinimumValue="0" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                Amount</td>
            <td>
                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtAmount" ErrorMessage="Enter Amount" ForeColor="#993333"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                    ControlToValidate="txtAmount" ErrorMessage="Enter Only Numbers" 
                    ForeColor="#993333" MaximumValue="99999" MinimumValue="0" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                Re Enter Amount</td>
            <td>
                <asp:TextBox ID="txtREAmount" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtAmount" ControlToValidate="txtREAmount" 
                    ErrorMessage="Amount and Re Enter Amoun not Matched" ForeColor="#993333"></asp:CompareValidator>
            </td>
        </tr>
        <tr class="headerstyle">
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnSubmit" runat="server" onclick="Button1_Click" 
                    Text="Submit" />
            </td>
        </tr>
    </table>
</asp:Content>

