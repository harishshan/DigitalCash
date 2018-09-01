<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Contacts" %>

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
    <asp:Repeater ID="Repeater1" runat="server" 
        onitemcommand="Repeater1_ItemCommand" DataSourceID="SqlDataSource1">
        <HeaderTemplate>
            <table>
                <tr class="headerstyle">
                    <td> Customer Name</td>
                    <td> Digital Cash Number</td>
                    <td> Address</td>
                    <td> Mobile Number</td>
                    <td> Email ID</td>
                    <td> Delete / Modify</td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
                <tr class="itemstyle">
                    <td>
                        <asp:Label ID="lblName" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Name")%>'></asp:Label>                        
                    </td>
                    <td>
                        <asp:Label ID="lblDCID" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.CustomerDCID")%>'></asp:Label>                        
                    </td>
                    <td>
                        <asp:Label ID="lblAddress" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Address")%>'></asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Address")%>' Visible="false" EnableViewState="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblMobile" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Mobile")%>'></asp:Label>
                        <asp:TextBox ID="txtMobile" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Mobile")%>' Visible="false" EnableViewState="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.EmailID")%>'></asp:Label>                        
                    </td>
                    <td>
                        <asp:LinkButton ID="lbModify" runat="server" CommandName="modify" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Name")%>' Text="Modify"></asp:LinkButton> / 
                        <asp:LinkButton ID="lbDelete" runat="server" CommandName="delete"  CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Name")%>' Text="Delete"></asp:LinkButton>
                    </td>
                </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
                <tr class="alternatestyle">
                    <td>
                        <asp:Label ID="lblName" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Name")%>'></asp:Label>                        
                    </td>
                    <td>
                        <asp:Label ID="lblDCID" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.CustomerDCID")%>'></asp:Label>                        
                    </td>
                    <td>
                        <asp:Label ID="lblAddress" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Address")%>'></asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Address")%>' Visible="false" EnableViewState="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblMobile" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Mobile")%>'></asp:Label>
                        <asp:TextBox ID="txtMobile" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.Mobile")%>' Visible="false" EnableViewState="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.EmailID")%>'></asp:Label>                        
                    </td>
                    <td>
                        <asp:LinkButton ID="lbModify" runat="server" CommandName="modify" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Name")%>' Text="Modify"></asp:LinkButton> / 
                        <asp:LinkButton ID="lbDelete" runat="server" CommandName="delete"  CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Name")%>' Text="Delete"></asp:LinkButton>
                    </td>
                </tr>
            
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>    
        </FooterTemplate>
        </asp:Repeater>
            <table>
                <tr class="headerstyle">
                    <td> Customer Name</td>
                    <td> Digital Cash Number</td>
                    <td> Address</td>
                    <td> Mobile Number</td>
                    <td> Email ID</td>
                    <td> Create New Contact</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtNewName" runat="server"></asp:TextBox>                        
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewDCID" runat="server"></asp:TextBox>                                                
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewAddress" runat="server"></asp:TextBox>                        
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewMobile" runat="server"></asp:TextBox>                                             
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewEmail" runat="server"></asp:TextBox><br />                        
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                            Text="Add New Customer" />
                     </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtNewName" ErrorMessage="Enter Customer Name" 
                            ForeColor="#993333"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" 
                            ControlToValidate="txtNewDCID" ErrorMessage="Enter Only Numbers" 
                            ForeColor="#993333" MaximumValue="999999" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtNewMobile" ErrorMessage="Enter Valid Mobile Number" 
                            ForeColor="#993333" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtNewEmail" ErrorMessage="Enter Valid EmailID" 
                            ForeColor="#993333" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                    <td></td>
                </tr>

            </table>   
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:constr %>" 
        SelectCommand="SELECT [Name], [Address], [Mobile], [EmailID], [CustomerDCID] FROM [DC_Contacts] WHERE ([DCID] = @DCID)">
        <SelectParameters>
            <asp:SessionParameter Name="DCID" SessionField="DCID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

