<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Suppliers.aspx.cs" Inherits="Suppliers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 13: Northwind</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        &nbsp;<img alt="Northwind Solutions" src="Images/Northwind.jpg" /><br />
   </header>
    <section>
    <form id="form1" runat="server">
        <asp:DropDownList ID="ddlSuppliers" runat="server" DataSourceID="sdsCountry" DataTextField="Country" DataValueField="Country" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sdsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT [Country] FROM 
            [tblSuppliers] ORDER BY [Country]"></asp:SqlDataSource>
        
        <asp:DataList ID="dlSuppliers" runat="server" DataKeyField="CompanyName" DataSourceID="sdsCompanyContact">
        <HeaderTemplate>
                <table>
                    <tr>
                        <td class="col1">Company Name</td>
                        <td class="col2">Phone Number</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td class="col1">
                            <asp:Label ID="lblCompanyName" runat="server" 
                                Text='<%# Eval("CompanyName") %>' />
                        </td>
                        <td class="col2">
                            <asp:Label ID="lblPhoneNumber" runat="server" 
                                Text='<%# Eval("Phone") %>' />
                        </td>
                    </tr>
                </table>
                </ItemTemplate>
         <AlternatingItemStyle BackColor="#E3EAEB" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        </asp:DataList>

        <asp:SqlDataSource ID="sdsCompanyContact" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
             ProviderName="<%$ ConnectionStrings:SuppliersConnectionString.ProviderName %>" 
            SelectCommand="SELECT [CompanyName], [Phone] FROM [tblSuppliers] ORDER BY [Country]">
        <SelectParameters>
                <asp:ControlParameter ControlID="ddlSuppliers" Name="CategoryID" PropertyName="SelectedValue" />
            </SelectParameters>
            </asp:SqlDataSource>
    </form>
  </section>
</body>
</html>
