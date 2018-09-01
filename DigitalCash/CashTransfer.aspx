<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CashTransfer.aspx.cs" Inherits="CashTransfer" %>

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
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td align="center" bgcolor="#B6B7BC" class="style2" colspan="2">
                CASH TRANSFER</td>
        </tr>
        <tr>
            <td>
                Customer Name</td>
            <td>
                <asp:DropDownList ID="ddlCustName" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerDCID" 
                    onselectedindexchanged="ddlCustName_SelectedIndexChanged" 
                    AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Digital Cash Account Number</td>
            <td>
                <asp:TextBox ID="txtDCID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Amount to be transfered</td>
            <td>
                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Narration</td>
            <td>
                <asp:TextBox ID="txtNarration" runat="server" Height="107px" 
                    TextMode="MultiLine" Width="318px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Pin Number</td>
            <td>
                <asp:TextBox ID="txtPin" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" bgcolor="#B6B7BC">
                <asp:Button ID="Button1" runat="server" Text="Transfer It" 
                    onclick="Button1_Click"  OnClientClick="return confirm('Please confirm your transaction');"/>
            </td>            
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    SelectCommand="SELECT [Name], [CustomerDCID] FROM [DC_Contacts] WHERE ([DCID] = @DCID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="DCID" SessionField="DCID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

