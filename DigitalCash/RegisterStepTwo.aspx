<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RegisterStepTwo.aspx.cs" Inherits="RegisterStepTwo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p class="style1">
        <em>Thank you :-)</em><br />
        Your request for <strong>Digital Cash System</strong> has received and it will be processed 
        soon.Your DCID is <asp:Label ID="lblDCID" runat="server" Text="Label"></asp:Label> .Please <em>check your mail</em> for further information For Azure Site customers because they will not get any email so please do note this password[digitalcash] for login)</p>
</asp:Content>

