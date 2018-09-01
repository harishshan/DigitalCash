<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="IncomeTaxGeneration.aspx.cs" Inherits="IncomeTaxGeneration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
            <td colspan="5" style="text-align: center">
                Income Tax Generation</td>
        </tr>
        <tr>
            <td>
                From Date</td>
            <td>
                <asp:TextBox ID="txtFromDate" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                To Date</td>
            <td>
                <asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtToDate">
                </asp:CalendarExtender>
            </td>
            <td>
                <asp:Button ID="btnCalculate" runat="server" Text="Calculate" 
                    onclick="btnCalculate_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Income Tax Amount</td>
            <td>
                <asp:Label ID="lblAmount" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                PIN Number</td>
            <td>
                <asp:TextBox ID="txtPIN" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: center">
                <asp:Button ID="btnPay" runat="server" Text="PAY TAX" onclick="btnPay_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

