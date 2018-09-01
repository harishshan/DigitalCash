<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AccountSummary.aspx.cs" Inherits="AccountSummary" %>

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
                Account Summary</td>
        </tr>
        <tr>
            <td>
                Digital Cash Number</td>
            <td>
                <asp:Label ID="lblDCID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Customer Name</td>
            <td>
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Date Of Birth</td>
            <td>
                <asp:Label ID="lblDOB" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Gender</td>
            <td>
                <asp:Label ID="lblGender" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Daily Limit</td>
            <td>
                <asp:Label ID="lblDailyLimit" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Last Income Tax Paid Date</td>
            <td>
                <asp:Label ID="lblLastIT" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Digital Cash Balance</td>
            <td>
                <asp:Label ID="lblBalance" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Digital Account Opening Date</td>
            <td>
                <asp:Label ID="lblOpenDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Address</td>
            <td>
                <asp:Label ID="lblAddress" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Mobile Number</td>
            <td>
                <asp:Label ID="lblMobile" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Email ID</td>
            <td>
                <asp:Label ID="lblEmail" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

