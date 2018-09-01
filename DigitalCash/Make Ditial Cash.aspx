<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Make Ditial Cash.aspx.cs" Inherits="ReportGeneration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 260px;
        }
        .style3
        {
            color: #FFFFFF;
            font-size: x-large;
            background-color: #B6B7BC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr class="style3">
            <td colspan="2">
                Withdraw Digital Cash</td>
        </tr>
        <tr>
            <td class="style2">
                Digital Cash Number</td>
            <td>
                <asp:Label ID="lblDCID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Digital Cash Current Balance</td>
            <td>
                <asp:Label ID="lblAmount" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Bank Name</td>
            <td>
                <asp:Label ID="lblBankName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Bank Account Number</td>
            <td>
                <asp:Label ID="lblBankAccNo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Amount to be transfered as Digital Cash</td>
            <td>
                <asp:TextBox ID="txtDC" runat="server" ontextchanged="txtDC_TextChanged"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="txtDC" ErrorMessage="Amount must be Numeric" 
                    ForeColor="#993333" MaximumValue="2500000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                PIN</td>
            <td>
                <asp:TextBox ID="txtPin" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr class="style3">
            <td colspan="2" style="text-align: center">
                <asp:Button ID="Button1" runat="server" Text="Generate" 
                    onclick="Button1_Click" OnClientClick="return confirm('Please confirm your transaction');"/>
            </td>
        </tr>
    </table>
</asp:Content>

