<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Transactions.aspx.cs" Inherits="Transactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
       <script type="text/javascript">
           function printIncome() 
           {
               var prtGrid = document.getElementById('<%=gvIncome.ClientID %>');
               prtGrid.border = 0;
               var prtwin = window.open('', 'PrintIncome', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=1');
               prtwin.document.write(prtGrid.outerHTML);
               prtwin.document.close();
               prtwin.focus();
               prtwin.print();
               prtwin.close();
           }
           function printExpense() 
           {
               var prtGrid = document.getElementById('<%=gvExpense.ClientID %>');
               prtGrid.border = 0;
               var prtwin = window.open('', 'PrintExpense', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=1');
               prtwin.document.write(prtGrid.outerHTML);
               prtwin.document.close();
               prtwin.focus();
               prtwin.print();
               prtwin.close();
           }
           function printIncomeExpense() 
           {
               var prtGrid = document.getElementById('<%=gvIncomeExpense.ClientID %>');
               prtGrid.border = 0;
               var prtwin = window.open('', 'PrintIncome', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=1');
               prtwin.document.write(prtGrid.outerHTML);
               prtwin.document.close();
               prtwin.focus();
               prtwin.print();
               prtwin.close();
           }
    </script>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr class="style2">
            <td>
                Income</td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gvIncome" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource1" 
                    GridLines="None" Width="600px" ForeColor="#333333" PageSize="25">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="TID" HeaderText="Transaction ID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="TID" />
                        <asp:BoundField DataField="DOT" HeaderText="Date Of Transaction" 
                            SortExpression="DOT" />
                        <asp:BoundField DataField="FromDCID" HeaderText="From" 
                            SortExpression="FromDCID" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" 
                            SortExpression="Amount" />
                        <asp:BoundField DataField="Narration" HeaderText="Narration" 
                            SortExpression="Narration" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    SelectCommand="SELECT [TID], [FromDCID], [Amount], [DOT], [Narration] FROM [DC_Transaction] WHERE ([ToDCID] = @ToDCID) ORDER BY [DOT] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="ToDCID" SessionField="DCID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Button ID="btnIncome" runat="server" onclick="btnIncome_Click" 
                    Text="Download as Excel" />
                &nbsp;
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Download as PDF" />
                &nbsp;
                <asp:Button ID="Button4" runat="server" Text="Print"  OnClientClick="printIncome();"/>
                </td>
        </tr>
        <tr>
            <td class="style2">
                Expense</td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gvExpense" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource2" 
                    GridLines="None" Width="600px" ForeColor="#333333" PageSize="25">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="TID" HeaderText="Transaction ID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="TID" />
                        <asp:BoundField DataField="DOT" HeaderText="Date Of Transaction" 
                            SortExpression="DOT" />
                        <asp:BoundField DataField="ToDCID" HeaderText="To" SortExpression="ToDCID" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" 
                            SortExpression="Amount" />
                        <asp:BoundField DataField="Narration" HeaderText="Narration" 
                            SortExpression="Narration" />
                    </Columns>
                    <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    SelectCommand="SELECT [TID], [ToDCID], [Amount], [DOT], [Narration] FROM [DC_Transaction] WHERE ([FromDCID] = @FromDCID) ORDER BY [DOT] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="FromDCID" SessionField="DCID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Button ID="btnExpence" runat="server" onclick="btnExpence_Click" 
                    Text="Download as Excel" />
                &nbsp;
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                    Text="Download as PDF" />
                &nbsp;
                <asp:Button ID="Button5" runat="server" Text="Print" OnClientClick="printExpense();"/>
                </td>
        </tr>
        <tr class="style2">
            <td>Income and Expense</td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gvIncomeExpense" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource3" 
                    GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" 
                    BorderStyle="None" BorderWidth="1px" Width="600px" ForeColor="Black" 
                    PageSize="25">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="TID" HeaderText="Transaction ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="TID" />
                        <asp:BoundField DataField="DOT" HeaderText="Date Of Transaction" 
                            SortExpression="DOT" />
                        <asp:BoundField DataField="FromDCID" HeaderText="From" 
                            SortExpression="FromDCID" />
                        <asp:BoundField DataField="ToDCID" HeaderText="To" 
                            SortExpression="ToDCID" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" 
                            SortExpression="Amount" />
                        <asp:BoundField DataField="Narration" HeaderText="Narration" 
                            SortExpression="Narration" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    SelectCommand="SELECT [TID], [FromDCID], [ToDCID], [Amount], [DOT], [Narration] FROM [DC_Transaction] WHERE (([FromDCID] = @FromDCID) OR ([ToDCID] = @ToDCID)) ORDER BY [DOT] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="FromDCID" SessionField="DCID" Type="String" />
                        <asp:SessionParameter Name="ToDCID" SessionField="DCID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" style="text-align: right">
                <asp:Button ID="btnIncomeExpence" runat="server" 
                    onclick="btnIncomeExpence_Click" Text="Download as Excel" />
            &nbsp;
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Download as PDF" />
            &nbsp;
                <asp:Button ID="Button6" runat="server" Text="Print" 
                    OnClientClick="printIncomeExpense();"/>
            </td>
        </tr>
    </table>
    
</asp:Content>

