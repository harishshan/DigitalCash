<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="AccountActivation.aspx.cs" Inherits="AccountActivation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    .headerstyle
    {
        color: #FFFFFF;        
        background-color: #B6B7BC;
    }
    .itemstyle
    {
        color:Black;        
    }
    .alternatestyle
    {
        color: #B6B7BC;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" 
        onitemcommand="Repeater1_ItemCommand">
    <HeaderTemplate>
        <table>
            <tr class="headerstyle">
                    <td> DCID </td>
                    <td> First Name </td>
                    <td> Last Name </td>
                    <td> Date Of Birth </td>
                    <td> Gender </td>
                    <td> Country </td>
                    <td> Mobile No </td>
                    <td> Email ID </td>
                    <td> Account Opening Date </td>
                    <td> Activate / Reject </td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="itemstyle">
            <td>w<%#DataBinder.Eval(Container,"DataItem.DCID")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.FirstName")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.LastName")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.DOB")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.Gender")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.Country")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.MobileNo")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.Emailid")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.OpeningDate")%></td>
            <td>
                <asp:LinkButton ID="lbActivat" runat="server" CommandName="activeate" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.DCID")%>' Text="Activate"></asp:LinkButton> / 
                <asp:LinkButton ID="lbReject" runat="server" CommandName="reject"  CommandArgument='<%#DataBinder.Eval(Container,"DataItem.DCID")%>' Text="Reject"></asp:LinkButton>
            </td>
        </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <tr class="alternatestyle">
            <td>w<%#DataBinder.Eval(Container,"DataItem.DCID")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.FirstName")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.LastName")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.DOB")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.Gender")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.Country")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.MobileNo")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.Emailid")%></td>
            <td><%#DataBinder.Eval(Container,"DataItem.OpeningDate")%></td>
            <td>
                <asp:LinkButton ID="lbActivat" runat="server" CommandName="activate" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.DCID")%>' Text="Activate"></asp:LinkButton> / 
                <asp:LinkButton ID="lbReject" runat="server" CommandName="reject"  CommandArgument='<%#DataBinder.Eval(Container,"DataItem.DCID")%>' Text="Reject"></asp:LinkButton>
            </td>
        </tr>
    </AlternatingItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:constr %>" 
        SelectCommand="SELECT [FirstName], [LastName], [DOB], [Gender], [Country], [DCID], [MobileNo], [Emailid], [OpeningDate] FROM [DC_CustomerMaster] WHERE  [Activation]=0">
    </asp:SqlDataSource>
</asp:Content>

