<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Change Credentials.aspx.cs" Inherits="Change_Credentials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 85%;
        }
        .style2
        {
            width: 165px;
        }
        .style3
        {
            width: 138px;
        }
        .headerStyle
        {
            color: #FFFFFF;
            font-size: x-large;
            background-color: #B6B7BC;
            text-align: center;
            font-size:medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Button ID="btnChangePass" runat="server" Text="Change Password" 
                    Width="150px" CausesValidation="False" onclick="btnChangePass_Click" />
                <br />
                <asp:Button ID="btnChangePin" runat="server" Text="Change PIN Number" 
                    Width="150px" CausesValidation="False" onclick="btnChangePin_Click" />
                <br />
                <asp:Button ID="btnChangeDLimit" runat="server" Text="Change Daily Limit" 
                    Width="150px" CausesValidation="False" onclick="btnChangeDLimit_Click" />
            </td>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table class="style1">
                            <tr class="headerStyle">
                                <td colspan="2" >
                                    CHANGE PASSWORD</td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Old Password</td>
                                <td>
                                    <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password"></asp:TextBox>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    New Password</td>
                                <td>
                                    <asp:TextBox ID="txtNewPass" runat="server" style="margin-left: 0px" 
                                        TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtNewPass" ErrorMessage="Enter the New Password" 
                                        ForeColor="#993333"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Re-Type Password</td>
                                <td>
                                    <asp:TextBox ID="txtRePass" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ControlToCompare="txtNewPass" ControlToValidate="txtRePass" 
                                        ErrorMessage="Password and Retype Password not match" ForeColor="#993333"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <asp:Button ID="btnSubChPass" runat="server" Text="Submit" 
                                        onclick="btnSubChPass_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table class="style1">
                            <tr class="headerStyle">
                                <td colspan="2">
                                    CHANGE PIN NUMBER</td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Old PIN Number</td>
                                <td>
                                    <asp:TextBox ID="txtOldPin" runat="server" TextMode="Password"></asp:TextBox>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    New PIN Number</td>
                                <td>
                                    <asp:TextBox ID="txtNewPin" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtNewPin" ErrorMessage="Enter the PIN Number" 
                                        ForeColor="#993333"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Re-Type PIN Number</td>
                                <td>
                                    <asp:TextBox ID="txtRePin" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                        ControlToCompare="txtNewPin" ControlToValidate="txtRePin" 
                                        ErrorMessage="PIN and Retype PIN not match" ForeColor="#993333"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <asp:Button ID="btnSubChPin" runat="server" Text="Submit" 
                                        onclick="btnSubChPin_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <table class="style1">
                            <tr class="headerStyle">
                                <td colspan="2">
                                    CHANGE DAILY LIMIT</td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Current daily Limit :</td>
                                <td>
                                    <asp:Label ID="lblDLimit" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    New Daily Limit</td>
                                <td>
                                    <asp:TextBox ID="txtDLimit" runat="server"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                        ControlToValidate="txtDLimit" ErrorMessage="Enter Only Numbers" 
                                        ForeColor="#993333" MaximumValue="999999" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <asp:Button ID="btnSubChDLimit" runat="server" Text="Submit" 
                                        onclick="btnSubChDLimit_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>

