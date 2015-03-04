<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

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
        <label>Choose a category:&nbsp;</label>
        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataSourceID="sdsNorthwind" DataTextField="CategoryName" DataValueField="CategoryID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sdsNorthwind" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [tblCategories]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:DataList ID="dlProducts" runat="server" DataKeyField="ProductID" DataSourceID="sdsProducts">
            <HeaderTemplate>
                <table>
                    <tr>
                        <td class="col1">ID</td>
                        <td class="col2">Product</td>
                        <td class="col3">Unit Price</td>
                        <td class="col4">On Hand</td>
                        <td class="col4">Total</td>
                    </tr>
                </table>
            </HeaderTemplate>
                        <ItemTemplate>
                <table>
                    <tr>
                        <td class="col1">
                            <asp:Label ID="lblID" runat="server" 
                                Text='<%# Eval("ProductID") %>' />
                        </td>
                        <td class="col2">
                            <asp:Label ID="lblName" runat="server" 
                                Text='<%# Eval("ProductName") %>' />
                        </td>
                        <td class="col3">
                            <asp:Label ID="lblUnitPrice" runat="server" 
                                Text='<%# Eval("UnitPrice", "{0:C}") %>' />
                        </td>
                        <td class="col4">
                            <asp:Label ID="lblOnHand" runat="server" 
                                Text='<%# Eval("UnitsInStock") %>' />
                        </td>
                        <td class="col4">
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Eval("Total", "{0:C}") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <AlternatingItemStyle BackColor="#E3EAEB" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:SqlDataSource ID="sdsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ProductID, ProductName, UnitPrice, UnitsInStock, UnitPrice * UnitsInStock AS Total FROM tblProducts WHERE (CategoryID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
    </form>
    </section>
</body>
</html>
