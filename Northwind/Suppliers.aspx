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
        <label>Choose a country:&nbsp;</label>
        <asp:DropDownList ID="ddlSuppliers" runat="server" DataSourceID="sdsCountry" DataTextField="Country" 
            DataValueField="Country" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sdsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Country] FROM 
            [tblSuppliers] ORDER BY [Country]"></asp:SqlDataSource>   
        <br />
        <br />        
        <asp:DataList ID="dlSuppliers" runat="server" DataKeyField="CompanyName" DataSourceID="sdsCompanyContact">
        <HeaderTemplate>
                <table>
                    <tr>
                        <td class="col2">Company Name</td>
                        <td class="col1">Phone Number</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td class="col2">
                            <asp:Label ID="lblCompanyName" runat="server" 
                                Text='<%# Eval("CompanyName") %>' />
                        </td>
                        <td class="col1">
                            <asp:Label ID="lblPhoneNumber" runat="server" 
                                Text='<%# Eval("Phone") %>' />
                        </td>
                    </tr>
                </table>
                </ItemTemplate>
         <AlternatingItemStyle BackColor="#E3EAEB" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        </asp:DataList>

        <asp:SqlDataSource ID="sdsCompanyContact" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
             ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT [CompanyName], [Phone] FROM [tblSuppliers] WHERE ([Country] = ?) ORDER BY [Country]">
        <SelectParameters>
                <asp:ControlParameter ControlID="ddlSuppliers" Name="Country" 
                    PropertyName="SelectedValue" Type="String"/>
            </SelectParameters>
            </asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="btnPage1" runat="server" PostBackUrl="~/Products.aspx" Text="Products" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSuppliers" runat="server" PostBackUrl="~/Suppliers.aspx" Text="Suppliers" />
    </form>
  </section>
</body>
</html>
